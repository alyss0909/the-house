# meetily-weekly-launcher.ps1
# Mack / myPKA - Meetily Weekly Auto-Launcher (HEADLESS / iCal edition)
# Runs every Monday 8:00 AM via Task Scheduler ("Meetily Weekly Launcher").
#
# Reads the current week's calendar from Alyssa's PRIVATE "Secret address in
# iCal format" (.ics) feed over plain HTTPS. No Google Cloud project, no OAuth,
# no browser, no Claude/MCP dependency - it runs fully unattended under the
# weekly Task Scheduler trigger. For each qualifying meeting it pre-schedules a
# one-shot Task Scheduler task 2 minutes before the meeting to launch Meetily.
#
# =========================================================================
# ONE-TIME SETUP (all Alyssa has to do)
# =========================================================================
#
# The script needs ONE thing: her calendar's secret iCal URL, dropped into a
# small local config file. Nothing else. Steps:
#
#   1. Open Google Calendar on the web (calendar.google.com).
#   2. In the left "My calendars" list, hover the "Alyssa Coleman" calendar,
#      click the three-dot menu, choose "Settings and sharing".
#   3. Scroll down to "Secret address in iCal format" and copy that URL
#      (it ends in .ics and contains a long random token - treat it like a
#      password; anyone with it can read the calendar).
#   4. Create/edit the file:  C:\Users\accol\.config\meetily-calendar.json
#      with exactly this content (paste the URL between the quotes):
#
#        {
#          "ical_url": "https://calendar.google.com/calendar/ical/.../basic.ics"
#        }
#
#   That's it. The launcher reads only the primary "Alyssa Coleman" calendar
#   (Google account accoleman100@gmail.com, timezone America/Toronto).
#
# SECURITY: the secret URL lives ONLY in that config file, never in this script
# and never in the repo. If it ever leaks, use "Reset" next to the secret
# address in Google Calendar settings to rotate it, then update the config file.
#
# =========================================================================
# MEETING FILTER RULES  (unchanged from the previous version)
# =========================================================================
#
# ALWAYS EXCLUDE:
#   - All-day events (never meetings).
#   - Any event whose title contains "Stacia" (coworking session, not recorded).
#   - "Camila x Alyssa" occurring on a Tuesday (coworking on Tuesdays).
#
# ALWAYS INCLUDE:
#   - "Camila x Alyssa" occurring on a Monday (biweekly recorded session).
#   - Any event with a video link in subject/description/location.
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
# RECURRING EVENTS (iCal wrinkle)
# =========================================================================
# The secret .ics feed returns raw VEVENTs - recurring meetings arrive as a
# single VEVENT with an RRULE, NOT pre-expanded (the old Google API path used
# singleEvents=true to expand them for us). This script expands recurring
# events into concrete instances for the current Mon-Sun week itself.
#
# HANDLED:  single (non-recurring) events; FREQ=WEEKLY at any INTERVAL
#           (INTERVAL=2 == biweekly, e.g. the "Camila x Alyssa" Monday);
#           BYDAY, UNTIL, COUNT, and EXDATE are honored.
# NOT FULLY HANDLED:  FREQ=DAILY / MONTHLY / YEARLY are NOT expanded - for those
#           only the base DTSTART occurrence is considered (and a WARN is
#           logged). DST boundaries: recurring instances are rebuilt from
#           Toronto wall-clock time, so a meeting keeps its
#           local start time across the spring/fall change (correct behavior).
#           If a recurring meeting type beyond WEEKLY is ever needed, extend
#           Expand-Recurrence below.
# =========================================================================

param(
    # Optional: parse a local .ics file instead of fetching the secret URL
    # (for read-only testing / debugging). Example:
    #   .\meetily-weekly-launcher.ps1 -IcsFile C:\path\to\sample.ics -NoSchedule
    [string]$IcsFile,
    # Optional: parse + log qualifying meetings but do NOT create/delete any
    # scheduled tasks. Safe read-only dry run.
    [switch]$NoSchedule,
    # Optional: target the Mon-Sun week containing this date instead of the
    # current week. Useful for testing next week's tasks before Monday.
    [datetime]$WeekOfDate = [datetime]::MinValue
)

