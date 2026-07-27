# Risheh Claude Skills | مهارت‌های کلود ریشه

مجموعه‌ای مستقل از Skillهای آماده برای **Claude Code** و **Claude Cowork** با تمرکز بر کار تیمی، تحلیل محصول، معماری نرم‌افزار، تولید پرامپت، مستندسازی، امنیت، تست و تحویل پروژه.

این مخزن هیچ ارتباطی با ربات تلگرام یا Mini App ندارد و فقط برای مدیریت و نصب Skillهای Claude ساخته شده است.

## Skillهای اصلی

| فرمان | کاربرد |
|---|---|
| `/how-to` | تبدیل درخواست مبهم به راهنمای مرحله‌به‌مرحله |
| `/grill-me` | نقد سخت‌گیرانه ایده، تصمیم یا طرح برای کشف ضعف‌ها |
| `/prompt-master` | ساخت پرامپت دقیق و آماده اجرا |
| `/personal-voice` | بازنویسی متن با لحن شخصی یا سازمانی |
| `/fable` | توضیح مفاهیم پیچیده با داستان و تمثیل |
| `/48` | بهینه‌سازی پاسخ در چهار محور صحت، وضوح، کفایت و اجراپذیری |
| `/handoff` | آماده‌سازی تحویل پروژه بین اعضای تیم یا ایجنت‌ها |
| `/write-a-skill` | ساخت Skill جدید با ساختار استاندارد |
| `/anti-ai` | طبیعی‌تر و انسانی‌تر کردن متن، بدون جعل هویت یا فریب |

## Skillهای تکمیلی

| فرمان | کاربرد |
|---|---|
| `/prd` | تولید PRD اجرایی |
| `/architecture` | طراحی معماری نرم‌افزار |
| `/code-review` | بازبینی کد، کیفیت و ریسک‌ها |
| `/debug` | عیب‌یابی ساختاریافته |
| `/security-review` | بررسی امنیتی پروژه |
| `/qa-plan` | طراحی برنامه تست و پذیرش |
| `/release-checklist` | چک‌لیست انتشار Production |
| `/meeting-notes` | تبدیل جلسه به تصمیم، مسئول و اقدام |
| `/task-breakdown` | شکستن پروژه به تسک‌های شفاف |
| `/research-brief` | ساخت گزارش تحقیقاتی قابل استناد |

## ساختار مخزن

```text
risheh-claude-skills/
├── README.md
├── skills/
│   └── <skill-name>/
│       └── SKILL.md
├── scripts/
│   ├── install-windows.ps1
│   ├── install-macos.sh
│   ├── install-local.ps1
│   └── install-local.sh
└── docs/
    ├── TEAM_GUIDE_FA.md
    └── CREATE_NEW_SKILL.md
```

## نصب سراسری در Windows

```powershell
git clone https://github.com/mahamirmh/risheh-claude-skills.git
cd risheh-claude-skills
powershell -ExecutionPolicy Bypass -File .\scripts\install-windows.ps1
```

Skillها در مسیر زیر نصب می‌شوند:

```text
C:\Users\<USERNAME>\.claude\skills
```

## نصب سراسری در macOS / Linux

```bash
git clone https://github.com/mahamirmh/risheh-claude-skills.git
cd risheh-claude-skills
chmod +x scripts/install-macos.sh
./scripts/install-macos.sh
```

Skillها در مسیر زیر نصب می‌شوند:

```text
~/.claude/skills
```

## نصب فقط برای یک پروژه

### Windows

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-local.ps1 -ProjectPath "C:\path\to\project"
```

### macOS / Linux

```bash
chmod +x scripts/install-local.sh
./scripts/install-local.sh /path/to/project
```

خروجی در مسیر زیر قرار می‌گیرد:

```text
<project>/.claude/skills
```

## نمونه استفاده

```text
/how-to برای اجرای این پروژه با Docker یک راهنمای مرحله‌به‌مرحله بساز
```

```text
/grill-me این ایده SaaS را از نظر بازار، مدل درآمدی، امنیت و ریسک فنی نقد کن
```

```text
/prompt-master برای بازطراحی پنل ادمین پروژه یک پرامپت جامع بساز
```

```text
/handoff وضعیت پروژه را برای برنامه‌نویس بعدی آماده کن
```

## نکات ضروری تیم

1. Skill جایگزین PRD، مستند فنی یا بازبینی انسانی نیست؛ ابزار استانداردسازی کار است.
2. رمزها، API Key، اطلاعات مشتری و داده حساس را داخل پرامپت یا Commit قرار ندهید.
3. قبل از اجرای دستورهای مخرب مانند حذف فایل، Migration یا Deploy، خروجی را بازبینی کنید.
4. هر Skill را می‌توان با ویرایش فایل `SKILL.md` برای پروژه سفارشی کرد.
5. Skill `/anti-ai` فقط برای بهبود طبیعی‌بودن متن است و نباید برای جعل هویت، تقلب یا دورزدن سیاست‌ها استفاده شود.

## به‌روزرسانی

```bash
git pull
```

سپس اسکریپت نصب را دوباره اجرا کنید.

## مجوز استفاده

این مجموعه برای استفاده داخلی تیم ریشه و توسعه پروژه‌های حرفه‌ای طراحی شده است.