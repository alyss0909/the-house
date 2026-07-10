# import-idea-pantry.ps1
# Silas / myPKA - Idea Pantry CSV import
# Converts non-archived Notion Idea Pantry rows to Journal entries

param(
    [string]$CsvPath = "C:\Users\accol\AppData\Local\Temp\idea Pantry DB 2f4c8b43e5658142a060f4e3c920e7f4_all.csv",
    [string]$VaultRoot = "C:\Users\accol\OneDrive\Desktop\the-house"
)

$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------
# HELPERS
# ---------------------------------------------------------------

function Strip-NotionLink {
    param([string]$value)
    if ($value -match '^(.+?)\s*\(https?://') {
        return $matches[1].Trim()
    }
    return $value.Trim()
}

function To-Slug {
    param([string]$text)
    if ([string]::IsNullOrWhiteSpace($text)) { return "" }
    $s = $text.ToLowerInvariant()
    $s = [System.Text.RegularExpressions.Regex]::Replace($s, '[^\x00-\x7F]', '')
    $s = $s -replace '&', 'and'
    $s = $s -replace '\+', 'plus'
    $s = [System.Text.RegularExpressions.Regex]::Replace($s, "[^a-z0-9\s\-]", '')
    $s = [System.Text.RegularExpressions.Regex]::Replace($s.Trim(), '\s+', '-')
    $s = [System.Text.RegularExpressions.Regex]::Replace($s, '-+', '-')
    $s = $s.Trim('-')
    if ($s.Length -gt 60) {
        $s = $s.Substring(0, 60)
        $lastHyphen = $s.LastIndexOf('-')
        if ($lastHyphen -gt 20) { $s = $s.Substring(0, $lastHyphen) }
    }
    return $s
}

function Parse-Date {
    param([string]$raw)
    if ([string]::IsNullOrWhiteSpace($raw)) { return $null }
    $formats = @(
        "MMMM d, yyyy",
        "MMMM dd, yyyy",
        "MMMM d, yyyy h:mm tt",
        "MMMM dd, yyyy h:mm tt",
        "MMMM d, yyyy hh:mm tt",
        "MMMM dd, yyyy hh:mm tt"
    )
    foreach ($fmt in $formats) {
        try {
            $dt = [datetime]::ParseExact($raw.Trim(), $fmt, [System.Globalization.CultureInfo]::InvariantCulture)
            return $dt
        } catch {}
    }
    try {
        return [datetime]::Parse($raw.Trim())
    } catch {}
    return $null
}

function Slugify-Tag {
    param([string]$tag)
    return To-Slug $tag
}

# ---------------------------------------------------------------
# AREA map (area display name to KE slug)
# ---------------------------------------------------------------
$areaMap = @{}
$areaMap['business']    = 'business'
$areaMap['biz']         = 'business'
$areaMap['life']        = 'life'
$areaMap['email']       = 'emails'
$areaMap['emails']      = 'emails'
$areaMap['social']      = 'socials'
$areaMap['socials']     = 'socials'
$areaMap['content']     = 'socials'
$areaMap['promos']      = 'promos'
$areaMap['promotions']  = 'promos'
$areaMap['offers']      = 'offers'
$areaMap['products']    = 'offers'
$areaMap['clients']     = 'clients'
$areaMap['client work'] = 'clients'
$areaMap['operations']  = 'operations'
$areaMap['ops']         = 'operations'
$areaMap['home']        = 'home'
$areaMap['family']      = 'home'
$areaMap['personal']    = 'home'
$areaMap['parenting']   = 'parenting'
$areaMap['becoming']    = 'becoming'
$areaMap['self']        = 'becoming'
$areaMap['team']        = 'operations'
$areaMap['design']      = 'operations'

# ---------------------------------------------------------------
# PROJECT name map (notion display name to PKM slug)
# ---------------------------------------------------------------
$projectMap = @{}
$projectMap['spring 26 launch']     = 'spring-26-launch'
$projectMap["spring '26 launch"]    = 'spring-26-launch'
$projectMap['spring `26 launch']    = 'spring-26-launch'
$projectMap['rebrand']              = 'rebrand'
$projectMap['slo updates']          = 'slo-updates'
$projectMap['systematize socials']  = 'systematize-socials'
$projectMap['office reno']          = 'office-reno'
$projectMap['project notion']       = 'notion-templates'
$projectMap['notion']               = 'notion-templates'
$projectMap['monthly workshops']    = 'monthly-workshops'
$projectMap['blog & pin']           = 'blog-and-pin'
$projectMap['blog and pin']         = 'blog-and-pin'
$projectMap['blog  pin']            = 'blog-and-pin'