$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------
# CONFIG
# ---------------------------------------------------------------
$MeetilyExe       = "C:\Users\accol\AppData\Local\meetily\meetily.exe"
$TaskNamePrefix   = "MeetilyLaunch-"
$LogFile          = "C:\Users\accol\AppData\Local\Temp\meetily-launcher.log"
$LaunchLeadMin    = 2       # minutes before meeting start to fire the task
$MinMeetingMin    = 30      # minimum event duration in minutes to qualify

$CalConfigPath    = "C:\Users\accol\.config\meetily-calendar.json"
$MyEmail          = "accoleman100@gmail.com"   # Alyssa's address - identifies external attendees
$PrimaryTzId      = "America/Toronto"

# ---------------------------------------------------------------
# LOGGING
# ---------------------------------------------------------------
function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $entry = "[{0}] [{1}] {2}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Level, $Message
    try { Add-Content -Path $LogFile -Value $entry } catch { }
    Write-Host $entry
}

# ---------------------------------------------------------------
# TIMEZONE RESOLUTION
# Windows PowerShell 5.1 (.NET Framework) does not accept IANA tz IDs like
# "America/Toronto" - it needs the Windows ID "Eastern Standard Time".
# PowerShell 7 (.NET 6+) accepts either. Try the ID directly, then fall back
# to a small IANA->Windows map so this works under the 5.1 that the scheduled
# task launches via powershell.exe.
# ---------------------------------------------------------------
$IanaToWindowsTz = @{
    "America/Toronto"     = "Eastern Standard Time"
    "America/New_York"    = "Eastern Standard Time"
    "America/Detroit"     = "Eastern Standard Time"
    "America/Chicago"     = "Central Standard Time"
    "America/Denver"      = "Mountain Standard Time"
    "America/Los_Angeles" = "Pacific Standard Time"
    "America/Vancouver"   = "Pacific Standard Time"
    "Asia/Kolkata"        = "India Standard Time"
    "UTC"                 = "UTC"
}

function Resolve-TimeZone {
    param([string]$TzId)
    try {
        return [System.TimeZoneInfo]::FindSystemTimeZoneById($TzId)
    }
    catch {
        if ($IanaToWindowsTz.ContainsKey($TzId)) {
            return [System.TimeZoneInfo]::FindSystemTimeZoneById($IanaToWindowsTz[$TzId])
        }
        Write-Log "Unknown TZID '$TzId' - falling back to $PrimaryTzId." "WARN"
        return [System.TimeZoneInfo]::FindSystemTimeZoneById($IanaToWindowsTz[$PrimaryTzId])
    }
}

$TorontoTz = Resolve-TimeZone $PrimaryTzId

# ---------------------------------------------------------------
# iCAL DATE PARSING
# Returns a hashtable @{ Instant = [DateTimeOffset]; AllDay = [bool] }.
# Handles three DTSTART/DTEND shapes:
#   - VALUE=DATE (all-day):        20260615
#   - UTC:                         20260615T130000Z
#   - TZID / floating local:       20260615T090000  (with TZID=... param)
# ---------------------------------------------------------------
function ConvertFrom-ICalDate {
    param([string[]]$Params, [string]$Value)

    $tzid   = $null
    $isDate = $false
    foreach ($p in $Params) {
        if ($p -match '^(?i)TZID=(.+)$')   { $tzid = $Matches[1] }
        if ($p -match '^(?i)VALUE=DATE$')  { $isDate = $true }
    }

    # All-day (date only)
    if ($isDate -or ($Value.Length -eq 8 -and $Value -notmatch 'T')) {
        $d   = [datetime]::ParseExact($Value.Substring(0,8), "yyyyMMdd", $null)
        $d   = [datetime]::SpecifyKind($d, 'Unspecified')
        $utc = [System.TimeZoneInfo]::ConvertTimeToUtc($d, $TorontoTz)
        return @{ Instant = [DateTimeOffset]::new([datetime]::SpecifyKind($utc, 'Utc')); AllDay = $true }
    }

    # UTC ("Z" suffix)
    if ($Value.EndsWith('Z')) {
        $naive = [datetime]::ParseExact($Value.TrimEnd('Z'), "yyyyMMddTHHmmss", $null)
        $naive = [datetime]::SpecifyKind($naive, 'Utc')
        return @{ Instant = [DateTimeOffset]::new($naive); AllDay = $false }
    }

    # TZID or floating local
    $naive = [datetime]::ParseExact($Value, "yyyyMMddTHHmmss", $null)
    $naive = [datetime]::SpecifyKind($naive, 'Unspecified')
    $tz    = if ($tzid) { Resolve-TimeZone $tzid } else { $TorontoTz }
    $utc   = [System.TimeZoneInfo]::ConvertTimeToUtc($naive, $tz)
    return @{ Instant = [DateTimeOffset]::new([datetime]::SpecifyKind($utc, 'Utc')); AllDay = $false }
}

