# meetily-inbox-prep.ps1
# Mack / The House - Daily Meeting Clean
#
# Mechanical job only:
# - scans Meetily raw folders outside the vault
# - creates missing pointer notes in Notebook/Inbox/Meeting Captures
# - deletes bulky media files after the retention window
# - retires transcript files only after the pointer is marked processed
#
# It does not summarize meetings, write Journal notes, create tasks, or decide
# what the meeting means. Larry/Penn handle that during Weekly Meeting Processing.

param(
    [string]$MeetilyRoot = "D:\Alyssa\Music\meetily-recordings",
    [string]$VaultRoot,
    [int]$MediaRetentionDays = 7,
    [int]$TranscriptRetentionAfterProcessedDays = 30,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

if (-not $VaultRoot) {
    $teamKnowledge = Split-Path -Parent $PSScriptRoot
    $VaultRoot = Split-Path -Parent $teamKnowledge
}

$PointerDir = Join-Path $VaultRoot "Notebook\Inbox\Meeting Captures"
$LogFile = Join-Path $env:LOCALAPPDATA "Temp\meetily-inbox-prep.log"
$MediaExtensions = @(".mp4", ".m4a", ".mp3", ".wav", ".webm", ".mov")
$TranscriptNames = @("transcripts.json", "transcript.json")

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $entry = "[{0}] [{1}] {2}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Level, $Message
    try { Add-Content -LiteralPath $LogFile -Value $entry } catch { }
    Write-Host $entry
}

function Write-TextFile {
    param([string]$Path, [string]$Text)
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Text, $utf8NoBom)
}

function ConvertTo-Slug {
    param([string]$Text)
    $slug = $Text.ToLowerInvariant()
    $slug = $slug -replace '[^a-z0-9]+', '-'
    $slug = $slug.Trim('-')
    if (-not $slug) { $slug = "meeting" }
    if ($slug.Length -gt 70) { $slug = $slug.Substring(0, 70).Trim('-') }
    return $slug
}

function ConvertTo-YamlScalar {
    param([object]$Value)
    if ($null -eq $Value) { return "" }
    $s = [string]$Value
    if ($s -match '[:#\[\]\{\},&\*!\|>''"%@`]' -or $s -match '^\s|\s$') {
        return '"' + ($s -replace '"', '\"') + '"'
    }
    return $s
}

function Get-PointerFiles {
    if (-not (Test-Path -LiteralPath $PointerDir)) { return @() }
    return @(Get-ChildItem -File -LiteralPath $PointerDir -Filter "*.md")
}

function Find-PointerForRawPath {
    param([string]$RawPath)
    foreach ($file in (Get-PointerFiles)) {
        $text = Get-Content -Raw -LiteralPath $file.FullName
        if ($text -like "*$RawPath*") { return $file }
    }
    return $null
}

function Get-PointerField {
    param([string]$Path, [string]$Field)
    if (-not (Test-Path -LiteralPath $Path)) { return $null }
    $text = Get-Content -Raw -LiteralPath $Path
    if ($text -notmatch '(?s)^---\r?\n(.*?)\r?\n---') { return $null }
    $frontmatter = $Matches[1]
    foreach ($line in ($frontmatter -split "\r?\n")) {
        if ($line -match ("^" + [regex]::Escape($Field) + ":\s*(.*)$")) {
            return $Matches[1].Trim().Trim('"')
        }
    }
    return $null
}

