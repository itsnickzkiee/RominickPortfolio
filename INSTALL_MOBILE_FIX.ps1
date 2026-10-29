# Run from inside your GitHub-connected RominickPortfolio folder.
# Adds a stylesheet/script reference to each page without overwriting content.
$ErrorActionPreference = 'Stop'

$folder = $PSScriptRoot
$css = Join-Path $folder 'mobile-fixes.css'
$js = Join-Path $folder 'mobile-fixes.js'

if (-not (Test-Path $css) -or -not (Test-Path $js)) {
    throw 'Put mobile-fixes.css, mobile-fixes.js, and this installer in the SAME folder.'
}

$utf8 = New-Object System.Text.UTF8Encoding($false)
$cssTag = '    <link rel="stylesheet" href="mobile-fixes.css">'
$jsTag = '    <script src="mobile-fixes.js"></script>'

foreach ($page in @('index.html', 'about.html', 'projects.html', 'contact.html')) {
    $path = Join-Path $folder $page
    if (-not (Test-Path $path)) {
        Write-Warning ('Skipped {0}: HTML file not found.' -f $page)
        continue
    }
    $html = [System.IO.File]::ReadAllText($path)
    $changed = $false

    if ($html -notmatch 'mobile-fixes\.css') {
        if ($html -notmatch '(?i)</head>') { throw ('Missing closing head tag in {0}' -f $page) }
        $html = $html -replace '(?i)</head>', "$cssTag`r`n</head>"
        $changed = $true
    }
    if ($html -notmatch 'mobile-fixes\.js') {
        if ($html -notmatch '(?i)</body>') { throw ('Missing closing body tag in {0}' -f $page) }
        $html = $html -replace '(?i)</body>', "$jsTag`r`n</body>"
        $changed = $true
    }

    if ($changed) {
        $backupPath = "$path.before-mobile-fix.bak"
        if (-not (Test-Path $backupPath)) { Copy-Item -LiteralPath $path -Destination $backupPath }
        [System.IO.File]::WriteAllText($path, $html, $utf8)
        Write-Host ('Updated {0}' -f $page) -ForegroundColor Green
    } else {
        Write-Host ('Already installed: {0}' -f $page)
    }
}
Write-Host 'Done! Preview with Live Server before committing.' -ForegroundColor Cyan