# Toronto wall-clock DateTime (Unspecified kind) for a given instant
function Get-TorontoWall {
    param([DateTimeOffset]$Instant)
    return [System.TimeZoneInfo]::ConvertTimeFromUtc($Instant.UtcDateTime, $TorontoTz)
}

# ---------------------------------------------------------------
# ICS LOADING (fetch from secret URL, or read a local file for testing)
# ---------------------------------------------------------------
function Get-ICalText {
    if ($IcsFile) {
        if (-not (Test-Path $IcsFile)) {
            Write-Log "ERROR: -IcsFile not found: $IcsFile" "ERROR"
            exit 1
        }
        Write-Log "Reading calendar from local file: $IcsFile"
        return (Get-Content $IcsFile -Raw)
    }

    if (-not (Test-Path $CalConfigPath)) {
        Write-Log "ERROR: Calendar config not found: $CalConfigPath" "ERROR"
        Write-Log "See ONE-TIME SETUP in the script header - paste the secret iCal URL there." "ERROR"
        exit 1
    }

    $cfg = Get-Content $CalConfigPath -Raw | ConvertFrom-Json
    $url = $cfg.ical_url
    if (-not $url) {
        Write-Log "ERROR: '$CalConfigPath' is missing the 'ical_url' key." "ERROR"
        Write-Log "Expected: { \"ical_url\": \"https://calendar.google.com/calendar/ical/.../basic.ics\" }" "ERROR"
        exit 1
    }

    # Mask the token when logging - never echo the secret URL in full
    $masked = $url -replace '/ical/.+?/basic\.ics$', '/ical/****/basic.ics'
    Write-Log "Fetching calendar from secret iCal feed: $masked"

    $maxAttempts = 4
    for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
        try {
            $resp = Invoke-RestMethod -Uri $url -Method Get -TimeoutSec 30
            return [string]$resp
        }
        catch {
            $wait = [math]::Pow(2, $attempt)   # 2,4,8,16s backoff
            Write-Log "iCal fetch attempt $attempt/$maxAttempts failed: $($_.Exception.Message)" "WARN"
            if ($attempt -eq $maxAttempts) {
                Write-Log "ERROR: could not fetch the iCal feed after $maxAttempts attempts." "ERROR"
                Write-Log "Check the secret URL in $CalConfigPath and network connectivity." "ERROR"
                exit 1
            }
            Start-Sleep -Seconds $wait
        }
    }
}