function Set-PointerFields {
    param([string]$Path, [hashtable]$Fields)
    if (-not (Test-Path -LiteralPath $Path)) { return }

    $text = Get-Content -Raw -LiteralPath $Path
    if ($text -notmatch '(?s)^---\r?\n(.*?)\r?\n---\r?\n?(.*)$') {
        Write-Log "Pointer has no YAML frontmatter, skipping field update: $Path" "WARN"
        return
    }

    $frontmatter = $Matches[1]
    $body = $Matches[2]
    $lines = New-Object System.Collections.Generic.List[string]
    foreach ($line in ($frontmatter -split "\r?\n")) { $lines.Add($line) }

    foreach ($key in $Fields.Keys) {
        $value = ConvertTo-YamlScalar $Fields[$key]
        $found = $false
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match ("^" + [regex]::Escape($key) + ":")) {
                $lines[$i] = "${key}: $value"
                $found = $true
                break
            }
        }
        if (-not $found) { $lines.Add("${key}: $value") }
    }

    $newText = "---`r`n" + ($lines -join "`r`n") + "`r`n---`r`n" + $body
    if ($DryRun) {
        Write-Log "DRY RUN: would update pointer fields in $Path"
    }
    else {
        Write-TextFile -Path $Path -Text $newText
    }
}

function New-PointerNote {
    param([string]$RawPath, [object]$Metadata)

    $createdAt = $Metadata.created_at
    $completedAt = $Metadata.completed_at
    $date = $null
    foreach ($candidate in @($completedAt, $createdAt)) {
        if ($candidate) {
            try {
                $date = ([DateTimeOffset]::Parse($candidate)).ToLocalTime().ToString("yyyy-MM-dd")
                break
            } catch { }
        }
    }
    if (-not $date) {
        $date = (Get-Item -LiteralPath $RawPath).LastWriteTime.ToString("yyyy-MM-dd")
    }

    $title = if ($Metadata.meeting_name) { [string]$Metadata.meeting_name } else { (Split-Path -Leaf $RawPath) }
    $slug = ConvertTo-Slug $title
    $fileName = "$date-$slug-pointer.md"
    $path = Join-Path $PointerDir $fileName
    $n = 2
    while (Test-Path -LiteralPath $path) {
        $fileName = "$date-$slug-$n-pointer.md"
        $path = Join-Path $PointerDir $fileName
        $n++
    }

    $now = Get-Date -Format "yyyy-MM-ddTHH:mm:ssK"
    $content = @"
---
date: $date
source: Meetily
status: new
raw_source_path: "$RawPath"
meeting_title: $(ConvertTo-YamlScalar $title)
media_cleanup_status: pending
transcript_cleanup_status: retained
created_by: daily-meeting-clean
created_at: $now
updated_at: $now
---

# $title

- Raw source folder: ``$RawPath``
- Status: new
- Cleanup rule: audio/video deletes after $MediaRetentionDays days; transcript stays until processed memory exists.
"@

    if ($DryRun) {
        Write-Log "DRY RUN: would create pointer note $path"
    }
    else {
        if (-not (Test-Path -LiteralPath $PointerDir)) {
            New-Item -ItemType Directory -Path $PointerDir -Force | Out-Null
        }
        Write-TextFile -Path $path -Text $content
        Write-Log "Created pointer note: $path"
    }
    return $path
}

function Test-IsCompletedMeetilyFolder {
    param([string]$FolderPath)
    $metadataPath = Join-Path $FolderPath "metadata.json"
    $transcriptPath = Join-Path $FolderPath "transcripts.json"
    if (-not (Test-Path -LiteralPath $metadataPath)) { return $false }
    if (-not (Test-Path -LiteralPath $transcriptPath)) { return $false }
    try {
        $metadata = Get-Content -Raw -LiteralPath $metadataPath | ConvertFrom-Json
        return ($metadata.status -eq "completed")
    }
    catch {
        Write-Log "Could not parse metadata: $metadataPath" "WARN"
        return $false
    }
}

