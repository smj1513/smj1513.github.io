$ErrorActionPreference = "Stop"

$indexPath = Join-Path $PSScriptRoot "..\\index.html"
$cssPath = Join-Path $PSScriptRoot "..\\css\\style.css"

$indexContent = Get-Content -Raw -Encoding UTF8 $indexPath
$cssContent = Get-Content -Raw -Encoding UTF8 $cssPath

$checks = @(
    @{
        Name = "privacy toggle button exists"
        Ok = $indexContent -match 'id="privacy-toggle"'
    },
    @{
        Name = "maskable text class exists in markup"
        Ok = $indexContent -match 'class="[^"]*maskable-text'
    },
    @{
        Name = "maskable row class exists in markup"
        Ok = $indexContent -match 'class="[^"]*maskable-row'
    },
    @{
        Name = "masked state styles exist"
        Ok = $cssContent -match '\.profile-card\.is-masked'
    },
    @{
        Name = "toggle script adds masked state"
        Ok = $indexContent -match 'classList\.toggle\("is-masked"\)'
    }
)

$failures = $checks | Where-Object { -not $_.Ok }

if ($failures.Count -gt 0) {
    Write-Host "FAIL: profile privacy mask checks failed:" -ForegroundColor Red
    $failures | ForEach-Object {
        Write-Host " - $($_.Name)" -ForegroundColor Red
    }
    exit 1
}

Write-Host "PASS: profile privacy mask checks passed." -ForegroundColor Green
