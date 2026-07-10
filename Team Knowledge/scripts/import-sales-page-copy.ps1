param(
  [Parameter(Mandatory = $true)]
  [string]$WorkspaceRoot
)

$ErrorActionPreference = "Continue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$headers = @{
  "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"
  "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
  "Accept-Language" = "en-US,en;q=0.9"
}

$pages = @(
  @{ Offer = "best-year-yet"; Title = "Best Year Yet"; Url = "https://alyssacoleman.ca/plan"; Slug = "best-year-yet-sales-page" },
  @{ Offer = "a-year-of-emails"; Title = "A Year of Emails"; Url = "https://alyssacoleman.ca/emails"; Slug = "a-year-of-emails-sales-page" },
  @{ Offer = "biz-tracker"; Title = "Biz Tracker"; Url = "https://alyssacoleman.ca/track"; Slug = "biz-tracker-sales-page" },
  @{ Offer = "email-list-revival-plan"; Title = "Email List Revival Plan"; Url = "https://alyssacoleman.ca/revival"; Slug = "email-list-revival-plan-sales-page" },
  @{ Offer = "list-resuscitator"; Title = "List Resuscitator"; Url = "https://alyssacoleman.ca/cold"; Slug = "list-resuscitator-sales-page" },
  @{ Offer = "soft-ceo-monthly-notion-template"; Title = "Soft CEO Monthly Notion Template"; Url = "https://alyssacoleman.ca/ceomonth"; Slug = "soft-ceo-monthly-notion-template-sales-page" },
  @{ Offer = "soft-ceo-sessions"; Title = "Soft CEO Sessions"; Url = "https://alyssacoleman.ca/softceo"; Slug = "soft-ceo-sessions-sales-page" },
  @{ Offer = "soft-sundays"; Title = "Soft Sundays"; Url = "https://alyssacoleman.ca/sunday"; Slug = "soft-sundays-sales-page" },
  @{ Offer = "the-90-minute-reset"; Title = "The 90 Minute Reset"; Url = "https://alyssacoleman.ca/90"; Slug = "the-90-minute-reset-sales-page" },
  @{ Offer = "the-ceo-year-notion-planner"; Title = "The CEO Year Notion Planner"; Url = "https://alyssacoleman.ca/ceoyear"; Slug = "the-ceo-year-notion-planner-sales-page" },
  @{ Offer = "the-daily-profit-activities"; Title = "The Daily Profit Activities"; Url = "https://alyssacoleman.ca/slo"; Slug = "the-daily-profit-activities-sales-page" },
  @{ Offer = "the-numbers"; Title = "The Numbers"; Url = "https://alyssacoleman.ca/formula"; Slug = "the-numbers-sales-page" },
  @{ Offer = "the-promo-planner-in-notion"; Title = "The Promo Planner in Notion"; Url = "https://alyssacoleman.ca/promo-notion"; Slug = "the-promo-planner-in-notion-sales-page" }
)

function Convert-HtmlToVisibleText {
  param([string]$Html)

  $text = [regex]::Replace($Html, "(?is)<script.*?</script>", "`n")
  $text = [regex]::Replace($text, "(?is)<style.*?</style>", "`n")
  $text = [regex]::Replace($text, "(?is)<noscript.*?</noscript>", "`n")
  $text = [regex]::Replace($text, "(?is)<!--.*?-->", "`n")
  $text = [regex]::Replace($text, "(?i)<br\s*/?>", "`n")
  $text = [regex]::Replace($text, "(?i)</(p|div|section|article|header|footer|li|ul|ol|h1|h2|h3|h4|h5|h6|blockquote|tr)>", "`n")
  $text = [regex]::Replace($text, "(?is)<[^>]+>", " ")
  $text = [System.Net.WebUtility]::HtmlDecode($text)
  $text = $text -replace "`r", "`n"
  $text = [regex]::Replace($text, "[`t ]+", " ")
  $text = [regex]::Replace($text, " *`n *", "`n")
  $text = [regex]::Replace($text, "`n{3,}", "`n`n")

  $lines = $text -split "`n" | ForEach-Object { $_.Trim() } | Where-Object {
    $_ -and
    $_ -notmatch "^(Days|Hours|Minutes|Seconds|-)$" -and
    $_ -notmatch "^Built with|^Powered by|^©|^Copyright" -and
    $_ -notmatch "Please enter|Please select|If you are human|United States United Kingdom|Select your state|State/region|Billing address|Contact information|Payment information|Credit card|PayPal|Phone no\.|Verify your email|Your first name|Your last name|Your street address|Your city|ZIP$|Postcode|EU VAT|terms and conditions|refund & return policy|privacy-policy|You will not be charged|Completing payment|Processing|Affiliate:|^Your name$|^Your email address$|^Your business name$|^01 Customer$|^02 Payment$|^Continue$|^Edit$|^Close$|^I agree$|^Complete Order|^Total payment$|^Today's payment|^Future payments|^All prices|^Have a coupon|^Apply$|^More »|^Discount$|^Shipping|^Sales tax|^Total$|^\+$|^-$|^1 x |^\$0$|© 2026"
  }

  $deduped = New-Object System.Collections.Generic.List[string]
  $last = ""
  foreach ($line in $lines) {
    if ($line -ne $last) {
      $deduped.Add($line)
    }
    $last = $line
  }

  return ($deduped -join "`n`n").Trim()
}

