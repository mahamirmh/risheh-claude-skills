# Skill: release-checklist

## فرمان
`/release-checklist`

## هدف
ساخت چک‌لیست انتشار امن و قابل پیگیری برای محیط Production.

## دستورالعمل
1. Scope نسخه و تغییرات اثرگذار را مشخص کن.
2. وضعیت تست، Migration، Backup و Rollback را بررسی کن.
3. متغیرهای محیطی، Secrets و تنظیمات Production را کنترل کن.
4. سازگاری API، دیتابیس و Clientهای قدیمی را بررسی کن.
5. Monitoring، Alerting، Logging و Health Check را آماده کن.
6. مسئول اجرا، زمان‌بندی و معیار Go/No-Go را تعیین کن.
7. اقدامات پس از انتشار و مسیر Rollback را بنویس.

## قالب خروجی
- Pre-release
- Deployment
- Verification
- Monitoring
- Rollback
- Post-release
- Go/No-Go Decision
