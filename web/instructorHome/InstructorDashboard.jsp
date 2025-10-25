<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tech Instructor Dashboard - Quản lý Khóa học Công nghệ</title>
        
        <%-- CSS và Font Awesome (Dùng EL) --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/instructorsHome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        
        <%-- THƯ VIỆN CHART.JS CHO BIỂU ĐỒ --%>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
    </head>
<body>
    <div class="main-container">
        <header class="navbar">
    <!-- Phần 1: Logo (trái) -->
    <div class="logo">
      <img src="${pageContext.request.contextPath}/assets/images/logo.jpg"
     alt="Logo"
     class="logo-img"
     width="32" height="32" decoding="async" />
      <span class="logo-text">E-Learning System</span>
    </div>

    <!-- Phần 2: Thanh tìm kiếm (giữa) -->
    <div class="navbar-center">
        <div class="search-bar">
            <input type="text" placeholder="Tìm kiếm khóa học, bài viết, video...">
            <button><i class="fas fa-search"></i></button>
        </div>
    </div>

    <!-- Phần 3: Hồ sơ người dùng (phải) -->
    <div class="navbar-right">
        <div class="user-profile-wrapper">
            <div class="user-profile-wrapper">
    <div class="user-profile" id="userProfileToggle" 
         style="color: white; display: flex; align-items: center; gap: 8px;">
        <span class="username" style="color: white;">Nguyễn Văn A</span>
        <i class="fas fa-user-circle user-avatar" style="color: white; font-size: 24px;"></i>
    </div>
</div>


            <!-- Menu Dropdown -->
            <div class="dropdown-menu" id="profileDropdown">
                <div class="dropdown-header">
                    <div class="avatar-container large">
                        <i class="fas fa-user avatar-icon"></i>
                    </div>
                    <div>
                        <h4>Nguyễn Văn A</h4>
                        <p>nguyenvana@example.com</p>
                        <span class="user-role">Giảng viên</span>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/instructorHome/Setting.jsp" class="dropdown-item">
                    <i class="fas fa-user"></i> Hồ sơ cá nhân & Cài đặt
                </a>
                
                <a href="${pageContext.request.contextPath}/instructorHome/Help.jsp" class="dropdown-item">
                    <i class="fas fa-question-circle"></i> Trợ giúp
                </a>
                <div class="dropdown-divider"></div>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="dropdown-item logout">
                    <i class="fas fa-sign-out-alt"></i> Đăng xuất
                </a>
            </div>
        </div>
    </div>