# ---------------------------------------------------------------
# ICS PARSING -> list of raw VEVENT property maps
# Unfolds RFC5545 line folding (continuation lines start with space/tab),
# then splits into VEVENT blocks and parses NAME;PARAMS:VALUE lines.
# ---------------------------------------------------------------
function Read-VEvents {
    param([string]$Text)

    # Normalize line endings and unfold
    $rawLines = $Text -replace "`r`n", "`n" -replace "`r", "`n" -split "`n"
    $lines = New-Object System.Collections.Generic.List[string]
    foreach ($ln in $rawLines) {
        if ($ln.Length -gt 0 -and ($ln[0] -eq ' ' -or $ln[0] -eq "`t")) {
            if ($lines.Count -gt 0) {
                $lines[$lines.Count - 1] = $lines[$lines.Count - 1] + $ln.Substring(1)
            }
        }
        else {
            $lines.Add($ln)
        }
    }

    $events   = @()
    $inEvent  = $false
    $current  = $null

    foreach ($ln in $lines) {
        if ($ln -eq "BEGIN:VEVENT") {
            $inEvent = $true
            $current = @{ ATTENDEES = @(); EXDATES = @() }
            continue
        }
        if ($ln -eq "END:VEVENT") {
            if ($current) { $events += $current }
            $inEvent = $false
            $current = $null
            continue
        }
        if (-not $inEvent) { continue }

        $idx = $ln.IndexOf(':')
        if ($idx -lt 0) { continue }
        $left   = $ln.Substring(0, $idx)
        $value  = $ln.Substring($idx + 1)
        $segs   = $left -split ';'
        $name   = $segs[0].ToUpper()
        $params = if ($segs.Count -gt 1) { $segs[1..($segs.Count - 1)] } else { @() }

        switch ($name) {
            "SUMMARY"     { $current["SUMMARY"]     = $value }
            "DESCRIPTION" { $current["DESCRIPTION"] = $value }
            "LOCATION"    { $current["LOCATION"]    = $value }
            "RRULE"       { $current["RRULE"]       = $value }
            "DTSTART"     { $current["DTSTART"]      = ConvertFrom-ICalDate -Params $params -Value $value
                            $current["DTSTART_TZ"]   = ($params | Where-Object { $_ -match '^(?i)TZID=' }) }
            "DTEND"       { $current["DTEND"]        = ConvertFrom-ICalDate -Params $params -Value $value }
            "ATTENDEE"    {
                if ($value -match '(?i)mailto:(.+)$') { $current["ATTENDEES"] += $Matches[1].Trim() }
            }
            "EXDATE"      {
                foreach ($v in ($value -split ',')) {
                    $current["EXDATES"] += (ConvertFrom-ICalDate -Params $params -Value $v.Trim()).Instant
                }
            }
        }
    }
    return $events
}

# ---------------------------------------------------------------
# RECURRENCE EXPANSION
# Given a VEVENT and the current Mon-Sun Toronto week window, returns a list of
# concrete @{ Instant; Duration } start instances that fall inside the week.
# ---------------------------------------------------------------
$ByDayOffset = @{ "MO" = 0; "TU" = 1; "WE" = 2; "TH" = 3; "FR" = 4; "SA" = 5; "SU" = 6 }

