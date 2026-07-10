# meetily-weekly-launcher.ps1
# Mack / myPKA — Meetily Weekly Auto-Launcher
# Runs every Monday 8:00 AM via Task Scheduler ("Meetily Weekly Launcher").
# Reads the current week's calendar events directly from the Google Calendar API
# using OAuth 2.0 (installed-app / desktop flow), then pre-schedules a one-shot
# Task Scheduler task 2 minutes before each qualifying meeting to launch Meetily.exe.
#
# =========================================================================
# GOOGLE CALENDAR API SETUP (one-time, done before the first run)
# =========================================================================
#
# Step 1 — Create a Google Cloud project and enable the Calendar API
#   a. Go to https://console.cloud.google.com/
#   b. Create a new project (any name, e.g. "Meetily Launcher").
#   c. In the sidebar, go to "APIs & Services" -> "Library".
#   d. Search for "Google Calendar API" and click "Enable".
#
# Step 2 — Create OAuth 2.0 credentials
#   a. Go to "APIs & Services" -> "Credentials".
#   b. Click "Create Credentials" -> "OAuth 2.0 Client ID".
#   c. Application type: "Desktop app".  Give it any name.
#   d. Click "Create", then "Download JSON".
#   e. Save the downloaded file as:
#        C:\Users\accol\.config\google-calendar-client.json
#
# Step 3 — First run (OAuth consent)
#   Run this script once manually in a normal (non-elevated) PowerShell window.
#   The script detects no token and opens your default browser to the Google
#   consent page. Sign in, grant access, and copy the authorization code back
#   into the terminal prompt. The token (including refresh_token) is saved to:
#        C:\Users\accol\.config\google-calendar-token.json
#
# Step 4 — Subsequent runs (fully silent)
#   The script checks whether the access_token is expired. If so, it uses the
#   saved refresh_token to get a new access_token automatically — no browser,
#   no prompt. The Task Scheduler weekly trigger handles this going forward.
#
# =========================================================================
# MEETING FILTER RULES
# =========================================================================
#
# ALWAYS EXCLUDE:
#   - All-day events (never meetings).
#   - Any event whose title contains "Stacia" (coworking session, not recorded).
#   - "Camila x Alyssa" occurring on a Tuesday (coworking on Tuesdays, not recorded).
#
# ALWAYS INCLUDE:
#   - "Camila x Alyssa" occurring on a Monday (biweekly recorded session — include).
#   - Any event with a video link in subject/description/location
#     (meet.google, zoom, teams, webex, whereby, loom, bluejeans, gotomeet,
#      skype, discord.gg, around.co, livestorm, etc.).
#   - Any event with at least 1 external attendee (anyone who is not Alyssa).
#   - Any event with duration >= 30 minutes.
#
# TASK NAMING:  MeetilyLaunch-YYYYMMDD-HHMM-slug
# LEAD TIME:    Launch 2 minutes before meeting start.
# AUTO-DELETE:  Task scheduler entry deleted 2 hours after it fires.
# CLEANUP:      All existing MeetilyLaunch-* tasks are removed before recreation
#               so re-runs are fully idempotent.
#
# =========================================================================

$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------
# CONFIG
# ---------------------------------------------------------------
$MeetilyExe       = "C:\Users\accol\AppData\Local\meetily\meetily.exe"
$TaskNamePrefix   = "MeetilyLaunch-"
$LogFile          = "C:\Users\accol\AppData\Local\Temp\meetily-launcher.log"
$LaunchLeadMin    = 2       # minutes before meeting start to fire the task
$MinMeetingMin    = 30      # minimum event duration in minutes to qualify

$TokenPath        = "C:\Users\accol\.config\google-calendar-token.json"
$ClientPath       = "C:\Users\accol\.config\google-calendar-client.json"
$CalendarId       = "accoleman100@gmail.com"
$GoogleTokenUrl   = "https://oauth2.googleapis.com/token"
$GoogleAuthUrl    = "https://accounts.google.com/o/oauth2/v2/auth"
$CalendarScope    = "https://www.googleapis.com/auth/calendar.readonly"
$MyEmail          = "accoleman100@gmail.com"   # Alyssa's own address — used to identify external attendees