# ---------------------------------------------------------------
# LABEL map function
# ---------------------------------------------------------------
function Map-Label {
    param([string]$label)
    # Strip non-ASCII (emoji) prefix
    $clean = [System.Text.RegularExpressions.Regex]::Replace($label, '[^\x00-\x7F]', '').Trim()
    $clean = $clean.Trim('?').Trim()
    $lower = $clean.ToLowerInvariant()
    if ($lower -eq 'muisings')      { return @{ tag = 'muisings';      link = 'life' } }
    if ($lower -eq 'good ideas')    { return @{ tag = 'good-ideas';    link = '' } }
    if ($lower -eq 'inspo')         { return @{ tag = 'inspo';         link = '' } }
    if ($lower -eq 'copy cupboard') { return @{ tag = 'copy-cupboard'; link = 'emails' } }
    if ($lower -eq 'content')       { return @{ tag = 'content';       link = 'socials' } }
    if ($lower -eq 'family')        { return @{ tag = 'family';        link = 'home' } }
    if ($lower -eq 'recipes')       { return @{ tag = 'recipes';       link = 'home' } }
    return @{ tag = ''; link = '' }
}

# ---------------------------------------------------------------
# CLIENT detection
# ---------------------------------------------------------------
$clientSlugs = @{}
$clientSlugs['alex']    = 'alex'
$clientSlugs['gillian'] = 'gillian'
$clientSlugs['lara']    = 'lara'
$clientSlugs['maude']   = 'maude'

function Detect-Clients {
    param([string]$nameField, [string]$notesField)
    $found = [System.Collections.Generic.List[string]]@()
    $combined = ($nameField + ' ' + $notesField).ToLowerInvariant()
    foreach ($client in $clientSlugs.Keys) {
        if ($combined -match "\b$client\b") {
            if (-not ($found -contains $clientSlugs[$client])) {
                $found.Add($clientSlugs[$client]) | Out-Null
            }
        }
    }
    return $found
}

# ---------------------------------------------------------------
# LOAD CSV
# ---------------------------------------------------------------
Write-Host "Loading CSV..."
$csv = Import-Csv -Path $CsvPath -Encoding UTF8
$total = $csv.Count
Write-Host "Total rows: $total"

$nonArchived = $csv | Where-Object { $_.'Weekly Review Status' -ne 'Archived' }
Write-Host "Non-archived: $($nonArchived.Count)"

# ---------------------------------------------------------------
# COUNTERS
# ---------------------------------------------------------------
$cntProcessed        = 0
$cntSkipped          = 0
$cntBlankDateFallback = 0
$cntFallbackLife     = 0
$cntErrors           = 0
$labelCounts         = @{}
$unmappedProjects    = @{}
$skippedRows         = [System.Collections.Generic.List[object]]@()
$errorRows           = [System.Collections.Generic.List[object]]@()
$slugTracker         = @{}

$journalRoot = Join-Path $VaultRoot "PKM\Journal"