function Get-Excerpt {
  param([string]$Text)

  $skip = @(
    "Image",
    "GET INSTANT ACCESS",
    "JOIN NOW",
    "BUY NOW",
    "LEARN MORE",
    "Contact information",
    "Payment information",
    "Please enter",
    "United States United Kingdom",
    "Select your state",
    "Your first name",
    "Billing address",
    "Your name",
    "Your email address",
    "Your business name",
    "01 Customer",
    "02 Payment",
    "Continue",
    "Edit",
    "Total payment",
    "Complete Order",
    "Powered by ThriveCart",
    "0 d :",
    "Yes, please send me marketing emails",
    "Discount",
    "Shipping",
    "Sales tax",
    "Total",
    "1 x ",
    "$0",
    "© 2026"
  )

  $lines = $Text -split "`n" | Where-Object {
    $line = $_.Trim()
    $line.Length -gt 0 -and -not ($skip | Where-Object { $line -like "*$_*" })
  }

  return (($lines | Select-Object -First 16) -join "`n`n").Trim()
}

$salesPagesDir = Join-Path $WorkspaceRoot "PKM/Second Brain/examples/sales-pages"
$offersDir = Join-Path $WorkspaceRoot "PKM/My Life/Offers"
$results = New-Object System.Collections.Generic.List[object]

foreach ($page in $pages) {
  try {
    $response = Invoke-WebRequest -UseBasicParsing -Uri $page.Url -TimeoutSec 30 -Headers $headers
    $visibleText = Convert-HtmlToVisibleText -Html $response.Content

    if (-not $visibleText -or $visibleText.Length -lt 200) {
      throw "Fetched page did not expose enough visible text."
    }

    $sourceFile = Join-Path $salesPagesDir ($page.Slug + ".md")
    $sourceBody = @"
---
title: "$($page.Title) Sales Page"
source: "$($page.Url)"
offer: "[[PKM/My Life/Offers/$($page.Offer)|$($page.Title)]]"
type: sales_page_copy
captured: 2026-07-04
---

# $($page.Title) Sales Page

Source: <$($page.Url)>

Offer: [[PKM/My Life/Offers/$($page.Offer)|$($page.Title)]]

## Full source copy

$visibleText
"@
    Set-Content -LiteralPath $sourceFile -Value $sourceBody -Encoding UTF8

    $offerFile = Join-Path $offersDir ($page.Offer + ".md")
    if (Test-Path -LiteralPath $offerFile) {
      $offerText = Get-Content -Raw -LiteralPath $offerFile
      $excerpt = Get-Excerpt -Text $visibleText
      $section = @"
## Sales page copy

Full source copy: [[PKM/Second Brain/examples/sales-pages/$($page.Slug)|$($page.Title) Sales Page]]

Source URL: <$($page.Url)>

### Top-page copy

$excerpt

"@
      if ($offerText -match "(?s)## Sales page copy.*?(?=## Notes)") {
        $offerText = [regex]::Replace($offerText, "(?s)## Sales page copy.*?(?=## Notes)", { param($match) $section }, 1)
      } elseif ($offerText -match "(?s)## Where to find it\s*") {
        $offerText = [regex]::Replace($offerText, "(?s)## Where to find it\s*", { param($match) $section }, 1)
      } elseif ($offerText -notmatch "## Sales page copy") {
        $offerText = [regex]::Replace($offerText, "(?m)^## Notes", { param($match) "$section`n## Notes" }, 1)
      }
      Set-Content -LiteralPath $offerFile -Value $offerText -Encoding UTF8
    }

    $results.Add([pscustomobject]@{ offer = $page.Offer; status = "captured"; chars = $visibleText.Length; source = $page.Url })
  } catch {
    $results.Add([pscustomobject]@{ offer = $page.Offer; status = "failed"; chars = 0; source = $page.Url; error = $_.Exception.Message })
  }
}

$results | ConvertTo-Json -Depth 3