# ---------------------------------------------------------------
# LOGGING
# ---------------------------------------------------------------
function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $entry = "[{0}] [{1}] {2}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Level, $Message
    Add-Content -Path $LogFile -Value $entry
    Write-Host $entry
}

# ---------------------------------------------------------------
# VALIDATE ENVIRONMENT
# ---------------------------------------------------------------
Write-Log "Meetily Weekly Launcher starting (Google Calendar API mode)."

if (-not (Test-Path $MeetilyExe)) {
    Write-Log "ERROR: Meetily.exe not found at: $MeetilyExe" "ERROR"
    Write-Log "Update the `$MeetilyExe variable and re-run." "ERROR"
    exit 1
}

if (-not (Test-Path $ClientPath)) {
    Write-Log "ERROR: Google OAuth client file not found at: $ClientPath" "ERROR"
    Write-Log "See SETUP STEP 2 in the script header." "ERROR"
    exit 1
}

# ---------------------------------------------------------------
# LOAD CLIENT CREDENTIALS
# ---------------------------------------------------------------
$client = Get-Content $ClientPath -Raw | ConvertFrom-Json

# The client_secret JSON Google generates has a top-level key that varies:
# "installed" for Desktop apps, "web" for web apps. We handle both.
if ($client.PSObject.Properties.Name -contains "installed") {
    $clientId     = $client.installed.client_id
    $clientSecret = $client.installed.client_secret
    $redirectUri  = ($client.installed.redirect_uris | Where-Object { $_ -match "localhost|urn:ietf" } | Select-Object -First 1)
    if (-not $redirectUri) { $redirectUri = "urn:ietf:wg:oauth:2.0:oob" }
}
elseif ($client.PSObject.Properties.Name -contains "web") {
    $clientId     = $client.web.client_id
    $clientSecret = $client.web.client_secret
    $redirectUri  = "urn:ietf:wg:oauth:2.0:oob"
}
else {
    Write-Log "ERROR: Unrecognised client_secret JSON format in $ClientPath" "ERROR"
    exit 1
}

# ---------------------------------------------------------------
# TOKEN MANAGEMENT — refresh or obtain via browser flow
# ---------------------------------------------------------------
function Get-AccessToken {
    # Returns a valid access_token string.

    # --- Try existing token file ---
    if (Test-Path $TokenPath) {
        $token = Get-Content $TokenPath -Raw | ConvertFrom-Json

        # Check expiry. Tokens live ~3600 s; we treat anything with < 60 s left as expired.
        $expiresAt = [datetime]::Parse($token.expires_at)
        if ((Get-Date) -lt $expiresAt.AddSeconds(-60)) {
            Write-Log "Using cached access token (expires $($token.expires_at))."
            return $token.access_token
        }

        # --- Refresh ---
        if ($token.refresh_token) {
            Write-Log "Access token expired — refreshing silently."
            $body = @{
                client_id     = $clientId
                client_secret = $clientSecret
                refresh_token = $token.refresh_token
                grant_type    = "refresh_token"
            }
            try {
                $resp = Invoke-RestMethod -Uri $GoogleTokenUrl -Method Post -Body $body -ContentType "application/x-www-form-urlencoded"
                $token.access_token = $resp.access_token
                $token.expires_at   = (Get-Date).AddSeconds($resp.expires_in).ToString("o")
                # refresh_token is not re-issued on refresh; keep the existing one
                $token | ConvertTo-Json | Set-Content $TokenPath
                Write-Log "Token refreshed successfully."
                return $token.access_token
            }
            catch {
                Write-Log "Token refresh failed: $($_.Exception.Message)" "WARN"
                Write-Log "Will fall through to browser-based consent." "WARN"
            }
        }
    }

    # --- Browser-based consent flow ---
    Write-Log "No valid token found — starting OAuth consent flow."
    $authParams = @{
        client_id     = $clientId
        redirect_uri  = $redirectUri
        response_type = "code"
        scope         = $CalendarScope
        access_type   = "offline"
        prompt        = "consent"
    }
    $queryString = ($authParams.GetEnumerator() | ForEach-Object {
        "$([Uri]::EscapeDataString($_.Key))=$([Uri]::EscapeDataString($_.Value))"
    }) -join "&"
    $authUri = "${GoogleAuthUrl}?${queryString}"

    Write-Log "Opening browser for Google OAuth consent..."
    Start-Process $authUri

    Write-Host ""
    Write-Host "==================================================================="
    Write-Host " A browser window has opened for Google OAuth consent."
    Write-Host " Sign in with accoleman100@gmail.com, grant access, then"
    Write-Host " copy the authorization code shown on the page and paste it below."
    Write-Host "==================================================================="
    Write-Host ""
    $authCode = Read-Host "Paste the authorization code here"

    $body = @{
        client_id     = $clientId
        client_secret = $clientSecret
        code          = $authCode
        redirect_uri  = $redirectUri
        grant_type    = "authorization_code"
    }
    $resp = Invoke-RestMethod -Uri $GoogleTokenUrl -Method Post -Body $body -ContentType "application/x-www-form-urlencoded"

    $tokenObj = [PSCustomObject]@{
        access_token  = $resp.access_token
        refresh_token = $resp.refresh_token
        expires_at    = (Get-Date).AddSeconds($resp.expires_in).ToString("o")
        token_type    = $resp.token_type
    }

    # Ensure config dir exists
    $configDir = Split-Path $TokenPath
    if (-not (Test-Path $configDir)) { New-Item -ItemType Directory -Path $configDir | Out-Null }

    $tokenObj | ConvertTo-Json | Set-Content $TokenPath
    Write-Log "Token obtained and saved to $TokenPath."
    return $resp.access_token
}

