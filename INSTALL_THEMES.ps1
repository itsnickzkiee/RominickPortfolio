<#
Run this file from your Git-connected RominickPortfolio folder after copying the
three theme files there. Existing HTML is backed up to Windows TEMP and only
three references are added. It does NOT overwrite project cards or CSS/JS.
#>
param([string]$PortfolioPath = $PSScriptRoot)
$ErrorActionPreference = 'Stop'
$PortfolioPath = (Resolve-Path $PortfolioPath).Path
$required = @('theme-init.js', 'themes.css', 'themes.js')
foreach ($file in $required) {
    if (-not (Test-Path (Join-Path $PortfolioPath $file))) {
        throw "Missing $file in $PortfolioPath. Copy all three theme files first."
    }
}
$backup = Join-Path $env:TEMP ('RominickPortfolioThemeBackup-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
New-Item -ItemType Directory -Path $backup -Force | Out-Null
$cssLink = '<link rel="stylesheet" href="style.css">'
$initLink = '<script src="theme-init.js"></script>'
$themeCssLink = '<link rel="stylesheet" href="themes.css">'
$jsLink = '<script src="script.js"></script>'
$themeJsLink = '<script src="themes.js"></script>'
foreach ($name in @('index.html', 'about.html', 'projects.html', 'contact.html')) {
    $path = Join-Path $PortfolioPath $name
    if (-not (Test-Path $path)) { Write-Warning "Skipped ${name}: file not found"; continue }
    $html = [IO.File]::ReadAllText($path)
    if (-not $html.Contains($cssLink) -or -not $html.Contains($jsLink)) {
        Write-Warning "Skipped ${name}: expected style.css or script.js link missing; insert manually"
        continue
    }
    Copy-Item $path (Join-Path $backup $name)
    if (-not $html.Contains('theme-init.js')) {
        $html = $html.Replace($cssLink, $initLink + "`r`n    " + $cssLink)
    }
    if (-not $html.Contains('themes.css')) {
        $html = $html.Replace($cssLink, $cssLink + "`r`n    " + $themeCssLink)
    }
    if (-not $html.Contains('themes.js')) {
        $html = $html.Replace($jsLink, $jsLink + "`r`n    " + $themeJsLink)
    }
    [IO.File]::WriteAllText($path, $html, [System.Text.UTF8Encoding]::new($false))
    Write-Host "Theme support ready: $name" -ForegroundColor Green
}
Write-Host "`nDone! Existing content preserved. Backups saved to: $backup" -ForegroundColor Cyan
Write-Host 'Open index.html, click the new Theme control in the navbar.' -ForegroundColor Cyan

