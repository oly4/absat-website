@echo off
echo 🚀 جاري بناء موقع ابسط للنشر...
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
echo 📁 تم إنشاء مجلد build
echo 🌐 يمكنك الآن رفع محتويات مجلد build إلى:
echo    - Netlify
echo    - Vercel  
echo    - GitHub Pages
echo.
echo 📖 راجع ملف كيفية-نشر-الموقع.md للتفاصيل
pause 