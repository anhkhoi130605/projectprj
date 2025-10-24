<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bài Viết - E-Learning System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/EduHome.css?v=2.1">
    <style>
      .article-title a{ text-decoration:none; color:inherit; display:inline-block; }
      .article-title a:hover{ opacity:.9; }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/assets/images/logo.jpg"
                     alt="Logo"
                     class="logo-img"
                     width="32" height="32" decoding="async" />
                <span class="logo-text">E-Learning System</span>
            </div>

            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm khóa học, bài viết, video, ..." />
                <button class="search-btn" aria-label="Search">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path
                            d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5
                               16 5.91 13.09 3 9.5 3S3 5.91 3 9.5
                               5.91 16 9.5 16c1.61 0 3.09-.59
                               4.23-1.57l.27.28v.79l5 4.99L20.49
                               19l-4.99-5zm-6 0C7.01 14 5
                               11.99 5 9.5S7.01 5 9.5 5 14
                               7.01 14 9.5 11.99 14 9.5 14z"
                        />
                    </svg>
                </button>
            </div>

            <div class="header-actions">
                <button class="theme-toggle" id="themeToggle" onclick="toggleTheme()">
                    <svg class="sun-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path
                            d="M12 18C8.68 18 6 15.32 6 12s2.68-6
                               6-6 6 2.68 6 6-2.68 6-6 6zm0-10c-2.21
                               0-4 1.79-4 4s1.79 4 4 4
                               4-1.79 4-4-1.79-4-4-4zM13
                               2h-2v3h2V2zm0 15h-2v3h2v-3zM5
                               11H2v2h3v-2zm15 0h-3v2h3v-2zM6.3
                               5.3L4.22 3.22 2.81 4.63l2.07
                               2.07 1.42-1.42zm12.37 12.37l-1.41
                               1.41 2.07 2.07 1.41-1.41-2.07-2.07zM19.78
                               4.63l-2.07 2.07 1.42 1.42
                               2.07-2.07-1.42-1.42zM7.71
                               17.71l-1.42 1.41 2.07 2.07
                               1.41-1.41-2.06-2.07z"
                        />
                    </svg>
                    <svg class="moon-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path
                            d="M9.37,5.51C9.52,6.15,10.02,6.62,10.63,6.7C11.24,6.78,11.84,6.53,12.2,6.05
                               C12.56,5.56,12.62,4.92,12.35,4.37C12.08,3.82,11.54,3.47,10.95,3.47
                               C10.36,3.47,9.82,3.82,9.55,4.37C9.28,4.92,9.34,5.56,9.7,6.05
                               C9.37,5.51,9.37,5.51,9.37,5.51M21,12A9,9 0 0,1
                               12,21A9,9 0 0,1 3,12A9,9 0 0,1
                               12,3A9,9 0 0,1 21,12Z"
                        />
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

                <a class="nav-item" href="${pageContext.request.contextPath}/eduHome/learningPath.jsp">
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M7 3a2 2 0 0 1 2 2v4H5V5a2 2 0 0 1 2-2zm10 0a2 2 0 0 1 2 2v4h-4V5a2 2 0 0 1 2-2zM3 9h6a3 3 0 0 1 3 3v7H8a3 3 0 0 1-3-3v-2H3V9zm12 0h6v6h-2v2a3 3 0 0 1-3 3h-4v-7a3 3 0 0 1 3-3z"/>
                    </svg>
                    <span class="nav-text">Lộ trình</span>
                </a>

                <a class="nav-item active" href="${pageContext.request.contextPath}/eduHome/articles.jsp">
                    <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                        <path d="M4 5h12a2 2 0 0 1 2 2v12H6a2 2 0 0 1-2-2V5zm16 4h2v8a2 2 0 0 1-2 2h-2V9h2zM6 7v10h10V7H6zm2 2h6v2H8V9zm0 4h6v2H8v-2z"/>
                    </svg>
                    <span class="nav-text">Bài viết</span>
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Articles Section -->
            <section class="articles-main-section">
                <div class="articles-header">
                    <h1>Bài viết nổi bật</h1>
                    <p>Tổng hợp các bài viết chủ đề về lập trình từ học lập trình online và các kỹ thuật lập trình web.</p>
                </div>

                <div class="articles-container">
                    <!-- Left Column: Articles List -->
                    <div class="articles-list">
                        <!-- Article Item 1 -->
                        <article class="article-item">
                            <div class="article-item-header">
                                <div class="author-info">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatar1.jpg" alt="Huyền Lê Ngọc" class="author-avatar" />
                                    <span class="author-name">Huyền Lê Ngọc</span>
                                </div>
                                <div class="article-actions">
                                    <button class="bookmark-btn" aria-label="Bookmark">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M17 3H5c-1.11 0-2 .9-2 2v16l7-3 7 3V5c0-1.1.89-2 2-2z"/>
                                        </svg>
                                    </button>
                                    <button class="menu-btn" aria-label="More options">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <h2 class="article-title">
                                <a href="${pageContext.request.contextPath}/eduHome/articlesDetail.jsp?id=1">
                                  TRẢI NGHIỆM HỌC THỬ REACT NATIVE, DEVOPS, C++ VỚI CÙNG CHẤT LƯỢNG CÙNG E-LEARNING SYSTEM
                                </a>
                            </h2>
                            <p class="article-description">Để giúp học viên mới cảm nhận ở nâng chất lượng giảng dạy, tôi đã xây dựng 3 lớp học thử C++, React Native và DevOps với lí trình rõ.</p>

                            <div class="article-tags">
                                <span class="tag">React Native</span>
                                <span class="tag">2 bảng trước</span>
                                <span class="tag">2 phút đọc</span>
                            </div>

                            <div class="article-thumbnail">
                                <img src="${pageContext.request.contextPath}/assets/images/art5.jpg" alt="React Native" />
                            </div>
                        </article>

                        <!-- Article Item 2 -->
                        <article class="article-item">
                            <div class="article-item-header">
                                <div class="author-info">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatar2.jpg" alt="Hoàng Tuấn" class="author-avatar" />
                                    <span class="author-name">Hoàng Tuấn 12A1 40 Vĩ</span>
                                </div>
                                <div class="article-actions">
                                    <button class="bookmark-btn" aria-label="Bookmark">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M17 3H5c-1.11 0-2 .9-2 2v16l7-3 7 3V5c0-1.1.89-2 2-2z"/>
                                        </svg>
                                    </button>
                                    <button class="menu-btn" aria-label="More options">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <h2 class="article-title">
                                <a href="${pageContext.request.contextPath}/eduHome/articlesDetail.jsp?id=2">
                                  Giới thiệu về ngành Công Nghệ Thông Tin và Những Kiến Thức Cơ Bản Bắt Buộc Phải Học
                                </a>
                            </h2>
                            <p class="article-description">Ngành Công Nghệ Thông Tin (CNTT) là một lĩnh vực vực dạng phát triển mạnh mẽ và có vai trò quan trọng trong thời đại số...</p>

                            <div class="article-tags">
                                <span class="tag">học lập trình</span>
                                <span class="tag">3 bảng trước</span>
                                <span class="tag">3 phút đọc</span>
                            </div>

                            <div class="article-thumbnail">
                                <img src="${pageContext.request.contextPath}/assets/images/art6.webp" alt="IT Knowledge" />
                            </div>
                        </article>

                        <!-- Article Item 3 -->
                        <article class="article-item">
                            <div class="article-item-header">
                                <div class="author-info">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatar2.jpg" alt="Hoàng Tuấn" class="author-avatar" />
                                    <span class="author-name">Hoàng Tuấn 12A1 40 Vĩ</span>
                                </div>
                                <div class="article-actions">
                                    <button class="bookmark-btn" aria-label="Bookmark">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M17 3H5c-1.11 0-2 .9-2 2v16l7-3 7 3V5c0-1.1.89-2 2-2z"/>
                                        </svg>
                                    </button>
                                    <button class="menu-btn" aria-label="More options">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <h2 class="article-title">
                                <a href="${pageContext.request.contextPath}/eduHome/articlesDetail.jsp?id=3">
                                  SOLID - 5 nguyên lý "vàng" giúp viết code sạch và dễ bảo trì
                                </a>
                            </h2>
                            <p class="article-description">Trong hành trình phát triển phần mềm, chắc hẳn bạn đã từng gặp phải những đoạn code dài, khó hiểu và rất khó để rồi hay chữa...</p>

                            <div class="article-tags">
                                <span class="tag">OOP</span>
                                <span class="tag">3 bảng trước</span>
                                <span class="tag">3 phút đọc</span>
                            </div>

                            <div class="article-thumbnail">
                                <img src="${pageContext.request.contextPath}/assets/images/art7.webp" alt="SOLID Principles" />
                            </div>
                        </article>

                        <!-- Article Item 4 -->
                        <article class="article-item">
                            <div class="article-item-header">
                                <div class="author-info">
                                    <img src="${pageContext.request.contextPath}/assets/images/avatar3.jpg" alt="Hải Đoàn" class="author-avatar" />
                                    <span class="author-name">Hải Đoàn</span>
                                </div>
                                <div class="article-actions">
                                    <button class="bookmark-btn" aria-label="Bookmark">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M17 3H5c-1.11 0-2 .9-2 2v16l7-3 7 3V5c0-1.1.89-2 2-2z"/>
                                        </svg>
                                    </button>
                                    <button class="menu-btn" aria-label="More options">
                                        <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                            <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <h2 class="article-title">
                                <a href="${pageContext.request.contextPath}/eduHome/articlesDetail.jsp?id=4">
                                  [HTML - CSS - JS tại E-Learning System] Một thời mây mở học, lực lại được trang web cũ - chia sẻ cùng anh em
                                </a>
                            </h2>
                            <p class="article-description">[HTML - CSS - JS tại E-Learning System ] Một thời mây mở học, lực lại được trang web cũ - chia sẻ cùng anh em</p>

                            <div class="article-tags">
                                <span class="tag">HTML - CSS - JS tại F8</span>
                                <span class="tag">5 bảng trước</span>
                                <span class="tag">2 phút đọc</span>
                            </div>

                            <div class="article-thumbnail">
                                <img src="${pageContext.request.contextPath}/assets/images/art8.jpg" alt="HTML CSS JS" />
                            </div>
                        </article>

                        
                    </div>

                    <!-- Right Column: Sidebar -->
                    <aside class="articles-sidebar">
                        <!-- Topic Filter Section -->
                        <div class="sidebar-section">
                            <h3 class="sidebar-title">XEM CÁC BÀI VIẾT THEO CHỦ ĐỀ</h3>
                            
                            <div class="topic-tabs">
                                <button class="topic-tab active" onclick="filterByTopic(this)">Front-end / Mobile apps</button>
                                <button class="topic-tab" onclick="filterByTopic(this)">Back-end / Devops</button>
                                <button class="topic-tab" onclick="filterByTopic(this)">UI / UX / Design</button>
                                <button class="topic-tab" onclick="filterByTopic(this)">Others</button>
                            </div>
                        </div>

                        <!-- Featured Courses Section -->
                        <div class="sidebar-section">
                            <div class="featured-course-card">
                                <div class="course-card-image">
                                    <img src="${pageContext.request.contextPath}/assets/images/pro4.png" alt="HTML CSS Pro" />
                                </div>
                                <div class="course-card-content">
                                    <h4>Khóa học</h4>
                                    <h3>HTML CSS PRO</h3>
                                    <ul class="course-features">
                                        <li>
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                                <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"/>
                                            </svg>
                                            <span>Thực hành 8 dự án</span>
                                        </li>
                                        <li>
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                                <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"/>
                                            </svg>
                                            <span>Hơn 300 bài tập thực hành</span>
                                        </li>
                                        <li>
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                                <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"/>
                                            </svg>
                                            <span>Tăng ứng dụng Flashcards</span>
                                        </li>
                                        <li>
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                                <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"/>
                                            </svg>
                                            <span>Tăng 20+ thiết kế trên Figma</span>
                                        </li>
                                    </ul>
                                    <button class="course-btn">Tìm hiểu thêm ></button>
                                </div>
                            </div>

                            

                            <div class="featured-course-card">
                                <div class="course-card-image">
                                    <img src="${pageContext.request.contextPath}/assets/images/pro7.jpg" alt="Advanced Course" />
                                </div>
                                <div class="course-card-content">
                                    <h4>Khóa học</h4>
                                    <h3>Khóa học nâng cao</h3>
                                    <p>Nội dung khóa học nâng cao cho các lập trình viên muốn phát triển kỹ năng.</p>
                                    <button class="course-btn">Tìm hiểu thêm ></button>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </section>
        </main>
    </div>

    <!-- Authentication Modal -->
    <div id="authModal" class="modal" role="dialog" aria-modal="true" aria-labelledby="modalTitle" aria-describedby="modalSubtitle">
        <div class="modal-content">
            <button class="modal-close" onclick="closeAuthModal()" aria-label="Đóng">✕</button>
            
            <div class="modal-header">
                <div class="modal-logo-container">
                    <img src="${pageContext.request.contextPath}/assets/images/logo.jpg"
                         alt="Logo"
                         class="modal-logo-img"
                         width="64" height="64" decoding="async" />
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
        <div class="footer-bottom">
            <p>&copy; 2018 - 2025 E-Learning System . Nền tảng học lập trình hàng đầu Việt Nam</p>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/assets/js/EduHome.js?v=2.1"></script>
    <script src="${pageContext.request.contextPath}/assets/js/articles.js?v=1.0"></script>
</body>
</html>