function Expand-Recurrence {
    param($Evt, [datetime]$WeekStartTor, [datetime]$WeekEndTor)

    $dtStart = $Evt["DTSTART"]
    if (-not $dtStart) { return @() }
    $startInstant = $dtStart.Instant
    $duration = if ($Evt["DTEND"]) { $Evt["DTEND"].Instant - $startInstant } else { [TimeSpan]::FromMinutes(0) }

    $results = @()

    # --- Non-recurring single event ---
    if (-not $Evt["RRULE"]) {
        $wall = Get-TorontoWall -Instant $startInstant
        if ($wall -ge $WeekStartTor -and $wall -lt $WeekEndTor) {
            $results += @{ Instant = $startInstant; Duration = $duration; AllDay = $dtStart.AllDay }
        }
        return $results
    }

    # --- Parse RRULE ---
    $rrule = @{}
    foreach ($part in ($Evt["RRULE"] -split ';')) {
        $kv = $part -split '=', 2
        if ($kv.Count -eq 2) { $rrule[$kv[0].ToUpper()] = $kv[1] }
    }
    $freq     = $rrule["FREQ"]
    $interval = if ($rrule["INTERVAL"]) { [int]$rrule["INTERVAL"] } else { 1 }
    $countLimit = if ($rrule["COUNT"]) { [int]$rrule["COUNT"] } else { $null }

    $untilInstant = $null
    if ($rrule["UNTIL"]) {
        $u = $rrule["UNTIL"]
        try {
            if ($u.EndsWith('Z')) {
                $n = [datetime]::SpecifyKind([datetime]::ParseExact($u.TrimEnd('Z'), "yyyyMMddTHHmmss", $null), 'Utc')
                $untilInstant = [DateTimeOffset]::new($n)
            } elseif ($u.Length -eq 8) {
                $n = [datetime]::SpecifyKind([datetime]::ParseExact($u, "yyyyMMdd", $null), 'Unspecified')
                $untilInstant = [DateTimeOffset]::new([System.TimeZoneInfo]::ConvertTimeToUtc($n, $TorontoTz))
            } else {
                $n = [datetime]::SpecifyKind([datetime]::ParseExact($u, "yyyyMMddTHHmmss", $null), 'Unspecified')
                $untilInstant = [DateTimeOffset]::new([System.TimeZoneInfo]::ConvertTimeToUtc($n, $TorontoTz))
            }
        } catch { $untilInstant = $null }
    }

    $exSet = @{}
    foreach ($ex in $Evt["EXDATES"]) { $exSet[$ex.UtcDateTime.ToString("o")] = $true }

    $startWall = Get-TorontoWall -Instant $startInstant
    $timeOfDay = $startWall.TimeOfDay

    if ($freq -ne "WEEKLY") {
        # DAILY / MONTHLY / YEARLY are not expanded. Consider only the base
        # occurrence if it happens to land in this week, and warn.
        Write-Log ("  WARN unhandled RRULE FREQ='{0}' on '{1}' - only base occurrence checked." -f $freq, $Evt["SUMMARY"]) "WARN"
        if ($startWall -ge $WeekStartTor -and $startWall -lt $WeekEndTor) {
            $results += @{ Instant = $startInstant; Duration = $duration; AllDay = $dtStart.AllDay }
        }
        return $results
    }

    # --- WEEKLY (covers biweekly via INTERVAL) ---
    # Which weekdays does the series land on?
    $byDays = @()
    if ($rrule["BYDAY"]) {
        foreach ($d in ($rrule["BYDAY"] -split ',')) {
            $code = ($d -replace '[^A-Za-z]', '').ToUpper()
            if ($ByDayOffset.ContainsKey($code)) { $byDays += $code }
        }
    }
    if ($byDays.Count -eq 0) {
        # default to DTSTART's own weekday
        $dow = [int]$startWall.DayOfWeek           # Sun=0..Sat=6
        $offset = if ($dow -eq 0) { 6 } else { $dow - 1 }
        $byDays += ($ByDayOffset.GetEnumerator() | Where-Object { $_.Value -eq $offset }).Key
    }

    # Interval alignment: weeks between DTSTART's Monday and this week's Monday.
    $sDow = [int]$startWall.DayOfWeek
    $sDaysToMon = if ($sDow -eq 0) { -6 } else { 1 - $sDow }
    $startWeekMon = $startWall.Date.AddDays($sDaysToMon)
    $weeksDiff = [int](($WeekStartTor - $startWeekMon).Days / 7)
    if ($weeksDiff -lt 0 -or ($weeksDiff % $interval) -ne 0) {
        return @()   # this week is an "off" week for the series
    }

    foreach ($code in $byDays) {
        $candDate = $WeekStartTor.AddDays($ByDayOffset[$code])   # Toronto date this week
        $candWall = [datetime]::SpecifyKind($candDate.Date.Add($timeOfDay), 'Unspecified')
        if ($candWall -lt $WeekStartTor -or $candWall -ge $WeekEndTor) { continue }
        $candUtc     = [System.TimeZoneInfo]::ConvertTimeToUtc($candWall, $TorontoTz)
        $candInstant = [DateTimeOffset]::new([datetime]::SpecifyKind($candUtc, 'Utc'))

        if ($candInstant -lt $startInstant) { continue }                       # before series start
        if ($untilInstant -and $candInstant -gt $untilInstant) { continue }    # after UNTIL
        if ($exSet.ContainsKey($candInstant.UtcDateTime.ToString("o"))) { continue }  # EXDATE
        if ($countLimit) {
            $occurrenceNumber = 0
            $withinCount = $true
            for ($week = $startWeekMon; $week -le $WeekStartTor; $week = $week.AddDays(7 * $interval)) {
                foreach ($dayCode in $byDays) {
                    $occWall = [datetime]::SpecifyKind($week.AddDays($ByDayOffset[$dayCode]).Date.Add($timeOfDay), 'Unspecified')
                    if ($occWall -lt $startWall) { continue }
                    $occurrenceNumber++
                    if ($occWall -eq $candWall -and $occurrenceNumber -gt $countLimit) {
                        $withinCount = $false
                        break
                    }
                }
                if (-not $withinCount) {
                    break
                }
            }
            if (-not $withinCount) { continue }
        }

        $results += @{ Instant = $candInstant; Duration = $duration; AllDay = $dtStart.AllDay }
    }
    return $results
}