$accessToken = Get-AccessToken

# ---------------------------------------------------------------
# COMPUTE WEEK WINDOW (Mon 00:00 to Sun 23:59:59 local time)
# ---------------------------------------------------------------
$today     = (Get-Date).Date
$dayOfWeek = [int](Get-Date).DayOfWeek   # 0=Sun, 1=Mon ... 6=Sat
$daysToMon = if ($dayOfWeek -eq 0) { -6 } else { 1 - $dayOfWeek }
$weekStart = $today.AddDays($daysToMon)
$weekEnd   = $weekStart.AddDays(7).AddSeconds(-1)

# Google Calendar API uses RFC3339 UTC
$timeMin = $weekStart.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
$timeMax = $weekEnd.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")

Write-Log ("Week window (local): {0:yyyy-MM-dd} Mon 00:00 to {1:yyyy-MM-dd} Sun 23:59:59" -f $weekStart, $weekEnd)

# ---------------------------------------------------------------
# FETCH EVENTS FROM GOOGLE CALENDAR API
# ---------------------------------------------------------------
$headers = @{ Authorization = "Bearer $accessToken" }

# Build query — singleEvents=true expands recurring events
$calApiUrl = "https://www.googleapis.com/calendar/v3/calendars/{0}/events" -f [Uri]::EscapeDataString($CalendarId)
$calParams = "singleEvents=true&orderBy=startTime&timeMin={0}&timeMax={1}&maxResults=500" -f `
    [Uri]::EscapeDataString($timeMin), [Uri]::EscapeDataString($timeMax)

try {
    $response = Invoke-RestMethod -Uri "${calApiUrl}?${calParams}" -Headers $headers -Method Get
}
catch {
    Write-Log "Google Calendar API call failed: $($_.Exception.Message)" "ERROR"
    Write-Log "Check that the token is valid and the Calendar API is enabled in your Cloud project." "ERROR"
    exit 1
}

$rawItems = $response.items
Write-Log "Raw events returned from Google Calendar: $($rawItems.Count)"

# ---------------------------------------------------------------
# VIDEO LINK DETECTION PATTERN
# ---------------------------------------------------------------
$videoPattern = 'meet\.google|zoom\.us|teams\.microsoft|webex|whereby|loom\.com|bluejeans|gotomeet|skype|discord\.gg|around\.co|livestorm'

# ---------------------------------------------------------------
# FILTER EVENTS USING EXPLICIT RULES
# ---------------------------------------------------------------
function Test-IsMeeting {
    param($Item)

    $subject  = if ($Item.summary)       { $Item.summary }       else { "" }
    $desc     = if ($Item.description)   { $Item.description }   else { "" }
    $location = if ($Item.location)      { $Item.location }      else { "" }
    $combined = "$subject $desc $location"

    # All-day events have a "date" key instead of "dateTime" — exclude them
    if ($Item.start.PSObject.Properties.Name -notcontains "dateTime") {
        Write-Log ("  EXCLUDE all-day: '{0}'" -f $subject)
        return $false
    }

    $startDt = [datetime]::Parse($Item.start.dateTime).ToLocalTime()
    $endDt   = [datetime]::Parse($Item.end.dateTime).ToLocalTime()
    $durationMin = ($endDt - $startDt).TotalMinutes
    $dayOfWeekNum = [int]$startDt.DayOfWeek   # 0=Sun, 1=Mon, 2=Tue, ...

    # EXCLUDE — contains "Stacia" (coworking, never record)
    if ($subject -match "Stacia") {
        Write-Log ("  EXCLUDE Stacia coworking: '{0}'" -f $subject)
        return $false
    }

    # EXCLUDE — "Camila x Alyssa" on Tuesday (coworking, not a recorded meeting)
    if ($subject -match "Camila.{0,5}Alyssa" -and $dayOfWeekNum -eq 2) {
        Write-Log ("  EXCLUDE Camila x Alyssa Tuesday: '{0}'" -f $subject)
        return $false
    }

    # INCLUDE — "Camila x Alyssa" on Monday (biweekly recorded session)
    if ($subject -match "Camila.{0,5}Alyssa" -and $dayOfWeekNum -eq 1) {
        Write-Log ("  INCLUDE Camila x Alyssa Monday: '{0}'" -f $subject)
        return $true
    }

    # INCLUDE — video link detected in subject, description, or location
    if ($combined -match $videoPattern) {
        Write-Log ("  INCLUDE video link: '{0}'" -f $subject)
        return $true
    }

    # INCLUDE — at least 1 external attendee (someone who is not Alyssa)
    $attendees = $Item.attendees
    if ($attendees) {
        $externalCount = ($attendees | Where-Object {
            $_.email -and ($_.email -ne $MyEmail) -and ($_.email -notmatch "^resource\.")
        }).Count
        if ($externalCount -ge 1) {
            Write-Log ("  INCLUDE external attendee(s) ({0}): '{1}'" -f $externalCount, $subject)
            return $true
        }
    }

    # INCLUDE — duration >= 30 minutes
    if ($durationMin -ge $MinMeetingMin) {
        Write-Log ("  INCLUDE duration {0} min: '{1}'" -f [int]$durationMin, $subject)
        return $true
    }

    Write-Log ("  SKIP (no qualifying criteria): '{0}' ({1} min)" -f $subject, [int]$durationMin)
    return $false
}

# Build the filtered event list with parsed datetimes for later use
$events = @()
foreach ($item in $rawItems) {
    if (Test-IsMeeting -Item $item) {
        $startLocal = [datetime]::Parse($item.start.dateTime).ToLocalTime()
        $endLocal   = [datetime]::Parse($item.end.dateTime).ToLocalTime()
        $events += [PSCustomObject]@{
            Subject         = if ($item.summary) { $item.summary } else { "(no title)" }
            StartTime       = $startLocal
            EndTime         = $endLocal
            DurationMinutes = ($endLocal - $startLocal).TotalMinutes
        }
    }
}

Write-Log "Qualifying meetings this week after filter: $($events.Count)"

# ---------------------------------------------------------------
# CLEAN UP OLD MEETILY TASKS (idempotent)
# ---------------------------------------------------------------
Write-Log "Removing existing MeetilyLaunch-* tasks..."
try {
    $oldTasks = Get-ScheduledTask -TaskName "$TaskNamePrefix*" -ErrorAction SilentlyContinue
    if ($oldTasks) {
        foreach ($t in $oldTasks) {
            Unregister-ScheduledTask -TaskName $t.TaskName -Confirm:$false
            Write-Log "Deleted old task: $($t.TaskName)"
        }
    }
    else {
        Write-Log "No existing MeetilyLaunch-* tasks found."
    }
}
catch {
    Write-Log "Warning while removing old tasks: $($_.Exception.Message)" "WARN"
}

# ---------------------------------------------------------------
# CREATE NEW ONE-SHOT TASKS — ONE PER QUALIFYING MEETING
# ---------------------------------------------------------------
$scheduled = 0
$skipped   = 0

foreach ($evt in $events) {
    $launchTime = $evt.StartTime.AddMinutes(-$LaunchLeadMin)

    # Skip events whose launch window is already in the past
    if ($launchTime -le (Get-Date)) {
        Write-Log ("Skipping past/imminent event: '{0}' at {1:HH:mm}" -f $evt.Subject, $evt.StartTime)
        $skipped++
        continue
    }

    # Build safe task name: MeetilyLaunch-20260603-0900-standup
    $safeSubject = ($evt.Subject -replace '[^a-zA-Z0-9]', '-') -replace '-+', '-'
    $safeSubject = $safeSubject.Trim('-')
    if ($safeSubject.Length -gt 30) { $safeSubject = $safeSubject.Substring(0, 30) }
    $taskName = "{0}{1}-{2}-{3}" -f `
        $TaskNamePrefix,
        $evt.StartTime.ToString("yyyyMMdd"),
        $evt.StartTime.ToString("HHmm"),
        $safeSubject

    # Task action: launch Meetily as the current user
    $action = New-ScheduledTaskAction `
        -Execute "powershell.exe" `
        -Argument ("-NonInteractive -WindowStyle Hidden -Command ""Start-Process '{0}'""" -f $MeetilyExe)

    # One-shot trigger at launch time
    $trigger = New-ScheduledTaskTrigger -Once -At $launchTime

    # Run as current user, interactive session only
    $principal = New-ScheduledTaskPrincipal `
        -UserId ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name) `
        -LogonType Interactive `
        -RunLevel Limited

    # Auto-delete 2 hours after firing; run if missed within the session
    $settings = New-ScheduledTaskSettingsSet `
        -StartWhenAvailable `
        -ExecutionTimeLimit (New-TimeSpan -Minutes 2) `
        -DeleteExpiredTaskAfter (New-TimeSpan -Hours 2)

    try {
        Register-ScheduledTask `
            -TaskName $taskName `
            -Action $action `
            -Trigger $trigger `
            -Principal $principal `
            -Settings $settings `
            -Description ("Auto-launch Meetily 2 min before: {0} at {1:HH:mm}" -f $evt.Subject, $evt.StartTime) `
            -Force | Out-Null

        Write-Log ("Scheduled: '{0}' — task fires at {1:HH:mm}, meeting at {2:HH:mm}" -f `
            $evt.Subject, $launchTime, $evt.StartTime)
        $scheduled++
    }
    catch {
        Write-Log ("Failed to register task for '{0}': {1}" -f $evt.Subject, $_.Exception.Message) "ERROR"
    }
}

