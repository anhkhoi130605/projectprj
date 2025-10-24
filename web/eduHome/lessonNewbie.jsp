<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String id = request.getParameter("id");
    if (id == null || id.isEmpty()) {
        id = "1";
    }
    
    String courseTitle = "";
    String courseDescription = "";
    String courseLevel = "";
    String courseStudents = "";
    String courseDuration = "";
    String courseImage = "";
    String chapter1Title = "";
    String chapter1Lessons = "";
    
    switch (id) {
        case "1":
            courseTitle = "Kiến Thức Nền Tảng";
            courseDescription = "Để có cái nhìn tổng quan về ngành IT - Lập trình với các bạn xem các videos tại khóa này trước nhé.";
            courseLevel = "Cơ bản";
            courseStudents = "137.212";
            courseDuration = "3h12p";
            courseImage = "free-course-1.jpg";
            chapter1Title = "1. Khái niệm kỹ thuật cần biết";
            chapter1Lessons = "<div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>1. Mô hình Client - Server là gì?</span><span class='lesson-duration'>11:35</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>2. Domain là gì? Tên miền là gì?</span><span class='lesson-duration'>10:34</span></div><div class='lesson-item-row'><span class='lesson-icon'>📄</span><span class='lesson-title'>3. Mua áo F8 | Đăng ký học Offline</span><span class='lesson-duration'>01:00</span></div>";
            break;
        case "2":
            courseTitle = "Lập trình C++ cơ bản, nâng cao";
            courseDescription = "Khóa học lập trình C++ từ cơ bản đến nâng cao, giúp bạn nắm vững các khái niệm và kỹ thuật lập trình.";
            courseLevel = "Cơ bản - Nâng cao";
            courseStudents = "37.626";
            courseDuration = "10h18p";
            courseImage = "free-course-2.jpg";
            chapter1Title = "1. Giới thiệu C++";
            chapter1Lessons = "<div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>1. C++ là gì?</span><span class='lesson-duration'>08:15</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>2. Cài đặt môi trường C++</span><span class='lesson-duration'>12:45</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>3. Chương trình C++ đầu tiên</span><span class='lesson-duration'>05:30</span></div>";
            break;
        case "3":
            courseTitle = "HTML, CSS từ Zero đến Hero";
            courseDescription = "Học HTML và CSS từ đầu, xây dựng nền tảng vững chắc cho lập trình web.";
            courseLevel = "Cơ bản";
            courseStudents = "215.726";
            courseDuration = "29h5p";
            courseImage = "free-course-3.jpg";
            chapter1Title = "1. Giới thiệu HTML";
            chapter1Lessons = "<div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>1. HTML là gì?</span><span class='lesson-duration'>06:20</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>2. Cấu trúc HTML cơ bản</span><span class='lesson-duration'>09:15</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>3. Các thẻ HTML thường dùng</span><span class='lesson-duration'>14:30</span></div>";
            break;
        case "4":
            courseTitle = "Responsive Với Grid System";
            courseDescription = "Tìm hiểu về responsive design và grid system để tạo giao diện web linh hoạt.";
            courseLevel = "Trung bình";
            courseStudents = "48.017";
            courseDuration = "6h31p";
            courseImage = "free-course-4.jpg";
            chapter1Title = "1. Responsive Design Cơ Bản";
            chapter1Lessons = "<div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>1. Responsive Design là gì?</span><span class='lesson-duration'>07:45</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>2. Mobile First Approach</span><span class='lesson-duration'>08:20</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>3. Media Queries</span><span class='lesson-duration'>10:15</span></div>";
            break;
        case "5":
            courseTitle = "Lập Trình JavaScript Cơ Bản";
            courseDescription = "Học JavaScript cơ bản, làm cho trang web của bạn tương tác và động.";
            courseLevel = "Cơ bản";
            courseStudents = "151.921";
            courseDuration = "24h15p";
            courseImage = "free-course-5.jpg";
            chapter1Title = "1. Giới thiệu JavaScript";
            chapter1Lessons = "<div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>1. JavaScript là gì?</span><span class='lesson-duration'>05:30</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>2. Biến và kiểu dữ liệu</span><span class='lesson-duration'>12:45</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>3. Toán tử và biểu thức</span><span class='lesson-duration'>09:20</span></div>";
            break;
        case "6":
            courseTitle = "Lập Trình JavaScript Nâng Cao";
            courseDescription = "Nâng cao kỹ năng JavaScript với các khái niệm nâng cao và best practices.";
            courseLevel = "Nâng cao";
            courseStudents = "41.746";
            courseDuration = "8h41p";
            courseImage = "free-course-6.jpg";
            chapter1Title = "1. Hàm và Scope";
            chapter1Lessons = "<div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>1. Hàm trong JavaScript</span><span class='lesson-duration'>08:15</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>2. Scope và Closure</span><span class='lesson-duration'>11:30</span></div><div class='lesson-item-row'><span class='lesson-icon'>●</span><span class='lesson-title'>3. Arrow Functions</span><span class='lesson-duration'>06:45</span></div>";
            break;
        default:
            courseTitle = "Khóa học không tồn tại";
            courseDescription = "Không tìm thấy khóa học này.";
            courseLevel = "N/A";
            courseStudents = "0";
            courseDuration = "0h";
            courseImage = "free-course-1.jpg";
            chapter1Title = "Không có dữ liệu";
            chapter1Lessons = "<p>Khóa học không tồn tại hoặc đã bị xóa.</p>";
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= courseTitle %> - E-Learning System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/EduHome.css?v=2.1">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/assets/images/logo.jpg" alt="Logo" class="logo-img" width="32" height="32" decoding="async" />
                <span class="logo-text">E-Learning System</span>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm khóa học, bài viết, video, ..." />
                <button class="search-btn" aria-label="Search">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
                    </svg>
                </button>
            </div>
            <div class="header-actions">
                <button class="theme-toggle" id="themeToggle" onclick="toggleTheme()">
                    <svg class="sun-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path d="M12 18C8.68 18 6 15.32 6 12s2.68-6 6-6 6 2.68 6 6-2.68 6-6 6zm0-10c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zM13 2h-2v3h2V2zm0 15h-2v3h2v-3zM5 11H2v2h3v-2zm15 0h-3v2h3v-2zM6.3 5.3L4.22 3.22 2.81 4.63l2.07 2.07 1.42-1.42zm12.37 12.37l-1.41 1.41 2.07 2.07 1.41-1.41-2.07-2.07zM19.78 4.63l-2.07 2.07 1.42 1.42 2.07-2.07-1.42-1.42zM7.71 17.71l-1.42 1.41 2.07 2.07 1.41-1.41-2.06-2.07z" />
                    </svg>
                    <svg class="moon-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path d="M9.37,5.51C9.52,6.15,10.02,6.62,10.63,6.7C11.24,6.78,11.84,6.53,12.2,6.05 C12.56,5.56,12.62,4.92,12.35,4.37C12.08,3.82,11.54,3.47,10.95,3.47 C10.36,3.47,9.82,3.82,9.55,4.37C9.28,4.92,9.34,5.56,9.7,6.05 C9.37,5.51,9.37,5.51,9.37,5.51M21,12A9,9 0 0,1 12,21A9,9 0 0,1 3,12A9,9 0 0,1 12,3A9,9 0 0,1 21,12Z" />
                    </svg>
                </button>
                <button class="btn-login" onclick="openAuthModal('login')">Đăng nhập</button>
                <button class="btn-signup" onclick="openAuthModal('signup')">Đăng ký</button>
            </div>
        </div>
    </header>

    <div class="main-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="sidebar-nav">
                <a class="nav-item" href="${pageContext.request.contextPath}/eduHome/EduHome.jsp">
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M12 3.172 2.343 12H4v8a1 1 0 0 0 1 1h5v-6h4v6h5a1 1 0 0 0 1-1v-8h1.657L12 3.172z"/>
                    </svg>
                    <span class="nav-text">Trang chủ</span>
                </a>
                <a class="nav-item active" href="${pageContext.request.contextPath}/eduHome/learningPath.jsp">
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M7 3a2 2 0 0 1 2 2v4H5V5a2 2 0 0 1 2-2zm10 0a2 2 0 0 1 2 2v4h-4V5a2 2 0 0 1 2-2zM3 9h6a3 3 0 0 1 3 3v7H8a3 3 0 0 1-3-3v-2H3V9zm12 0h6v6h-2v2a3 3 0 0 1-3 3h-4v-7a3 3 0 0 1 3-3z"/>
                    </svg>
                    <span class="nav-text">Lộ trình</span>
                </a>
                <a class="nav-item" href="${pageContext.request.contextPath}/eduHome/articles.jsp">
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M4 5h12a2 2 0 0 1 2 2v12H6a2 2 0 0 1-2-2V5zm16 4h2v8a2 2 0 0 1-2 2h-2V9h2zM6 7v10h10V7H6zm2 2h6v2H8V9zm0 4h6v2H8v-2z"/>
                    </svg>
                    <span class="nav-text">Bài viết</span>
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <div class="lesson-wrapper">
                <!-- Left: Main Content -->
                <div class="lesson-detail">
                    <!-- Course Header -->
                    <div class="lesson-header">
                        <h1><%= courseTitle %></h1>
                        <p class="lesson-description"><%= courseDescription %></p>
                    </div>

                    <!-- What You Will Learn Section -->
                    <section class="lesson-section">
                        <h2 class="section-title">Bạn sẽ học được gì?</h2>
                        <div class="learn-grid">
                            <div class="learn-item">
                                <span class="learn-icon">✓</span>
                                <p>Các kiến thức cơ bản, nền móng của ngành IT</p>
                            </div>
                            <div class="learn-item">
                                <span class="learn-icon">✓</span>
                                <p>Các khái niệm, thuật ngữ cơ bản khi triển khai ứng dụng</p>
                            </div>
                            <div class="learn-item">
                                <span class="learn-icon">✓</span>
                                <p>Các mô hình, kiến trúc cơ bản khi triển khai ứng dụng</p>
                            </div>
                            <div class="learn-item">
                                <span class="learn-icon">✓</span>
                                <p>Hiểu hơn về cách internet và máy vi tính hoạt động</p>
                            </div>
                        </div>
                    </section>

                    <!-- Course Content Section -->
                    <section class="lesson-section">
                        <div class="content-header">
                            <h2 class="section-title">Nội dung khóa học</h2>
                            <a href="#" class="expand-all">Mở rộng tất cả</a>
                        </div>
                        <p class="content-summary">4 chương • 12 bài học • Thời lượng <%= courseDuration %></p>

                        <!-- Chapter 1 (Expanded) -->
                        <div class="chapter">
                            <div class="chapter-header" onclick="toggleChapter(this)">
                                <span class="chapter-icon">−</span>
                                <h3 class="chapter-title"><%= chapter1Title %></h3>
                                <span class="chapter-count">3 bài học</span>
                            </div>
                            <div class="chapter-content" style="display: block;">
                                <div class="lesson-item-list">
                                    <%= chapter1Lessons %>
                                </div>
                            </div>
                        </div>

                        <!-- Chapter 2 (Collapsed) -->
                        <div class="chapter">
                            <div class="chapter-header" onclick="toggleChapter(this)">
                                <span class="chapter-icon">+</span>
                                <h3 class="chapter-title">2. Chương tiếp theo</h3>
                                <span class="chapter-count">3 bài học</span>
                            </div>
                            <div class="chapter-content" style="display: none;"></div>
                        </div>

                        <!-- Chapter 3 (Collapsed) -->
                        <div class="chapter">
                            <div class="chapter-header" onclick="toggleChapter(this)">
                                <span class="chapter-icon">+</span>
                                <h3 class="chapter-title">3. Chương tiếp theo</h3>
                                <span class="chapter-count">4 bài học</span>
                            </div>
                            <div class="chapter-content" style="display: none;"></div>
                        </div>

                        <!-- Chapter 4 (Collapsed) -->
                        <div class="chapter">
                            <div class="chapter-header" onclick="toggleChapter(this)">
                                <span class="chapter-icon">+</span>
                                <h3 class="chapter-title">4. Hoàn thành khóa học</h3>
                                <span class="chapter-count">2 bài học</span>
                            </div>
                            <div class="chapter-content" style="display: none;"></div>
                        </div>
                    </section>
                </div>

                <!-- Right: Course Info Sidebar -->
                <aside class="lesson-sidebar">
                    <!-- Video Preview Card -->
                    <div class="video-preview-card">
                        <div class="video-preview-content">
                            <div class="video-play-button">
                                <svg viewBox="0 0 24 24" width="48" height="48" fill="white">
                                    <path d="M8 5v14l11-7z"/>
                                </svg>
                            </div>
                            <div class="video-preview-text">
                                <h4><%= courseTitle %></h4>
                                <p><%= courseLevel %></p>
                            </div>
                        </div>
                        <p class="video-preview-label">
                            <a href="#" onclick="event.preventDefault(); alert('Giới thiệu khóa học <%= courseTitle %>');">Xem giới thiệu khóa học</a>
                        </p>
                    </div>

                    <!-- Course Info Card -->
                    <div class="course-info-card">
                        <div class="course-price">
                            <span class="price-label">Miễn phí</span>
                        </div>
                        <button class="btn-enroll" onclick="openAuthModal('signup')">ĐĂNG KÝ HỌC</button>

                        <div class="course-info-list">
                            <div class="info-item">
                                <svg class="info-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 6.5c2.33 0 4.31-1.46 5.11-3.5H6.89c.8 2.04 2.78 3.5 5.11 3.5z"/>
                                </svg>
                                <span>Trình độ <%= courseLevel %></span>
                            </div>
                            <div class="info-item">
                                <svg class="info-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                    <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V5h14v14zm-5.04-6.71l-2.75 3.54-1.3-1.54c-.3-.36-.77-.36-1.07 0-.3.36-.3.95 0 1.31l1.83 2.17c.3.36.77.36 1.07 0l3.29-4.04c.3-.36.3-.95 0-1.31-.3-.36-.77-.36-1.07 0z"/>
                                </svg>
                                <span>Tổng số 12 bài học</span>
                            </div>
                            <div class="info-item">
                                <svg class="info-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                    <path d="M11.99 5V1h-1v4H7.58c-.46-1.29-1.67-2.2-3.08-2.2-1.88 0-3.4 1.52-3.4 3.4s1.52 3.4 3.4 3.4c1.41 0 2.62-.91 3.08-2.2h3.41v7h-3.41c-.46-1.29-1.67-2.2-3.08-2.2-1.88 0-3.4 1.52-3.4 3.4s1.52 3.4 3.4 3.4c1.41 0 2.62-.91 3.08-2.2h3.41v4h1v-4h3.41c.46 1.29 1.67 2.2 3.08 2.2 1.88 0 3.4-1.52 3.4-3.4s-1.52-3.4-3.4-3.4c-1.41 0-2.62.91-3.08 2.2h-3.41V9h3.41c.46 1.29 1.67 2.2 3.08 2.2 1.88 0 3.4-1.52 3.4-3.4s-1.52-3.4-3.4-3.4c-1.41 0-2.62.91-3.08 2.2h-3.41V5z"/>
                                </svg>
                                <span>Thời lượng <%= courseDuration %></span>
                            </div>
                            <div class="info-item">
                                <svg class="info-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                    <path d="M17 10.5V7c0-.55-.45-1-1-1H4c-.55 0-1 .45-1 1v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1v-3.5l4 4v-11l-4 4z"/>
                                </svg>
                                <span>Học mọi lúc, mọi nơi</span>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </main>
    </div>

    <!-- Authentication Modal -->
    <div id="authModal" class="modal" role="dialog" aria-modal="true" aria-labelledby="modalTitle" aria-describedby="modalSubtitle">
        <div class="modal-content">
            <button class="modal-close" onclick="closeAuthModal()" aria-label="Đóng">✕</button>
            <div class="modal-header">
                <div class="modal-logo-container">
                    <img src="${pageContext.request.contextPath}/assets/images/logo.jpg" alt="Logo" class="modal-logo-img" width="64" height="64" decoding="async" />
                </div>
                <h2 id="modalTitle">Đăng nhập vào E-Learning System</h2>
                <p id="modalSubtitle">Mỗi người nên sử dụng riêng một tài khoản, tài khoản nhiều người sử dụng chung sẽ bị khóa.</p>
            </div>
            <div class="modal-body">
                <button class="auth-btn email-btn" id="emailToggleBtn" onclick="toggleAuthForm()">
                    <span id="emailBtnText">Sử dụng email / số điện thoại</span>
                </button>
                <button class="auth-btn google-btn" onclick="handleGoogleLogin()">
                    <span class="btn-icon">G</span>
                    <span id="googleBtnText">Đăng nhập với Google</span>
                </button>
                <form id="authForm" class="auth-form" onsubmit="event.preventDefault(); handleFormSubmit();">
                    <div class="form-group">
                        <input type="text" id="usernameInput" placeholder="Tên tài khoản" class="form-input" onchange="validateUsername()">
                        <span class="error-message" id="usernameError"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" id="emailInput" placeholder="Email hoặc số điện thoại" class="form-input" onchange="validateEmail()">
                        <span class="error-message" id="emailError"></span>
                    </div>
                    <div class="form-group">
                        <div class="password-input-wrapper">
                            <input type="password" id="passwordInput" placeholder="Mật khẩu" class="form-input" onchange="validatePassword()">
                            <button type="button" class="password-toggle" onclick="togglePasswordVisibility()">👁</button>
                        </div>
                        <span class="error-message" id="passwordError"></span>
                    </div>
                    <div class="form-group" id="confirmPasswordGroup" style="display: none;">
                        <div class="password-input-wrapper">
                            <input type="password" id="confirmPasswordInput" placeholder="Xác nhận lại mật khẩu" class="form-input" onchange="validateConfirmPassword()">
                            <button type="button" class="password-toggle" onclick="toggleConfirmPasswordVisibility()">👁</button>
                        </div>
                        <span class="error-message" id="confirmPasswordError"></span>
                    </div>
                    <div class="form-group" id="rememberMeGroup" style="display: none;">
                        <label class="checkbox-label">
                            <input type="checkbox" id="rememberMe" class="checkbox-input">
                            <span>Ghi nhớ đăng nhập</span>
                        </label>
                    </div>
                    <button class="form-submit" id="submitBtn" type="submit">
                        <span id="submitBtnText">Tiếp tục</span>
                        <span id="loadingSpinner" class="loading-spinner" style="display: none;">⏳</span>
                    </button>
                    <span class="error-message" id="generalError"></span>
                </form>
                <div class="auth-footer">
                    <p id="toggleText">Bạn chưa có tài khoản? <a href="#" onclick="toggleAuthMode(event)">Đăng kí</a></p>
                    <p id="forgotText" style="display: none;"><a href="#" onclick="handleForgotPassword(event)">Quên mật khẩu?</a></p>
                </div>
                <p class="auth-disclaimer">Việc bạn tiếp tục sử dụng trang web này đồng nghĩa bạn đồng ý với <a href="#">điều khoản sử dụng</a> của chúng tôi.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-section">
                <h4>E-Learning System - Học Lập Trình Để Đi Làm</h4>
                <p>Điện thoại: 08 1919 8989</p>
                <p>Email: contact@fullstack.edu.vn</p>
                <p>Địa chỉ: Số 1, ngõ 41, Trần Duy Hưng, Cầu Giấy, Hà Nội</p>
            </div>
            <div class="footer-section">
                <h4>VỀ E-Learning System</h4>
                <ul>
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="#">Liên hệ</a></li>
                    <li><a href="#">Điều khoản</a></li>
                    <li><a href="#">Bảo mật</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>SẢN PHẨM</h4>
                <ul>
                    <li><a href="#">Game Nester</a></li>
                    <li><a href="#">Game CSS Diner</a></li>
                    <li><a href="#">Game CSS Selectors</a></li>
                    <li><a href="#">Game Froggy</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>CÔNG CỤ</h4>
                <ul>
                    <li><a href="#">Tạo CV xin việc</a></li>
                    <li><a href="#">Rút gọn liên kết</a></li>
                    <li><a href="#">Clip-path maker</a></li>
                    <li><a href="#">Snippet generator</a></li>
                </ul>
            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/assets/js/EduHome.js?v=2.1"></script>
    <script src="${pageContext.request.contextPath}/assets/js/lessonNewbie.js?v=1.0"></script>
</body>
</html>
