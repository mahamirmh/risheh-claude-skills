# Risheh Universal AI Skills | مهارت‌های چندهوش‌مصنوعی ریشه

مجموعه‌ای مستقل از Skillها و Prompt Workflowهای قابل استفاده برای تیم ریشه در چند ابزار هوش مصنوعی و Coding Agent.

این مخزن یک هسته مشترک در `skills/` دارد و آن را برای فرمت‌ها و مسیرهای مختلف نصب می‌کند؛ بنابراین لازم نیست برای هر ابزار، محتوا را جداگانه نگهداری کنید.

## پشتیبانی

| ابزار | نوع یکپارچه‌سازی | وضعیت |
|---|---|---|
| Claude Code / Claude Cowork | `SKILL.md` در `.claude/skills` | مستقیم |
| OpenAI Codex / ChatGPT Skills | Agent Skills در `.codex/skills` و `.agents/skills` | مستقیم |
| Cursor | Project Rules در `.cursor/rules` | Adapter |
| GitHub Copilot | Prompt Files و `copilot-instructions.md` | Adapter |
| Gemini CLI / Gemini Code Assist | Custom Commands و `GEMINI.md` | Adapter |
| Cline | Rules در `.clinerules` | Adapter |
| Windsurf | Rules در `.windsurf/rules` و `.windsurfrules` | Adapter |
| ابزارهای سازگار با `AGENTS.md` | فهرست و دستور کشف Skillها | مستقیم |
| ChatGPT، Gemini Web و سایر چت‌های عمومی | فایل Prompt قابل کپی از `skills/<name>/SKILL.md` | دستی |

> هیچ استاندارد واحدی وجود ندارد که بتوان Skill را به‌صورت خودکار داخل تمام سرویس‌های وب نصب کرد. نصب خودکار برای ابزارهایی انجام می‌شود که فایل پروژه، CLI یا مسیر تنظیمات قابل مدیریت دارند.

## Skillهای اصلی

| فرمان | کاربرد |
|---|---|
| `/how-to` | تبدیل درخواست مبهم به راهنمای مرحله‌به‌مرحله |
| `/grill-me` | نقد سخت‌گیرانه ایده، تصمیم یا طرح برای کشف ضعف‌ها |
| `/prompt-master` | ساخت پرامپت دقیق و آماده اجرا |
| `/personal-voice` | بازنویسی متن با لحن شخصی یا سازمانی |
| `/fable` | توضیح مفاهیم پیچیده با داستان و تمثیل |
| `/48` | بهینه‌سازی پاسخ از نظر صحت، وضوح، کفایت و اجراپذیری |
| `/handoff` | آماده‌سازی تحویل پروژه بین اعضای تیم یا ایجنت‌ها |
| `/write-a-skill` | ساخت Skill جدید با ساختار استاندارد |
| `/anti-ai` | طبیعی‌تر کردن متن، بدون جعل هویت یا فریب |

## Skillهای تکمیلی

`/prd`، `/architecture`، `/code-review`، `/debug`، `/security-review`، `/qa-plan`، `/release-checklist`، `/meeting-notes`، `/task-breakdown` و `/research-brief`.

## نصب سراسری روی تمام ابزارهای پشتیبانی‌شده

### Windows PowerShell

```powershell
git clone https://github.com/mahamirmh/risheh-claude-skills.git
cd risheh-claude-skills
powershell -ExecutionPolicy Bypass -File .\scripts\install-all-windows.ps1
```

### macOS / Linux

```bash
git clone https://github.com/mahamirmh/risheh-claude-skills.git
cd risheh-claude-skills
chmod +x scripts/install-all-unix.sh
./scripts/install-all-unix.sh
```

نصب سراسری، نسخه اصلی Skillها را در مسیرهای سازگار با Claude، Codex/OpenAI و Gemini CLI قرار می‌دهد. برای Cursor، Copilot، Cline و Windsurf بهتر است نصب Project-local انجام شود تا فایل‌ها همراه پروژه Commit شوند.

## نصب روی یک پروژه برای همه Agentها

### Windows

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-project-all.ps1 -ProjectPath "C:\path\to\project"
```

### macOS / Linux

```bash
chmod +x scripts/install-project-all.sh
./scripts/install-project-all.sh /path/to/project
```

خروجی شامل این مسیرهاست:

```text
<project>/
├── AGENTS.md
├── CLAUDE.md
├── GEMINI.md
├── .claude/skills/
├── .codex/skills/
├── .agents/skills/
├── .gemini/commands/
├── .cursor/rules/
├── .github/copilot-instructions.md
├── .github/prompts/
├── .clinerules/
├── .windsurf/rules/
└── .windsurfrules
```

## نحوه استفاده

در ابزارهایی که Slash Command دارند:

```text
/how-to برای اجرای پروژه با Docker راهنمای مرحله‌به‌مرحله بساز
/grill-me این ایده SaaS را از نظر بازار، امنیت و ریسک فنی نقد کن
/security-review احراز هویت پروژه را بررسی کن
```

در Agentهایی که Slash Command ندارند:

```text
از Skill security-review موجود در مخزن استفاده کن و احراز هویت پروژه را بررسی کن.
```

## منبع اصلی محتوا

تنها Source of Truth پوشه زیر است:

```text
skills/<skill-name>/SKILL.md
```

Adapterها و اسکریپت‌ها نباید منطق Skill را جداگانه بازنویسی کنند. با اجرای دوباره Installer، خروجی ابزارها از روی همین فایل‌ها بازسازی می‌شود.

## نکات ضروری تیم

1. رمز، API Key، اطلاعات مشتری و داده حساس را داخل Prompt یا Commit قرار ندهید.
2. قبل از اجرای حذف فایل، Migration، تغییر دیتابیس یا Deploy، تغییرات را بازبینی کنید.
3. Skill جایگزین PRD، مستند فنی، تست و بازبینی انسانی نیست.
4. خروجی AI قطعی و بدون خطا نیست؛ تست و Fact-check الزامی است.
5. `/anti-ai` فقط برای بهبود لحن است و نباید برای جعل هویت، تقلب یا دورزدن سیاست‌ها استفاده شود.

## مستندات

- [راهنمای سازگاری ابزارها](docs/AI_COMPATIBILITY.md)
- [راهنمای فارسی تیم](docs/TEAM_GUIDE_FA.md)
- [راهنمای ساخت Skill جدید](docs/CREATE_NEW_SKILL.md)

## به‌روزرسانی

```bash
git pull
```

سپس Installer مناسب را دوباره اجرا کنید.