</header>



        <%-- THANH SIDEBAR --%>
        <nav class="sidebar">
            <a href="${pageContext.request.contextPath}/instructorHome/InstructorDashboard.jsp" class="nav-item active">
                <i class="fas fa-home"></i> Trang chủ
            </a>
            <a href="${pageContext.request.contextPath}/instructorHome/CourseManagement.jsp" class="nav-item">
                <i class="fas fa-laptop-code"></i> Khóa học
            </a>
            <a href="${pageContext.request.contextPath}/instructorHome/FinanceReport.jsp" class="nav-item">
                <i class="fas fa-chart-line"></i> Báo cáo
            </a>
            <a href="${pageContext.request.contextPath}/instructorHome/ArticleManage.jsp" class="nav-item">
                <i class="fas fa-blog"></i> Bài viết
            </a>
            <a href="${pageContext.request.contextPath}/instructorHome/CourseContentManager.jsp" class="nav-item">
                <i class="fas fa-video"></i> Nội dung
            </a>
            <a href="${pageContext.request.contextPath}/instructorHome/AssignmentDetails.jsp" class="nav-item">
                <i class="fas fa-tasks"></i> Bài tập
            </a>
        </nav>

        <main class="content-area">
            <section class="section">
                <h2><i class="fas fa-tachometer-alt"></i> Bảng điều khiển</h2>
                <div class="welcome-content">
                    <p>Chào mừng bạn đến với hệ thống quản lý khóa học. Dưới đây là tổng quan về hoạt động giảng dạy của bạn.</p>
                </div>
            </section>

            <section class="section">
                <h2><i class="fas fa-chart-bar"></i> Thống kê Tổng quan</h2>
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3><i class="fas fa-graduation-cap"></i> Tổng số Khóa học</h3>
                        <div class="stat-number">12</div>
                        <div class="stat-description">Khóa học đã tạo (Draft: 3, Published: 9)</div>
                    </div>
                    <div class="stat-card">
                        <h3><i class="fas fa-users"></i> Tổng số Học viên</h3>
                        <div class="stat-number">1,247</div>
                        <div class="stat-description">Học viên đang theo dõi các khóa học</div>
                    </div>
                    <div class="stat-card">
                        <h3><i class="fas fa-dollar-sign"></i> Tổng Thu nhập</h3>
                        <div class="stat-number">$15,420</div>
                        <div class="stat-description">Thu nhập từ các khóa học</div>
                    </div>
                    <div class="stat-card">
                        <h3><i class="fas fa-star"></i> Đánh giá Mới</h3>
                        <div class="stat-number">23</div>
                        <div class="stat-description">Đánh giá mới trong tuần này</div>
                    </div>
                </div>
            </section>

            <%-- KHU VỰC BIỂU ĐỒ BÁO CÁO (Đã Thêm Canvas) --%>
            <section class="section">
                <h2><i class="fas fa-chart-line"></i> Biểu đồ Báo cáo</h2>
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3><i class="fas fa-chart-area"></i> Doanh thu theo tháng</h3>
                        <div class="chart-placeholder" style="height: 250px;">
                            <p style="margin-bottom: 15px; color: var(--text-muted);">Biểu đồ doanh thu 6 tháng gần nhất</p>
                            <canvas id="revenueChart" style="max-height: 200px;"></canvas>
                        </div>
                    </div>
                    <div class="stat-card">
                        <h3><i class="fas fa-user-plus"></i> Đăng ký Khóa học</h3>
                        <div class="chart-placeholder" style="height: 250px;">
                            <p style="margin-bottom: 15px; color: var(--text-muted);">Biểu đồ đăng ký theo thời gian</p>
                            <canvas id="enrollmentChart" style="max-height: 200px;"></canvas>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section">
                <h2><i class="fas fa-clock"></i> Hoạt động Gần đây</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Đánh giá mới: "Khóa học React rất hay!"</h4>
                            <p>2 giờ trước • Khóa học React.js • Điểm: 5/5</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Bài nộp mới: Assignment JavaScript</h4>
                            <p>4 giờ trước • Học viên: Nguyễn Văn A</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <div class="activity-content">
                            <h4>15 học viên mới đăng ký khóa học Python</h4>
                            <p>6 giờ trước • Khóa học Python cơ bản</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Đánh giá mới: "Nội dung rất chi tiết"</h4>
                            <p>8 giờ trước • Khóa học HTML/CSS • Điểm: 4/5</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Bài nộp mới: Assignment HTML</h4>
                            <p>10 giờ trước • Học viên: Trần Thị B</p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section">
                <h2><i class="fas fa-bell"></i> Thông báo & Cảnh báo</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: #ffc107;">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Khóa học "Node.js Advanced" cần được phê duyệt</h4>
                            <p>Đang chờ admin phê duyệt để xuất bản</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: #28a745;">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Giao dịch mới: +$250 từ khóa học React</h4>
                            <p>5 học viên mới đăng ký khóa học React.js</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: #17a2b8;">
                            <i class="fas fa-info-circle"></i>
                        </div>
                        <div class="activity-content">
                            <h4>Nhắc nhở: Cập nhật nội dung khóa học JavaScript</h4>
                            <p>Khóa học đã được tạo 30 ngày, cần cập nhật nội dung</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <%-- SCRIPT JS (Dùng EL) --%>
    <script src="${pageContext.request.contextPath}/assets/js/instructorsHome.js"></script>
</body>
</html>