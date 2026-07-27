param(
    [string]$Destination = "$HOME\.claude\skills"
)

$ErrorActionPreference = "Stop"
$source = Join-Path $PSScriptRoot "..\skills"

if (-not (Test-Path $source)) {
    throw "Skills directory not found: $source"
}

New-Item -ItemType Directory -Force -Path $Destination | Out-Null
Copy-Item -Path (Join-Path $source "*") -Destination $Destination -Recurse -Force

Write-Host "Claude skills installed successfully." -ForegroundColor Green
Write-Host "Destination: $Destination"
Write-Host "Restart Claude Code if it is currently open."