# ---------------------------------------------------------------
# PROCESS ROWS
# ---------------------------------------------------------------
foreach ($row in $nonArchived) {

    try {
        # ---- Date ----
        $ideaCreated      = $row.'Idea Created'.Trim()
        $createdFallback  = $row.'created'.Trim()
        $dateRaw = if ($ideaCreated -ne '') { $ideaCreated } else { $createdFallback }

        if ($dateRaw -eq '') {
            $skippedRows.Add([pscustomobject]@{ Name = $row.Name; Reason = 'No date available' }) | Out-Null
            $cntSkipped++
            continue
        }

        $dt = Parse-Date $dateRaw
        if ($null -eq $dt) {
            $skippedRows.Add([pscustomobject]@{ Name = $row.Name; Reason = "Could not parse date: $dateRaw" }) | Out-Null
            $cntSkipped++
            continue
        }
        if ($ideaCreated -eq '') { $cntBlankDateFallback++ }

        $yyyy    = $dt.ToString('yyyy')
        $mm      = $dt.ToString('MM')
        $dd      = $dt.ToString('dd')
        $dateStr = $yyyy + '-' + $mm + '-' + $dd

        # ---- Slug ----
        $nameRaw   = $row.Name.Trim()
        $nameClean = Strip-NotionLink $nameRaw
        $slug      = To-Slug $nameClean
        if ($slug -eq '') { $slug = 'untitled' }

        $fileKey = $dateStr + '-' + $slug
        if ($slugTracker.ContainsKey($fileKey)) {
            $slugTracker[$fileKey]++
            $slug    = $slug + '-' + $slugTracker[$fileKey].ToString()
            $fileKey = $dateStr + '-' + $slug
        } else {
            $slugTracker[$fileKey] = 1
        }

        # ---- Directory ----
        $dir = Join-Path $journalRoot ($yyyy + '\' + $mm)
        if (-not (Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
        $filePath = Join-Path $dir ($dateStr + '-' + $slug + '.md')

        # ---- Tags and connections ----
        $yamlTags   = [System.Collections.Generic.List[string]]@()
        $connections = [System.Collections.Generic.List[string]]@()

        # Area
        $areaRaw = Strip-NotionLink ($row.Area.Trim())
        $areaKey = $areaRaw.ToLowerInvariant().Trim()
        if ($areaMap.ContainsKey($areaKey)) {
            $connections.Add($areaMap[$areaKey]) | Out-Null
        }

        # Projects
        $projectRaw = Strip-NotionLink ($row.Projects.Trim())
        if ($projectRaw -ne '') {
            $projectKey = $projectRaw.ToLowerInvariant().Trim()
            if ($projectMap.ContainsKey($projectKey)) {
                $projSlug = $projectMap[$projectKey]
                if ($projSlug -ne '' -and (-not ($connections -contains $projSlug))) {
                    $connections.Add($projSlug) | Out-Null
                }
            } else {
                $tagVersion = Slugify-Tag $projectRaw
                if ($tagVersion -ne '' -and (-not ($yamlTags -contains $tagVersion))) {
                    $yamlTags.Add($tagVersion) | Out-Null
                }
                if ($unmappedProjects.ContainsKey($projectRaw)) {
                    $unmappedProjects[$projectRaw]++
                } else {
                    $unmappedProjects[$projectRaw] = 1
                }
            }
        }

        # Tags field (multi-value Notion relations separated by commas)
        $tagsRaw = $row.Tags.Trim()
        if ($tagsRaw -ne '') {
            # Split carefully: Notion multi-select uses ", " as separator but URLs have commas too
            # Each item is "TagName (URL)" - split on ", " that is followed by a capital letter or "?"
            $tagChunks = [System.Text.RegularExpressions.Regex]::Split($tagsRaw, ',\s*(?=[A-Z?])')
            foreach ($chunk in $tagChunks) {
                $tagName = Strip-NotionLink $chunk.Trim()
                if ($tagName -eq '') { continue }
                $tagSlug = Slugify-Tag $tagName
                if ($tagSlug -ne '' -and (-not ($yamlTags -contains $tagSlug))) {
                    $yamlTags.Add($tagSlug) | Out-Null
                }
                $tagLower = $tagName.ToLowerInvariant()
                if ($tagLower -match 'montessori') {
                    if (-not ($connections -contains 'parenting')) { $connections.Add('parenting') | Out-Null }
                }
                if ($tagLower -match '\bseo\b') {
                    if (-not ($connections -contains 'socials')) { $connections.Add('socials') | Out-Null }
                }
                if ($tagLower -match 'notion') {
                    if (-not ($connections -contains 'notion-templates')) { $connections.Add('notion-templates') | Out-Null }
                }
                if ($tagLower -match 'design') {
                    if (-not ($yamlTags -contains 'design')) { $yamlTags.Add('design') | Out-Null }
                }
                if (($tagLower -match '\bai\b') -or ($tagLower -match '\bclaude\b')) {
                    if (-not ($yamlTags -contains 'ai')) { $yamlTags.Add('ai') | Out-Null }
                }
            }
        }

        # Label
        $labelRaw    = $row.Label.Trim()
        $labelResult = Map-Label $labelRaw
        $labelKey    = if ($labelRaw -ne '') { $labelRaw } else { '(blank)' }
        if ($labelCounts.ContainsKey($labelKey)) { $labelCounts[$labelKey]++ } else { $labelCounts[$labelKey] = 1 }

        if ($labelResult.tag -ne '' -and (-not ($yamlTags -contains $labelResult.tag))) {
            $yamlTags.Add($labelResult.tag) | Out-Null
        }
        if ($labelResult.link -ne '' -and (-not ($connections -contains $labelResult.link))) {
            $connections.Add($labelResult.link) | Out-Null
        }

        # Client detection
        $clients = Detect-Clients $nameRaw $row.Notes
        foreach ($c in $clients) {
            if (-not ($connections -contains $c)) { $connections.Add($c) | Out-Null }
        }

        # Fallback
        if ($connections.Count -eq 0) {
            $connections.Add('life') | Out-Null
            $cntFallbackLife++
        }

        # ---- Build YAML tags block ----
        $tagsBlock = ''
        if ($yamlTags.Count -gt 0) {
            $tagLines = ($yamlTags | ForEach-Object { '  - ' + $_ }) -join [char]10
            $tagsBlock = 'tags:' + [char]10 + $tagLines
        } else {
            $tagsBlock = 'tags: []'
        }

        # ---- Build connections line ----
        $connLine = ($connections | ForEach-Object { '[[' + $_ + ']]' }) -join ' '

        # ---- Build heading ----
        $nameForHeading = $nameClean.Trim()
        $nameForHeading = [System.Text.RegularExpressions.Regex]::Replace($nameForHeading, '@\w+[\s,]+\d[\d,\s]*\d{4}', '').Trim()
        $genericNames   = @('new idea', 'test page', 'untitled', '')
        $isGeneric      = $genericNames -contains $nameForHeading.ToLowerInvariant()
        $useHeading     = (-not $isGeneric) -and ($nameForHeading -ne '')

        # ---- Body content ----
        $notesRaw   = $row.Notes.Trim()
        $bodyText   = if ($notesRaw -ne '') { $notesRaw } else { $nameForHeading }
        $urlRaw     = $row.URL.Trim()

        # ---- Compose file via StringBuilder ----
        $sb = [System.Text.StringBuilder]::new()
        [void]$sb.Append('---')
        [void]$sb.Append([char]10)
        [void]$sb.Append('date: ' + $dateStr)
        [void]$sb.Append([char]10)
        [void]$sb.Append($tagsBlock)
        [void]$sb.Append([char]10)
        [void]$sb.Append('---')
        [void]$sb.Append([char]10)
        [void]$sb.Append([char]10)
        if ($useHeading) {
            [void]$sb.Append('# ' + $nameForHeading)
            [void]$sb.Append([char]10)
            [void]$sb.Append([char]10)
        }
        [void]$sb.Append($bodyText)
        if ($urlRaw -ne '') {
            [void]$sb.Append([char]10)
            [void]$sb.Append([char]10)
            [void]$sb.Append('Source: ' + $urlRaw)
        }
        [void]$sb.Append([char]10)
        [void]$sb.Append([char]10)
        [void]$sb.Append('**Connections:** ' + $connLine)
        [void]$sb.Append([char]10)

        $fileContent = $sb.ToString()
        [System.IO.File]::WriteAllText($filePath, $fileContent, [System.Text.Encoding]::UTF8)
        $cntProcessed++

    } catch {
        $cntErrors++
        $errorRows.Add([pscustomobject]@{ Name = $row.Name; Error = $_.Exception.Message }) | Out-Null
    }
}

# ---------------------------------------------------------------
# REPORT
# ---------------------------------------------------------------
Write-Host ""
Write-Host "========================================"
Write-Host "  IDEA PANTRY IMPORT - REPORT"
Write-Host "========================================"
Write-Host ""
Write-Host ('1. Total rows in CSV:          ' + $total)
Write-Host ('   Archived (skipped):         79')
Write-Host ('   Non-archived:               ' + $nonArchived.Count)
Write-Host ('   Successfully processed:     ' + $cntProcessed)
Write-Host ('   Skipped (other reasons):    ' + $cntSkipped)
Write-Host ('   Errors:                     ' + $cntErrors)
Write-Host ('   Blank date used fallback:   ' + $cntBlankDateFallback)
Write-Host ""
Write-Host "2. Label breakdown:"
foreach ($k in ($labelCounts.Keys | Sort-Object)) {
    Write-Host ('   ' + $labelCounts[$k].ToString().PadLeft(4) + '  ' + $k)
}
Write-Host ""
Write-Host ('3. Notes using [[life]] fallback only: ' + $cntFallbackLife)
Write-Host ""
Write-Host "4. Unknown/unmapped Notion project names:"
if ($unmappedProjects.Count -eq 0) {
    Write-Host "   (none)"
} else {
    foreach ($k in ($unmappedProjects.Keys | Sort-Object)) {
        Write-Host ('   ' + $unmappedProjects[$k].ToString().PadLeft(4) + '  ' + $k)
    }
}
Write-Host ""
Write-Host "5. Rows skipped:"
if ($skippedRows.Count -eq 0) {
    Write-Host "   (none)"
} else {
    foreach ($r in $skippedRows) {
        Write-Host ('   - ' + $r.Name + ': ' + $r.Reason)
    }
}
Write-Host ""
Write-Host "6. Errors:"
if ($errorRows.Count -eq 0) {
    Write-Host "   (none)"
} else {
    foreach ($r in $errorRows) {
        Write-Host ('   - ' + $r.Name + ': ' + $r.Error)
    }
}
Write-Host ""
Write-Host "Import complete."
