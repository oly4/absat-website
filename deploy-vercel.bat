@echo off
echo 🚀 جاري تحضير موقع ابسط للنشر على Vercel...
echo.

echo 📦 تثبيت المكتبات...
npm install
if %errorlevel% neq 0 (
    echo ❌ فشل في تثبيت المكتبات!
    pause
    exit /b 1
)

echo 🔨 بناء الموقع...
npm run build
if %errorlevel% neq 0 (
    echo ❌ فشل في بناء الموقع!
    pause
    exit /b 1
)

echo ✅ تم بناء الموقع بنجاح!
echo.
echo 🌐 الآن اتبع هذه الخطوات:
echo.
echo 1️⃣ اذهب إلى https://vercel.com
echo 2️⃣ سجل حساب جديد أو سجل دخول
echo 3️⃣ اضغط "New Project"
echo 4️⃣ اختر مستودع GitHub الخاص بك
echo 5️⃣ اضغط "Deploy"
echo.
echo 📝 ملاحظات مهمة:
echo - تأكد من إضافة متغيرات البيئة في إعدادات Vercel
echo - أضف نطاق موقعك في إعدادات CORS في Supabase
echo.
echo 📖 راجع ملف كيفية-نشر-الموقع.md للتفاصيل
pause 