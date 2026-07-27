# راهنمای سازگاری Risheh Universal AI Skills

## اصل معماری

پوشه `skills/` تنها منبع اصلی محتواست. هر Skill در مسیر زیر نگهداری می‌شود:

```text
skills/<skill-name>/SKILL.md
```

Installerها از این فایل‌ها برای ابزارهای مختلف Adapter تولید می‌کنند. بنابراین اصلاح اصلی باید فقط در `SKILL.md` انجام شود.

## ماتریس سازگاری

| ابزار | فایل یا مسیر | روش فراخوانی |
|---|---|---|
| Claude Code / Cowork | `.claude/skills/<name>/SKILL.md` | خودکار یا `/name` |
| OpenAI Codex | `.codex/skills` و `.agents/skills` | خودکار یا درخواست استفاده از Skill |
| ChatGPT Skills | استاندارد Agent Skills؛ نصب در رابط ChatGPT برای حساب‌های پشتیبانی‌شده | از بخش Skills یا درخواست طبیعی |
| Cursor | `.cursor/rules/risheh-skills.mdc` | خودکار بر اساس Rule |
| GitHub Copilot | `.github/prompts/<name>.prompt.md` | `/name` در محیط‌های پشتیبانی‌شده |
| GitHub Copilot | `.github/copilot-instructions.md` | خودکار در Context مخزن |
| Gemini CLI | `.gemini/commands/<name>.toml` | `/name` |
| Gemini Agent | `GEMINI.md` | خودکار در Context پروژه |
| Cline | `.clinerules/risheh-skills.md` | خودکار/قابل فعال‌سازی در Rules |
| Windsurf | `.windsurf/rules/risheh-skills.md` و `.windsurfrules` | خودکار بر اساس Rule |
| Agentهای عمومی | `AGENTS.md` | خودکار در ابزارهای سازگار |
| ChatGPT/Gemini/Claude Web عمومی | `skills/<name>/SKILL.md` | متن فایل را Attach یا Copy کنید |

## محدودیت مهم

«تمام AIها» یک API یا استاندارد نصب مشترک ندارند. ابزارهای وب عمومی معمولاً اجازه کپی خودکار فایل در حساب کاربر را نمی‌دهند. این مخزن سه سطح پشتیبانی دارد:

1. **Native Skill:** Claude، Codex و محصولات سازگار با Agent Skills.
2. **Adapter:** Cursor، Copilot، Gemini CLI، Cline و Windsurf.
3. **Portable Prompt:** سرویس‌های وبی که فقط متن، فایل یا Project Instructions دریافت می‌کنند.

## اضافه‌کردن ابزار جدید

برای اضافه‌کردن یک AI جدید:

1. مسیر رسمی Rules، Commands یا Instructions آن را از مستندات رسمی بررسی کنید.
2. در Installerها یک Adapter بسازید که محتوای `SKILL.md` را تبدیل یا ارجاع دهد.
3. منطق Skill را داخل Adapter تکرار نکنید.
4. Windows، macOS/Linux و نصب Project-local را تست کنید.
5. جدول این فایل و README را به‌روزرسانی کنید.

## امنیت

- Installer نباید Secret، Token یا Credential بخواند یا منتقل کند.
- فایل‌های تولیدشده فقط شامل Prompt و Instruction هستند.
- عملیات مخرب باید نیازمند تأیید انسان باقی بماند.
- خروجی Agentها باید پیش از Merge یا Deploy تست و بازبینی شود.