# ---------------------------------------------------------------
# SUMMARY
# ---------------------------------------------------------------
Write-Log "Done. Scheduled: $scheduled | Skipped (past): $skipped | Log: $LogFile"

<#
=======================================================================
FIRST-TIME TASK SCHEDULER REGISTRATION
=======================================================================
Run this block ONCE in an elevated PowerShell to register the weekly trigger.
The main script above handles the per-meeting one-shot tasks automatically
every Monday at 8:00 AM once this parent task is registered.

$scriptPath = 'C:\Users\accol\OneDrive\Desktop\the-house\Team Knowledge\Automations\meetily-weekly-launcher.ps1'

$action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument ("-NonInteractive -ExecutionPolicy Bypass -File `"$scriptPath`"")

$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At "08:00AM"

$principal = New-ScheduledTaskPrincipal `
    -UserId ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name) `
    -LogonType Interactive `
    -RunLevel Limited

$settings = New-ScheduledTaskSettingsSet `
    -StartWhenAvailable `
    -ExecutionTimeLimit (New-TimeSpan -Minutes 5)

Register-ScheduledTask `
    -TaskName "Meetily Weekly Launcher" `
    -Action $action `
    -Trigger $trigger `
    -Principal $principal `
    -Settings $settings `
    -Description "Reads Google Calendar via API and pre-schedules Meetily launches for the week." `
    -Force

Write-Host "Registered: Meetily Weekly Launcher (runs every Monday 8:00 AM)"
=======================================================================
#>
