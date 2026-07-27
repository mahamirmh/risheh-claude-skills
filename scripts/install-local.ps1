param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectPath
)

$ErrorActionPreference = "Stop"
$source = Join-Path $PSScriptRoot "..\skills"
$destination = Join-Path $ProjectPath ".claude\skills"

if (-not (Test-Path $ProjectPath)) {
    throw "Project path not found: $ProjectPath"
}

if (-not (Test-Path $source)) {
    throw "Skills directory not found: $source"
}

New-Item -ItemType Directory -Force -Path $destination | Out-Null
Copy-Item -Path (Join-Path $source "*") -Destination $destination -Recurse -Force

Write-Host "Project-local Claude skills installed successfully." -ForegroundColor Green
Write-Host "Destination: $destination"
