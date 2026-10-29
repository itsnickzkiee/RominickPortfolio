# Portfolio text/symbol encoding fix
# ASCII-only script to avoid PowerShell encoding problems.
# Run in the Git-connected RominickPortfolio folder.
$ErrorActionPreference = 'Stop'
$root = (Get-Location).Path
$pages = @('index.html', 'about.html', 'projects.html', 'contact.html')
$backupDir = Join-Path $env:TEMP ('Rominick_Portfolio_Encoding_Backup_' + (Get-Date -Format 'yyyyMMdd_HHmmss'))
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
$utf8 = New-Object System.Text.UTF8Encoding($false)
$legacy = [System.Text.Encoding]::GetEncoding(1252)
$symbols = @(
    @{ Num = 0x2013; Replacement = '-' },
    @{ Num = 0x2014; Replacement = ' - ' },
    @{ Num = 0x2192; Replacement = '&#8594;' },
    @{ Num = 0x2193; Replacement = '&#8595;' },
    @{ Num = 0x00A9; Replacement = '&copy;' },
    @{ Num = 0x2630; Replacement = '&#9776;' },
    @{ Num = 0x2715; Replacement = '&#10005;' },
    @{ Num = 0x2699; Replacement = '&#9881;' },
    @{ Num = 0x2022; Replacement = '&bull;' },
    @{ Num = 0x2019; Replacement = "'" },
    @{ Num = 0x2018; Replacement = "'" },
    @{ Num = 0x201C; Replacement = '"' },
    @{ Num = 0x201D; Replacement = '"' },
    @{ Num = 0x2713; Replacement = '&#10003;' }
)
foreach ($page in $pages) {
    $path = Join-Path $root $page
    if (-not (Test-Path -LiteralPath $path)) {
        Write-Warning ('Skipped {0}: file not found' -f $page)
        continue
    }
    $before = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $html = $before
    # Fix both original Unicode symbols and their common Windows-1252 mojibake variants.
    foreach ($item in $symbols) {
        $original = [string][char]$item.Num
        $mojibake = $legacy.GetString([System.Text.Encoding]::UTF8.GetBytes($original))
        if ($mojibake -ne $original) { $html = $html.Replace($mojibake, $item.Replacement) }
        $html = $html.Replace($original, $item.Replacement)
    }
    # Normalize project titles even if the dash has already been corrupted in a different way.
    $html = [System.Text.RegularExpressions.Regex]::Replace(
        $html,
        '(?is)<h2>\s*FieldPro\b(?:(?!</h2>).)*?Home Services Mobile App\s*</h2>',
        '<h2>FieldPro - Home Services Mobile App</h2>'
    )
    $html = [System.Text.RegularExpressions.Regex]::Replace(
        $html,
        '(?is)<h2>\s*PARA\b(?:(?!</h2>).)*?Pricing Analytics and Recommendation Assistant\s*</h2>',
        '<h2>PARA - Pricing Analytics and Recommendation Assistant</h2>'
    )
    if ($html -cne $before) {
        Copy-Item -LiteralPath $path -Destination (Join-Path $backupDir $page) -Force
        [System.IO.File]::WriteAllText($path, $html, $utf8)
        Write-Host ('Fixed: {0}' -f $page)
    } else {
        Write-Host ('Already clean: {0}' -f $page)
    }
}
Write-Host ('Backups of changed files: {0}' -f $backupDir)
Write-Host 'Done. Preview the site before committing.'
