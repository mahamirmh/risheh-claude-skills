param()

$ErrorActionPreference = "Stop"
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$skillsSource = Join-Path $repoRoot "skills"

if (-not (Test-Path $skillsSource)) { throw "Skills directory not found: $skillsSource" }

function Copy-Skills([string]$Destination) {
    New-Item -ItemType Directory -Force -Path $Destination | Out-Null
    Copy-Item -Path (Join-Path $skillsSource "*") -Destination $Destination -Recurse -Force
    Write-Host "Installed: $Destination" -ForegroundColor Green
}

Copy-Skills (Join-Path $HOME ".claude\skills")
Copy-Skills (Join-Path $HOME ".codex\skills")
Copy-Skills (Join-Path $HOME ".agents\skills")

$geminiCommands = Join-Path $HOME ".gemini\commands"
New-Item -ItemType Directory -Force -Path $geminiCommands | Out-Null
Get-ChildItem $skillsSource -Directory | ForEach-Object {
    $name = $_.Name
    $skillFile = Join-Path $_.FullName "SKILL.md"
    if (Test-Path $skillFile) {
        $body = (Get-Content $skillFile -Raw).Replace('"""','\"\"\"')
        $toml = "description = `"Risheh AI skill: $name`"`nprompt = `"`"`"`n$body`n`"`"`"`n"
        Set-Content -Path (Join-Path $geminiCommands "$name.toml") -Value $toml -Encoding UTF8
    }
}
Write-Host "Installed Gemini CLI commands: $geminiCommands" -ForegroundColor Green

Write-Host "`nGlobal installation complete for Claude, Codex/OpenAI Agent Skills and Gemini CLI." -ForegroundColor Cyan
Write-Host "For Cursor, Copilot, Cline and Windsurf run install-project-all.ps1 inside each project."