# ---------------------------------------------------------------
# VIDEO LINK DETECTION PATTERN
# ---------------------------------------------------------------
$videoPattern = 'meet\.google|zoom\.us|alyssacoleman\.ca/zoom|teams\.microsoft|webex|whereby|loom\.com|bluejeans|gotomeet|skype|discord\.gg|around\.co|livestorm'

# ---------------------------------------------------------------
# FILTER: is this concrete instance a recordable meeting?
# ---------------------------------------------------------------
function Test-IsMeeting {
    param($Evt, $Instance)

    $subject  = if ($Evt["SUMMARY"])     { $Evt["SUMMARY"] }     else { "" }
    $desc     = if ($Evt["DESCRIPTION"]) { $Evt["DESCRIPTION"] } else { "" }
    $location = if ($Evt["LOCATION"])    { $Evt["LOCATION"] }    else { "" }
    $combined = "$subject $desc $location"

    if ($Instance.AllDay) {
        Write-Log ("  EXCLUDE all-day: '{0}'" -f $subject)
        return $false
    }

    $startTor    = Get-TorontoWall -Instant $Instance.Instant
    $durationMin = $Instance.Duration.TotalMinutes
    $dayNum      = [int]$startTor.DayOfWeek    # 0=Sun,1=Mon,2=Tue,...

    if ($subject -match "Stacia") {
        Write-Log ("  EXCLUDE Stacia coworking: '{0}'" -f $subject)
        return $false
    }
    if ($subject -match "(?i)Review BOH Qs") {
        Write-Log ("  EXCLUDE internal BOH review: '{0}'" -f $subject)
        return $false
    }
    if ($subject -match "Camila.{0,5}Alyssa" -and $dayNum -eq 2) {
        Write-Log ("  EXCLUDE Camila x Alyssa Tuesday: '{0}'" -f $subject)
        return $false
    }
    if ($subject -match "Camila.{0,5}Alyssa" -and $dayNum -eq 1) {
        Write-Log ("  INCLUDE Camila x Alyssa Monday: '{0}'" -f $subject)
        return $true
    }
    if ($combined -match $videoPattern) {
        Write-Log ("  INCLUDE video link: '{0}'" -f $subject)
        return $true
    }
    $externalCount = ($Evt["ATTENDEES"] | Where-Object {
        $_ -and ($_ -ne $MyEmail) -and ($_ -notmatch "^resource\.")
    }).Count
    if ($externalCount -ge 1) {
        Write-Log ("  INCLUDE external attendee(s) ({0}): '{1}'" -f $externalCount, $subject)
        return $true
    }
    Write-Log ("  SKIP (no qualifying criteria): '{0}' ({1} min)" -f $subject, [int]$durationMin)
    return $false
}

# ---------------------------------------------------------------
# MAIN
# ---------------------------------------------------------------
Write-Log "Meetily Weekly Launcher starting (headless iCal mode)."

if (-not (Test-Path $MeetilyExe)) {
    Write-Log "ERROR: Meetily.exe not found at: $MeetilyExe" "ERROR"
    exit 1
}

# --- Compute the Mon-Sun week window in Toronto wall-clock time ---
$nowTor       = [System.TimeZoneInfo]::ConvertTimeFromUtc([datetime]::UtcNow, $TorontoTz)
$todayTor     = if ($WeekOfDate -ne [datetime]::MinValue) { $WeekOfDate.Date } else { $nowTor.Date }
if ($WeekOfDate -ne [datetime]::MinValue) {
    Write-Log ("Week override requested: using week containing {0:yyyy-MM-dd}" -f $todayTor)
}
$dow          = [int]$todayTor.DayOfWeek        # 0=Sun,1=Mon,...
$daysToMon    = if ($dow -eq 0) { -6 } else { 1 - $dow }
$weekStartTor = $todayTor.AddDays($daysToMon)                       # Monday 00:00 Toronto
$weekEndTor   = $weekStartTor.AddDays(7)                            # next Monday 00:00 (exclusive)
Write-Log ("Week window (Toronto): {0:yyyy-MM-dd} Mon 00:00 -> {1:yyyy-MM-dd} (exclusive)" -f $weekStartTor, $weekEndTor)

# --- Load + parse the calendar ---
$icsText = Get-ICalText
$vevents = Read-VEvents -Text $icsText
Write-Log "Raw VEVENTs parsed from feed: $($vevents.Count)"

