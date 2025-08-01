-- إنشاء جدول processed_announcements
CREATE TABLE IF NOT EXISTS processed_announcements (
  id SERIAL PRIMARY KEY,
  original_title TEXT,
  company_name TEXT,
  announcement_date DATE,
  analysis_concept TEXT,
  analysis_emoji TEXT,
  comparison_1_title TEXT,
  comparison_1_type TEXT,
  comparison_1_date DATE,
  comparison_1_day TEXT,
  comparison_1_week TEXT,
  comparison_1_month TEXT,
  comparison_2_title TEXT,
  comparison_2_type TEXT,
  comparison_2_date DATE,
  comparison_2_day TEXT,
  comparison_2_week TEXT,
  comparison_2_month TEXT,
  comparison_3_title TEXT,
  comparison_3_type TEXT,
  comparison_3_date DATE,
  comparison_3_day TEXT,
  comparison_3_week TEXT,
  comparison_3_month TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- إضافة بيانات تجريبية
INSERT INTO processed_announcements (
  original_title,
  company_name,
  announcement_date,
  analysis_concept,
  analysis_emoji,
  comparison_1_title,
  comparison_1_type,
  comparison_1_date,
  comparison_1_day,
  comparison_1_week,
  comparison_1_month,
  comparison_2_title,
  comparison_2_type,
  comparison_2_date,
  comparison_2_day,
  comparison_2_week,
  comparison_2_month,
  comparison_3_title,
  comparison_3_type,
  comparison_3_date,
  comparison_3_day,
  comparison_3_week,
  comparison_3_month
) VALUES 
(
  'إعلان نتائج الربع الثالث',
  'شركة أرامكو',
  '2024-01-15',
  'تحليل مختصر: إعلان إيجابي يتعلق بزيادة الأرباح بنسبة 15%، مما يعكس تحسناً في الأداء المالي للشركة',
  '✅',
  'مقارنة مع الربع السابق',
  'نفس الشركة',
  '2024-07-15',
  '📈 +2.5%',
  '📈 +5.2%',
  '📈 +12.1%',
  'مقارنة مع نفس الفترة العام الماضي',
  'نفس القطاع',
  '2023-10-15',
  '📉 -1.8%',
  '📈 +4.7%',
  '📈 +9.3%',
  'مقارنة مع آخر إعلان مهم',
  'قطاع آخر',
  '2024-01-15',
  '➖ 0.0%',
  '📈 +6.8%',
  '📈 +14.2%'
),
(
  'توزيع أرباح نقدية',
  'شركة سابك',
  '2024-01-14',
  'تحليل مختصر: إعلان محايد يتعلق بتوزيع أرباح نقدية للمساهمين، مما يعكس استقراراً في السياسة المالية للشركة',
  '➖',
  'مقارنة مع الربع السابق',
  'نفس الشركة',
  '2024-07-14',
  '📉 -1.5%',
  '📈 +2.3%',
  '📈 +7.8%',
  'مقارنة مع نفس الفترة العام الماضي',
  'نفس القطاع',
  '2023-10-14',
  '📈 +1.2%',
  '📈 +3.1%',
  '📈 +8.5%',
  'مقارنة مع آخر إعلان مهم',
  'قطاع آخر',
  '2024-01-14',
  '📈 +0.8%',
  '📈 +4.2%',
  '📈 +11.3%'
),
(
  'إعلان نتائج مالية',
  'شركة الراجحي',
  '2024-01-13',
  'تحليل مختصر: إعلان إيجابي يتعلق بتحسن في النتائج المالية، مما يعكس كفاءة في إدارة العمليات',
  '✅',
  'مقارنة مع الربع السابق',
  'نفس الشركة',
  '2024-07-13',
  '📈 +0.9%',
  '📈 +4.2%',
  '📈 +12.1%',
  'مقارنة مع نفس الفترة العام الماضي',
  'نفس القطاع',
  '2023-10-13',
  '📉 -0.5%',
  '📈 +2.8%',
  '📈 +7.2%',
  'مقارنة مع آخر إعلان مهم',
  'قطاع آخر',
  '2024-01-13',
  '📈 +1.1%',
  '📈 +5.6%',
  '📈 +13.4%'
); 