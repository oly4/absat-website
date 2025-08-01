# موقع ابسط - محلل إعلانات تداول السعودية

## 🎯 المميزات

### ✅ وظائف الإعلانات:
- **عرض الإعلانات**: من قاعدة بيانات Supabase
- **التحليل المالي**: عرض التحليل والإيموجي
- **المقارنات التاريخية**: 3 مقارنات مع أداء يومي/أسبوعي/شهري
- **تنبيه التحليل**: تنبيه أصفر واضح "تحليل وليس توصية استثمارية"

### 🎨 التصميم:
- **أيقونة الهمبرجر**: مربع أزرق بنفسجي `#4545B8` مع خطوط بيضاء
- **زر قائمة المتابعة**: باللون `#4545B8`
- **زر إعادة التعيين**: باللون `#4545B8`
- **قسم البحث**: تدرج أزرق جميل
- **تنبيه التحليل**: خلفية صفراء مع نص بني

## 🗄️ إعداد قاعدة البيانات

### 1. إنشاء جدول `processed_announcements` في Supabase:

```sql
CREATE TABLE processed_announcements (
  id SERIAL PRIMARY KEY,
  original_title TEXT,
  company_name TEXT,
  announcement_date DATE,
  analysis_concept TEXT,
  analysis_emoji TEXT,
  comparison_1_title TEXT,
  comparison_1_date DATE,
  comparison_1_day TEXT,
  comparison_1_week TEXT,
  comparison_1_month TEXT,
  comparison_2_title TEXT,
  comparison_2_date DATE,
  comparison_2_day TEXT,
  comparison_2_week TEXT,
  comparison_2_month TEXT,
  comparison_3_title TEXT,
  comparison_3_date DATE,
  comparison_3_day TEXT,
  comparison_3_week TEXT,
  comparison_3_month TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### 2. إضافة بيانات تجريبية:

```sql
INSERT INTO processed_announcements (
  original_title,
  company_name,
  announcement_date,
  analysis_concept,
  analysis_emoji,
  comparison_1_title,
  comparison_1_date,
  comparison_1_day,
  comparison_1_week,
  comparison_1_month,
  comparison_2_title,
  comparison_2_date,
  comparison_2_day,
  comparison_2_week,
  comparison_2_month,
  comparison_3_title,
  comparison_3_date,
  comparison_3_day,
  comparison_3_week,
  comparison_3_month
) VALUES (
  'إعلان نتائج الربع الثالث',
  'شركة أرامكو',
  '2024-01-15',
  'تحليل مختصر: إعلان إيجابي يتعلق بزيادة الأرباح بنسبة 15%، مما يعكس تحسناً في الأداء المالي للشركة',
  '✅',
  'مقارنة مع الربع السابق',
  '2024-07-15',
  '📈 +2.5%',
  '📈 +5.2%',
  '📈 +12.1%',
  'مقارنة مع نفس الفترة العام الماضي',
  '2023-10-15',
  '📉 -1.8%',
  '📈 +4.7%',
  '📈 +9.3%',
  'مقارنة مع آخر إعلان مهم',
  '2024-01-15',
  '➖ 0.0%',
  '📈 +6.8%',
  '📈 +14.2%'
);
```

## 🚀 تشغيل الموقع

### الطريقة الأولى (الأسهل):
1. انقر مرتين على ملف: `start-absat-simple.bat`
2. انتظر حتى يفتح المتصفح تلقائياً

### الطريقة الثانية (يدوية):
1. افتح PowerShell
2. اكتب: `cd "C:\Users\mo0od\ceo\absat-website"`
3. اكتب: `npm install`
4. اكتب: `npm start`

## 📱 الموقع سيعمل على:
**http://localhost:3000**

## 🔧 ملاحظات تقنية:
- الموقع متصل بقاعدة بيانات Supabase
- يدعم التصميم المتجاوب (Responsive Design)
- يعرض البيانات بشكل مرتب ومنظم
- يحتوي على تنبيهات واضحة للتحليل
- يدعم الإيموجي في المقارنات التاريخية

## 📊 هيكل البيانات:
- `original_title`: عنوان الإعلان الأصلي
- `company_name`: اسم الشركة
- `announcement_date`: تاريخ الإعلان
- `analysis_concept`: التحليل المختصر
- `analysis_emoji`: إيموجي التحليل (✅/❌/➖)
- `comparison_X_title`: عنوان المقارنة
- `comparison_X_date`: تاريخ المقارنة
- `comparison_X_day/week/month`: الأداء مع الإيموجي

## ⚠️ تنبيه مهم:
جميع التحليلات المقدمة هي **تحليل وليس توصية استثمارية**، ويجب على المستخدمين إجراء أبحاثهم الخاصة قبل اتخاذ أي قرارات استثمارية. 