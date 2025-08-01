# تشغيل موقع ابسط - حل مشاكل PowerShell
Write-Host "========================================" -ForegroundColor Green
Write-Host "    تشغيل موقع ابسط - حل مشاكل PowerShell" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# حل مشكلة سياسة التنفيذ
Write-Host "جاري حل مشكلة سياسة التنفيذ..." -ForegroundColor Yellow
try {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Write-Host "✅ تم حل مشكلة سياسة التنفيذ بنجاح!" -ForegroundColor Green
} catch {
    Write-Host "⚠️  لا يمكن تغيير سياسة التنفيذ، سنحاول طريقة بديلة" -ForegroundColor Yellow
}

Write-Host ""

# الانتقال لمجلد المشروع
Write-Host "جاري الانتقال لمجلد المشروع..." -ForegroundColor Yellow
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath
Write-Host "✅ تم الانتقال لمجلد المشروع: $scriptPath" -ForegroundColor Green

Write-Host ""

# فحص Node.js
Write-Host "جاري فحص Node.js..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js متاح: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js غير متاح!" -ForegroundColor Red
    Write-Host "يرجى تثبيت Node.js من https://nodejs.org/" -ForegroundColor Red
    Read-Host "اضغط Enter للخروج"
    exit 1
}

Write-Host ""

# فحص npm
Write-Host "جاري فحص npm..." -ForegroundColor Yellow
try {
    $npmVersion = npm --version
    Write-Host "✅ npm متاح: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm غير متاح!" -ForegroundColor Red
    Read-Host "اضغط Enter للخروج"
    exit 1
}

Write-Host ""

# فحص package.json
if (-not (Test-Path "package.json")) {
    Write-Host "❌ ملف package.json غير موجود!" -ForegroundColor Red
    Write-Host "تأكد من أنك في المجلد الصحيح للمشروع" -ForegroundColor Red
    Read-Host "اضغط Enter للخروج"
    exit 1
}

Write-Host "✅ ملف package.json موجود" -ForegroundColor Green

Write-Host ""

# فحص node_modules
if (-not (Test-Path "node_modules")) {
    Write-Host "⚠️  مجلد node_modules غير موجود" -ForegroundColor Yellow
    Write-Host "جاري تثبيت المكتبات..." -ForegroundColor Yellow
    
    try {
        npm install
        Write-Host "✅ تم تثبيت المكتبات بنجاح!" -ForegroundColor Green
    } catch {
        Write-Host "❌ فشل في تثبيت المكتبات!" -ForegroundColor Red
        Read-Host "اضغط Enter للخروج"
        exit 1
    }
} else {
    Write-Host "✅ مجلد node_modules موجود" -ForegroundColor Green
}

Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host "    جاري تشغيل موقع ابسط" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "الموقع سيعمل على: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "اضغط Ctrl+C لإيقاف الموقع" -ForegroundColor Yellow
Write-Host ""

# تشغيل الموقع
try {
    npm start
} catch {
    Write-Host "❌ فشل في تشغيل الموقع!" -ForegroundColor Red
    Read-Host "اضغط Enter للخروج"
} 