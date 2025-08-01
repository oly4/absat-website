# حل مشكلة سياسة التنفيذ في PowerShell
Write-Host "جاري حل مشكلة سياسة التنفيذ..." -ForegroundColor Yellow

try {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Write-Host "✅ تم حل مشكلة سياسة التنفيذ بنجاح!" -ForegroundColor Green
    Write-Host "يمكنك الآن تشغيل npm start" -ForegroundColor Green
} catch {
    Write-Host "❌ فشل في حل مشكلة سياسة التنفيذ" -ForegroundColor Red
    Write-Host "جرب تشغيل PowerShell كمسؤول" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "اضغط أي مفتاح للخروج..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 