param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectPath
)

$ErrorActionPreference = "Stop"
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$skillsSource = Join-Path $repoRoot "skills"
$project = (Resolve-Path $ProjectPath).Path

function Ensure-Dir([string]$Path) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
function Copy-Skills([string]$Path) {
    Ensure-Dir $Path
    Copy-Item -Path (Join-Path $skillsSource "*") -Destination $Path -Recurse -Force
}

Copy-Skills (Join-Path $project ".claude\skills")
Copy-Skills (Join-Path $project ".codex\skills")
Copy-Skills (Join-Path $project ".agents\skills")

$skillIndex = @()
Get-ChildItem $skillsSource -Directory | ForEach-Object {
    $name = $_.Name
    $relative = "skills/$name/SKILL.md"
    $skillIndex += "- **$name**: برای کارهای مرتبط، فایل ``$relative`` را بخوان و طبق آن اجرا کن."
}
$indexText = $skillIndex -join "`n"
$agentText = @"
# Risheh Universal AI Skills

قبل از اجرای کار، Skillهای زیر را بررسی کن. وقتی درخواست با یک Skill مرتبط است، فایل همان Skill را بخوان و دستورهای آن را اجرا کن. از حدس‌زدن محتوای Skill خودداری کن.

$indexText

## قواعد ایمنی
- اطلاعات حساس، رمز و API Key را افشا یا Commit نکن.
- پیش از عملیات مخرب، Migration یا Deploy نتیجه را بازبینی و اجازه لازم را دریافت کن.
- خروجی را با تست و شواهد قابل بررسی تحویل بده.
"@
Set-Content (Join-Path $project "AGENTS.md") $agentText -Encoding UTF8
Set-Content (Join-Path $project "CLAUDE.md") "@./AGENTS.md`n" -Encoding UTF8
Set-Content (Join-Path $project "GEMINI.md") "@./AGENTS.md`n" -Encoding UTF8

$cursorDir = Join-Path $project ".cursor\rules"; Ensure-Dir $cursorDir
$cursorRule = "---`ndescription: Risheh reusable AI skills and workflows`nalwaysApply: true`n---`n`n$agentText"
Set-Content (Join-Path $cursorDir "risheh-skills.mdc") $cursorRule -Encoding UTF8

$clineDir = Join-Path $project ".clinerules"; Ensure-Dir $clineDir
Set-Content (Join-Path $clineDir "risheh-skills.md") $agentText -Encoding UTF8

$windsurfDir = Join-Path $project ".windsurf\rules"; Ensure-Dir $windsurfDir
Set-Content (Join-Path $windsurfDir "risheh-skills.md") $agentText -Encoding UTF8
Set-Content (Join-Path $project ".windsurfrules") $agentText -Encoding UTF8

$githubDir = Join-Path $project ".github"; Ensure-Dir $githubDir
Set-Content (Join-Path $githubDir "copilot-instructions.md") $agentText -Encoding UTF8
$promptsDir = Join-Path $githubDir "prompts"; Ensure-Dir $promptsDir
$geminiCommands = Join-Path $project ".gemini\commands"; Ensure-Dir $geminiCommands

Get-ChildItem $skillsSource -Directory | ForEach-Object {
    $name = $_.Name
    $skillFile = Join-Path $_.FullName "SKILL.md"
    if (-not (Test-Path $skillFile)) { return }
    $body = Get-Content $skillFile -Raw

    $copilot = "---`nagent: 'agent'`ndescription: 'Risheh skill: $name'`n---`n`n$body"
    Set-Content (Join-Path $promptsDir "$name.prompt.md") $copilot -Encoding UTF8

    $escaped = $body.Replace('"""','\"\"\"')
    $toml = "description = `"Risheh AI skill: $name`"`nprompt = `"`"`"`n$escaped`n`"`"`"`n"
    Set-Content (Join-Path $geminiCommands "$name.toml") $toml -Encoding UTF8
}

Write-Host "Universal AI skills installed in project: $project" -ForegroundColor Green
Write-Host "Supported adapters: Claude, Codex, Agent Skills, Cursor, Copilot, Gemini CLI, Cline and Windsurf."