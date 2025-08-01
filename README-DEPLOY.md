# 🚀 نشر موقع ابسط على Vercel

## 📋 **الخطوات السريعة:**

### **1. تحضير المشروع**
```bash
# شغل السكريبت المخصص
deploy-vercel.bat
```

### **2. رفع المشروع على GitHub**
```bash
git add .
git commit -m "Prepare for Vercel deployment"
git push origin main
```

### **3. نشر على Vercel**
1. اذهب إلى https://vercel.com
2. سجل حساب جديد
3. اضغط "New Project"
4. اختر مستودع GitHub
5. اضغط "Deploy"

### **4. إعداد متغيرات البيئة**
في إعدادات المشروع على Vercel، أضف:

| Variable | Value |
|----------|-------|
| `REACT_APP_SUPABASE_URL` | رابط Supabase الخاص بك |
| `REACT_APP_SUPABASE_ANON_KEY` | مفتاح Supabase الخاص بك |

### **5. إعداد CORS في Supabase**
اذهب إلى إعدادات Supabase وأضف:
- `https://your-site-name.vercel.app`

## ✅ **النتيجة:**
- رابط مثل: `https://absat-website.vercel.app`
- يعمل على جميع الأجهزة
- سريع وآمن
- مجاني تماماً

## 🛠️ **حل المشاكل:**

### **مشكلة: البيانات لا تظهر**
- تحقق من متغيرات البيئة في Vercel
- تأكد من إعدادات CORS في Supabase

### **مشكلة: الموقع لا يظهر**
- تحقق من console المتصفح للأخطاء
- تأكد من أن `npm run build` يعمل

### **مشكلة: الروابط لا تعمل**
- تأكد من إعدادات redirect في vercel.json 