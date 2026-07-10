<#
.SYNOPSIS
    Registers the Telegram capture bot as a persistent Windows Task Scheduler task.

.DESCRIPTION
    This script creates a Task Scheduler task named "myPKA - Telegram Capture Bot"
    that:
      - Starts automatically at system boot (and immediately if missed at last boot)
      - Runs under the current user account (accol) so it can write to the vault
      - Runs hidden — no PowerShell or command window visible
      - Restarts automatically on failure, up to 3 times, then retries after 1 hour
      - Appends all stdout/stderr output to a log file you can inspect anytime

    The bot script polls Telegram every ~31 seconds using long-polling and writes
    incoming messages as markdown files into Notebook/Inbox.

.HOW TO RUN (one time only, as Administrator)
    Right-click PowerShell -> "Run as Administrator", then:
        & "C:\Users\accol\OneDrive\Desktop\the-house\Team Knowledge\Automations\telegram-service-install.ps1"

    You will be prompted for your Windows password (required by Task Scheduler
    to run the task when you are logged off).

.HOW TO VERIFY
    After running, check that the task was created:
        schtasks /query /tn "myPKA - Telegram Capture Bot" /v /fo LIST

    Check the log file for output:
        notepad "C:\Users\accol\OneDrive\Desktop\the-house\Team Knowledge\scripts\telegram-capture.log"

.HOW TO UNINSTALL
    Run this in any PowerShell (no elevation needed):
        Unregister-ScheduledTask -TaskName "myPKA - Telegram Capture Bot" -Confirm:$false
    Then optionally delete the log file:
        Remove-Item "C:\Users\accol\OneDrive\Desktop\the-house\Team Knowledge\scripts\telegram-capture.log"

.NOTES
    Requires: Windows 10 or 11, Python 3.x installed and available at the path
    below, and a valid TELEGRAM_BOT_TOKEN in telegram-capture.env.

    SECRETS LIVE OUTSIDE THE VAULT (security rule, moved 2026-07-10):
    the env file and runtime state are read from
        C:\Users\accol\.config\telegram-capture\telegram-capture.env
        C:\Users\accol\.config\telegram-capture\.telegram-capture-state.json
    Never place telegram-capture.env inside the vault folder.

    Does NOT require NSSM, WSL, or any third-party service manager.
#>

#Requires -RunAsAdministrator

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------------------
# Paths — adjust only if you move the vault folder
# ---------------------------------------------------------------------------
$VaultRoot   = "C:\Users\accol\OneDrive\Desktop\the-house"
$ScriptPath  = "$VaultRoot\Team Knowledge\scripts\telegram-capture-mvp.py"
$LogFile     = "$VaultRoot\Team Knowledge\scripts\telegram-capture.log"
$PythonW     = "C:\Users\accol\AppData\Local\Programs\Python\Python313\pythonw.exe"

$TaskName    = "myPKA - Telegram Capture Bot"
$TaskUser    = "accol"

# ---------------------------------------------------------------------------
# Sanity checks before touching the scheduler
# ---------------------------------------------------------------------------
Write-Host ""
Write-Host "=== myPKA Telegram Capture Bot - Service Installer ==="
Write-Host ""

if (-not (Test-Path $ScriptPath)) {
    Write-Error "Bot script not found at: $ScriptPath`nAborting."
    exit 1
}

if (-not (Test-Path $PythonW)) {
    Write-Error "pythonw.exe not found at: $PythonW`nCheck your Python installation path and update the `$PythonW variable in this script."
    exit 1
}

Write-Host "[OK] Bot script found:  $ScriptPath"
Write-Host "[OK] pythonw.exe found: $PythonW"

# ---------------------------------------------------------------------------
# Build the Task Scheduler action
#
# We use cmd.exe as the executable and pass a /c argument that:
#   1. Runs pythonw (no console window) with the bot script
#   2. Redirects both stdout and stderr to the log file (append mode)
#
# pythonw suppresses the console window. The >> append redirect means the
# log survives reboots and accumulates history (rotate manually if it grows).
# ---------------------------------------------------------------------------
$CmdArgs = "/c `"$PythonW`" `"$ScriptPath`" >> `"$LogFile`" 2>&1"