function Remove-OldMedia {
    param([string]$FolderPath, [object]$Pointer)
    $cutoff = (Get-Date).AddDays(-1 * $MediaRetentionDays)
    $mediaFiles = @(Get-ChildItem -File -LiteralPath $FolderPath -ErrorAction SilentlyContinue | Where-Object {
        $MediaExtensions -contains $_.Extension.ToLowerInvariant()
    })

    $deleted = 0
    $freed = 0L
    foreach ($file in $mediaFiles) {
        if ($file.LastWriteTime -gt $cutoff) { continue }
        $freed += $file.Length
        if ($DryRun) {
            Write-Log ("DRY RUN: would delete old media {0} ({1:N2} MB)" -f $file.FullName, ($file.Length / 1MB))
        }
        else {
            Remove-Item -LiteralPath $file.FullName -Force
            Write-Log ("Deleted old media {0} ({1:N2} MB)" -f $file.FullName, ($file.Length / 1MB))
        }
        $deleted++
    }

    if ($deleted -gt 0 -and $Pointer) {
        Set-PointerFields -Path $Pointer.FullName -Fields @{
            media_cleanup_status = "deleted"
            media_deleted_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")
            media_deleted_count = $deleted
            media_deleted_mb = [math]::Round(($freed / 1MB), 2)
            updated_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")
        }
    }
}

function Remove-RetiredTranscript {
    param([string]$FolderPath, [object]$Pointer)
    if (-not $Pointer) { return }
    $status = Get-PointerField -Path $Pointer.FullName -Field "status"
    if ($status -notin @("processed", "done")) { return }

    $processedAtText = Get-PointerField -Path $Pointer.FullName -Field "processed_at"
    $processedAt = $null
    if ($processedAtText) {
        try { $processedAt = [DateTimeOffset]::Parse($processedAtText).DateTime } catch { }
    }
    if (-not $processedAt) { $processedAt = $Pointer.LastWriteTime }
    if ($processedAt -gt (Get-Date).AddDays(-1 * $TranscriptRetentionAfterProcessedDays)) { return }

    $deleted = 0
    foreach ($name in $TranscriptNames) {
        $path = Join-Path $FolderPath $name
        if (-not (Test-Path -LiteralPath $path)) { continue }
        if ($DryRun) {
            Write-Log "DRY RUN: would retire transcript $path"
        }
        else {
            Remove-Item -LiteralPath $path -Force
            Write-Log "Retired transcript after processed retention: $path"
        }
        $deleted++
    }

    if ($deleted -gt 0) {
        Set-PointerFields -Path $Pointer.FullName -Fields @{
            transcript_cleanup_status = "retired"
            transcript_retired_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")
            updated_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")
        }
    }
}

Write-Log "Meetily inbox prep starting. DryRun=$DryRun"
Write-Log "Meetily root: $MeetilyRoot"
Write-Log "Pointer dir: $PointerDir"

if (-not (Test-Path -LiteralPath $MeetilyRoot)) {
    Write-Log "Meetily root not found. Nothing to do." "WARN"
    exit 0
}

if (-not (Test-Path -LiteralPath $PointerDir) -and -not $DryRun) {
    New-Item -ItemType Directory -Path $PointerDir -Force | Out-Null
}

$folders = @(Get-ChildItem -Directory -LiteralPath $MeetilyRoot | Where-Object {
    $_.Name -notmatch '^(\.git|\.agents|_ready-to-delete|archive|delete|quarantine)$'
})

$completed = 0
$createdPointers = 0
foreach ($folder in $folders) {
    if (-not (Test-IsCompletedMeetilyFolder -FolderPath $folder.FullName)) { continue }
    $completed++

    $pointer = Find-PointerForRawPath -RawPath $folder.FullName
    if (-not $pointer) {
        $metadata = Get-Content -Raw -LiteralPath (Join-Path $folder.FullName "metadata.json") | ConvertFrom-Json
        $createdPath = New-PointerNote -RawPath $folder.FullName -Metadata $metadata
        $createdPointers++
        if (-not $DryRun -and (Test-Path -LiteralPath $createdPath)) {
            $pointer = Get-Item -LiteralPath $createdPath
        }
    }

    Remove-OldMedia -FolderPath $folder.FullName -Pointer $pointer
    Remove-RetiredTranscript -FolderPath $folder.FullName -Pointer $pointer
}

Write-Log "Done. Completed folders: $completed | Pointers created: $createdPointers | Log: $LogFile"
