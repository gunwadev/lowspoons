# Installs the plain output style and the lowspoons skill into ~/.claude/
# Copies two files. Touches nothing else.

$ErrorActionPreference = 'Stop'

$src    = $PSScriptRoot
$claude = Join-Path $HOME '.claude'

$styleDir = Join-Path $claude 'output-styles'
$skillDir = Join-Path $claude 'skills\lowspoons'

New-Item -ItemType Directory -Force -Path $styleDir | Out-Null
New-Item -ItemType Directory -Force -Path $skillDir | Out-Null

Copy-Item (Join-Path $src 'output-styles\plain.md')      $styleDir -Force
Copy-Item (Join-Path $src 'skills\lowspoons\SKILL.md')   $skillDir -Force

Write-Host ""
Write-Host "Installed:" -ForegroundColor Green
Write-Host "  $styleDir\plain.md"
Write-Host "  $skillDir\SKILL.md"
Write-Host ""
Write-Host "Next: run /output-style plain in Claude Code."
Write-Host "It takes effect in a new session, or after /clear."
Write-Host ""