# --- Expand recurrence + filter into concrete qualifying meetings ---
$events = @()
foreach ($evt in $vevents) {
    $instances = Expand-Recurrence -Evt $evt -WeekStartTor $weekStartTor -WeekEndTor $weekEndTor
    foreach ($inst in $instances) {
        if (Test-IsMeeting -Evt $evt -Instance $inst) {
            $startLocal = $inst.Instant.LocalDateTime            # machine-local trigger time
            $endLocal   = $startLocal.Add($inst.Duration)
            $events += [PSCustomObject]@{
                Subject         = if ($evt["SUMMARY"]) { $evt["SUMMARY"] } else { "(no title)" }
                StartTime       = $startLocal
                EndTime         = $endLocal
                DurationMinutes = $inst.Duration.TotalMinutes
            }
        }
    }
}
Write-Log "Qualifying meetings this week after filter: $($events.Count)"

if ($NoSchedule) {
    Write-Log "-NoSchedule set: read-only dry run, no scheduled tasks touched."
    foreach ($evt in ($events | Sort-Object StartTime)) {
        Write-Log ("  QUALIFIED: '{0}' {1:yyyy-MM-dd ddd HH:mm} ({2} min)" -f $evt.Subject, $evt.StartTime, [int]$evt.DurationMinutes)
    }
    Write-Log "Dry run complete."
    return
}

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
# CREATE NEW ONE-SHOT TASKS - ONE PER QUALIFYING MEETING
# ---------------------------------------------------------------
$scheduled = 0
$skipped   = 0

foreach ($evt in $events) {
    $launchTime = $evt.StartTime.AddMinutes(-$LaunchLeadMin)

    if ($launchTime -le (Get-Date)) {
        Write-Log ("Skipping past/imminent event: '{0}' at {1:HH:mm}" -f $evt.Subject, $evt.StartTime)
        $skipped++
        continue
    }

    $safeSubject = ($evt.Subject -replace '[^a-zA-Z0-9]', '-') -replace '-+', '-'
    $safeSubject = $safeSubject.Trim('-')
    if ($safeSubject.Length -gt 30) { $safeSubject = $safeSubject.Substring(0, 30) }
    $taskName = "{0}{1}-{2}-{3}" -f `
        $TaskNamePrefix,
        $evt.StartTime.ToString("yyyyMMdd"),
        $evt.StartTime.ToString("HHmm"),
        $safeSubject

    $action = New-ScheduledTaskAction `
        -Execute "powershell.exe" `
        -Argument ("-NonInteractive -WindowStyle Hidden -Command ""Start-Process '{0}'""" -f $MeetilyExe)

    $trigger = New-ScheduledTaskTrigger -Once -At $launchTime
    $trigger.EndBoundary = $launchTime.AddHours(2).ToString("yyyy-MM-dd'T'HH:mm:ss")

    $principal = New-ScheduledTaskPrincipal `
        -UserId ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name) `
        -LogonType Interactive `
        -RunLevel Limited

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

        Write-Log ("Scheduled: '{0}' - task fires at {1:HH:mm}, meeting at {2:HH:mm}" -f `
            $evt.Subject, $launchTime, $evt.StartTime)
        $scheduled++
    }
    catch {
        Write-Log ("Failed to register task for '{0}': {1}" -f $evt.Subject, $_.Exception.Message) "ERROR"
    }
}

Write-Log "Done. Scheduled: $scheduled | Skipped (past): $skipped | Log: $LogFile"

<#
=======================================================================
FIRST-TIME TASK SCHEDULER REGISTRATION  (weekly trigger)
=======================================================================
Already registered as "Meetily Weekly Launcher" (Mon 8:00 AM). This block is
kept for reference / re-registration. Run ONCE in an elevated PowerShell.

$scriptPath = 'C:\Users\accol\OneDrive\Desktop\the-house\Studio\Team Knowledge\Automations\meetily-weekly-launcher.ps1'

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
    -Description "Reads the secret iCal feed and pre-schedules Meetily launches for the week." `
    -Force

Write-Host "Registered: Meetily Weekly Launcher (runs every Monday 8:00 AM)"
=======================================================================
#>
