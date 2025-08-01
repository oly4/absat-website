import React, { useState, useEffect } from 'react';
import './App.css';
import { supabase } from './supabaseClient';

function App() {
  const [keyword, setKeyword] = useState('');
  const [period, setPeriod] = useState('');
  const [market, setMarket] = useState('');
  const [announcements, setAnnouncements] = useState([]);
  const [loading, setLoading] = useState(true);
  const [expandedId, setExpandedId] = useState(null);

  useEffect(() => {
    fetchAnnouncements();
  }, []);

  const fetchAnnouncements = async () => {
    try {
      setLoading(true);
      const { data, error } = await supabase
        .from('processed_announcements')
        .select('*')
        .order('created_at', { ascending: false })
        .order('announcement_date', { ascending: false })
        .order('id', { ascending: false });

      if (error) {
        console.error('Error fetching announcements:', error);
        return;
      }

      console.log('Fetched data:', data);
      setAnnouncements(data || []);
    } catch (error) {
      console.error('Error:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleReset = () => {
    setKeyword('');
    setPeriod('');
    setMarket('');
  };



  const toggleExpanded = (id) => {
    setExpandedId(expandedId === id ? null : id);
  };

  const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString('ar-SA');
  };

  return (
    <div className="App">
      {/* Header */}
      <header className="header">
        <div className="header-content">
          <div className="menu-icon">
            <div className="hamburger">
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
          
                     <div className="logo">
   <h1>ابسط</h1>
   <div className="logo-icon">
     <img src="/image0.jpg" alt="ابسط لوقو" />
   </div>
 </div>
          
          <div className="follow-list">
            <button className="follow-button">
              قائمة المتابعة
              <span className="arrow-down">▼</span>
            </button>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="main">
        <div className="container">
          {/* Title */}
          <h2 className="main-title">إعلانات المصدرين والمستشار المالي</h2>
          
          {/* Search and Filter Section */}
          <div className="search-filter-section">
            <div className="search-filter-container">
              <div className="filter-item">
                <label>كلمة مفتاحية</label>
                <input
                  type="text"
                  placeholder="ادخل كلمة مفتاحية"
                  value={keyword}
                  onChange={(e) => setKeyword(e.target.value)}
                />
              </div>
              
              <div className="filter-item">
                <label>اختر الفترة</label>
                <select value={period} onChange={(e) => setPeriod(e.target.value)}>
                  <option value="">لم يتم التحديد</option>
                  <option value="today">اليوم</option>
                  <option value="week">الأسبوع</option>
                  <option value="month">الشهر</option>
                </select>
              </div>
              
              <div className="filter-item">
                <label>السوق</label>
                <select value={market} onChange={(e) => setMarket(e.target.value)}>
                  <option value="">لم يتم التحديد</option>
                  <option value="tadawul">تداول</option>
                  <option value="nomu">نمو</option>
                  <option value="other">أخرى</option>
                </select>
              </div>
              
              <div className="filter-item">
                <button className="reset-button" onClick={handleReset}>
                  <span className="arrow-left">←</span>
                  إعادة التعيين
                </button>
              </div>
            </div>
          </div>
          
                     {/* Announcements Section */}
           <div className="announcements-section">
             <h3 className="section-title">الإعلانات</h3>
             <div className="update-schedule">
               <span className="update-icon">🔄</span>
               <span className="update-text">
                 الإعلانات تتحدث كل 6 ساعات ماعدا من 9 إلى 10 الصباح كل 15 دقيقة
               </span>
             </div>
            
            {loading ? (
              <div className="loading">جاري تحميل الإعلانات...</div>
            ) : (
              <div className="announcements-container">
                {announcements.length > 0 ? (
                  announcements.map((announcement) => (
                    <div key={announcement.id} className="announcement-card">
                      <div className="card-content">
                        <div className="card-header" onClick={() => toggleExpanded(announcement.id)}>
                          <h4>{announcement.company_name || 'شركة غير محددة'}</h4>
                          <span className="date">{formatDate(announcement.announcement_date)}</span>
                        </div>
                        
                                                 <div className="card-body">
                           <p>{announcement.original_title || 'إعلان جديد'}</p>
                         </div>

                         {/* Expanded Content */}
                        {expandedId === announcement.id && (
                          <div className="expanded-content">
                                                         <div className="analysis-section">
                               <h5>التحليل المالي</h5>
                               <div className="analysis-content">
                                 <div className="analysis-text">
                                   {announcement.analysis_concept || 'لا يوجد تحليل متاح'}
                                 </div>
                                 <div className="analysis-footer">
                                   <span className="analysis-emoji">
                                     {announcement.analysis_emoji || '➖'}
                                   </span>
                                   <span className="analysis-status">
                                     {announcement.analysis_emoji === '✅' ? 'إيجابي' : 
                                      announcement.analysis_emoji === '❌' ? 'سلبي' : 'محايد'}
                                   </span>
                                 </div>
                               </div>
                             </div>

                            <div className="comparison-section">
                              <h5>المقارنات التاريخية</h5>
                                                             <div className="comparison-chart">
                                 {/* Comparison 1 */}
                                 <div className="chart-item">
                                                                       <div className="comparison-header">
                                      <span className="comparison-type">إعلان من نفس الشركة</span>
                                      <span className="period">{announcement.comparison_1_title || 'مقارنة 1'}</span>
                                    </div>
                                   <span className="performance">يوم: {announcement.comparison_1_day || '➖ 0.0%'}</span>
                                   <span className="performance">أسبوع: {announcement.comparison_1_week || '➖ 0.0%'}</span>
                                   <span className="performance">شهر: {announcement.comparison_1_month || '➖ 0.0%'}</span>
                                 </div>
                                 
                                 {/* Comparison 2 */}
                                 <div className="chart-item">
                                                                       <div className="comparison-header">
                                      <span className="comparison-type">إعلان من نفس القطاع</span>
                                      <span className="period">{announcement.comparison_2_title || 'مقارنة 2'}</span>
                                    </div>
                                   <span className="performance">يوم: {announcement.comparison_2_day || '➖ 0.0%'}</span>
                                   <span className="performance">أسبوع: {announcement.comparison_2_week || '➖ 0.0%'}</span>
                                   <span className="performance">شهر: {announcement.comparison_2_month || '➖ 0.0%'}</span>
                                 </div>
                                 
                                 {/* Comparison 3 */}
                                 <div className="chart-item">
                                                                       <div className="comparison-header">
                                      <span className="comparison-type">إعلان من قطاع مختلف</span>
                                      <span className="period">{announcement.comparison_3_title || 'مقارنة 3'}</span>
                                    </div>
                                   <span className="performance">يوم: {announcement.comparison_3_day || '➖ 0.0%'}</span>
                                   <span className="performance">أسبوع: {announcement.comparison_3_week || '➖ 0.0%'}</span>
                                   <span className="performance">شهر: {announcement.comparison_3_month || '➖ 0.0%'}</span>
                                 </div>
                               </div>
                                                         </div>

                             {/* Analysis Warning */}
                             <div className="analysis-warning">
                               <span className="warning-icon">⚠️</span>
                               <span className="warning-text">تحليل وليس توصية استثمارية</span>
                             </div>
                           </div>
                         )}

                        <div className="card-footer" onClick={() => toggleExpanded(announcement.id)}>
                          <span className={`expand-arrow ${expandedId === announcement.id ? 'expanded' : ''}`}>
                            {expandedId === announcement.id ? '▲' : '▼'}
                          </span>
                        </div>
                      </div>
                    </div>
                  ))
                ) : (
                  <div className="announcement-card empty">
                    <div className="card-content">
                      <p>لا توجد إعلانات متاحة حالياً</p>
                      <p style={{fontSize: '0.9rem', color: '#666', marginTop: '10px'}}>
                        تأكد من إضافة البيانات إلى جدول processed_announcements في Supabase
                      </p>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </main>
    </div>
  );
}

export default App; 