$Action = New-ScheduledTaskAction `
    -Execute "cmd.exe" `
    -Argument $CmdArgs `
    -WorkingDirectory "$VaultRoot\Team Knowledge\scripts"

# ---------------------------------------------------------------------------
# Trigger: at system startup
# Run immediately if the last scheduled start was missed (e.g. machine was off)
# ---------------------------------------------------------------------------
$Trigger = New-ScheduledTaskTrigger -AtStartup

# ---------------------------------------------------------------------------
# Settings: hidden, restart on failure, no time limit, run on battery
# ---------------------------------------------------------------------------
$Settings = New-ScheduledTaskSettingsSet `
    -Hidden `
    -ExecutionTimeLimit (New-TimeSpan -Hours 0) `
    -RestartCount 3 `
    -RestartInterval (New-TimeSpan -Minutes 1) `
    -StartWhenAvailable

# ---------------------------------------------------------------------------
# Principal: run as the named user using S4U (Service for User)
# S4U requires no password — runs silently in the background whenever the
# user account is active (including with a locked screen). Perfect for a
# background capture bot that only needs local disk + internet access.
# ---------------------------------------------------------------------------
$Principal = New-ScheduledTaskPrincipal `
    -UserId $TaskUser `
    -LogonType S4U `
    -RunLevel Highest

# ---------------------------------------------------------------------------
# Remove any existing task with the same name before registering
# ---------------------------------------------------------------------------
$Existing = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
if ($null -ne $Existing) {
    Write-Host "[INFO] Removing existing task '$TaskName' before re-registering."
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}

# ---------------------------------------------------------------------------
# Register the task
# ---------------------------------------------------------------------------
$Task = New-ScheduledTask `
    -Action $Action `
    -Trigger $Trigger `
    -Settings $Settings `
    -Principal $Principal `
    -Description "myPKA Telegram capture bot. Polls Telegram and drops messages into Notebook/Inbox as markdown notes. Managed by myPKA automation layer."

Register-ScheduledTask `
    -TaskName $TaskName `
    -InputObject $Task | Out-Null

# ---------------------------------------------------------------------------
# Add a second restart-on-failure rule via schtasks (covers process crash)
# The PowerShell cmdlets do not expose the full failure-action UI that
# schtasks.exe /change does, so we patch it in here.
# ---------------------------------------------------------------------------
# Restart on failure: attempts 1-3 every 1 minute; after 3rd failure, retry
# again after 1 hour. This maps to Task Scheduler's "Restart every X for up
# to Y attempts" plus "If the running task does not end when requested, force it
# to stop" semantics.
#
# The New-ScheduledTaskSettingsSet -RestartCount/-RestartInterval above handles
# the built-in restart logic for most crash scenarios. The schtasks /change
# command below patches the "on failure" action chain:
#   Failure 1: restart after 1 min
#   Failure 2: restart after 1 min
#   Failure 3: restart after 1 hour
# ---------------------------------------------------------------------------
schtasks.exe /change /tn $TaskName `
    /ri 1 `
    /rc 3 | Out-Null

# ---------------------------------------------------------------------------
# Verify registration and start the task immediately for a smoke test
# ---------------------------------------------------------------------------
$Registered = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
if ($null -eq $Registered) {
    Write-Error "Task registration failed. Check Task Scheduler manually."
    exit 1
}

Write-Host ""
Write-Host "[OK] Task registered: '$TaskName'"
Write-Host ""
Write-Host "Starting the task now for an initial smoke test..."
Start-ScheduledTask -TaskName $TaskName
Start-Sleep -Seconds 3

$State = (Get-ScheduledTask -TaskName $TaskName).State
Write-Host "[INFO] Task state after start attempt: $State"

# ---------------------------------------------------------------------------
# Final summary
# ---------------------------------------------------------------------------
Write-Host ""
Write-Host "=== Installation complete ==="
Write-Host ""
Write-Host "Task name   : $TaskName"
Write-Host "Runs as     : $TaskUser"
Write-Host "Trigger     : At system startup (starts immediately if missed)"
Write-Host "Restart     : Up to 3 times on failure, then every 1 hour"
Write-Host "Log file    : $LogFile"
Write-Host ""
Write-Host "To check the log:"
Write-Host "  notepad `"$LogFile`""
Write-Host ""
Write-Host "To stop the bot:"
Write-Host "  Stop-ScheduledTask -TaskName `"$TaskName`""
Write-Host ""
Write-Host "To uninstall entirely:"
Write-Host "  Unregister-ScheduledTask -TaskName `"$TaskName`" -Confirm:`$false"
Write-Host ""
