<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lộ Trình Học - E-Learning System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/EduHome.css?v=2.1">
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
                        <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
                    </svg>
                </button>
            </div>

            <div class="header-actions">
                <button class="theme-toggle" id="themeToggle" onclick="toggleTheme()">
                    <svg class="sun-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path d="M12 18C8.68 18 6 15.32 6 12s2.68-6 6-6 6 2.68 6 6-2.68 6-6 6zm0-10c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zM13 2h-2v3h2V2zm0 15h-2v3h2v-3zM5 11H2v2h3v-2zm15 0h-3v2h3v-2zM6.3 5.3L4.22 3.22 2.81 4.63l2.07 2.07 1.42-1.42zm12.37 12.37l-1.41 1.41 2.07 2.07 1.41-1.41-2.07-2.07zM19.78 4.63l-2.07 2.07 1.42 1.42 2.07-2.07-1.42-1.42zM7.71 17.71l-1.42 1.41 2.07 2.07 1.41-1.41-2.06-2.07z"/>
                    </svg>
                    <svg class="moon-icon" viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                        <path d="M9.37,5.51C9.52,6.15,10.02,6.62,10.63,6.7C11.24,6.78,11.84,6.53,12.2,6.05 C12.56,5.56,12.62,4.92,12.35,4.37C12.08,3.82,11.54,3.47,10.95,3.47 C10.36,3.47,9.82,3.82,9.55,4.37C9.28,4.92,9.34,5.56,9.7,6.05 C9.37,5.51,9.37,5.51,9.37,5.51M21,12A9,9 0 0,1 12,21A9,9 0 0,1 3,12A9,9 0 0,1 12,3A9,9 0 0,1 21,12Z"/>
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
        <a class="nav-item active" href="${pageContext.request.contextPath}/eduHome/EduHome.jsp">
            <!-- Home icon -->
            <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                <path d="M12 3.172 2.343 12H4v8a1 1 0 0 0 1 1h5v-6h4v6h5a1 1 0 0 0 1-1v-8h1.657L12 3.172z"/>
            </svg>
            <span class="nav-text">Trang chủ</span>
        </a>

        <a class="nav-item" href="${pageContext.request.contextPath}/eduHome/learningPath.jsp">
            <!-- Binoculars icon -->
            <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                <path d="M7 3a2 2 0 0 1 2 2v4H5V5a2 2 0 0 1 2-2zm10 0a2 2 0 0 1 2 2v4h-4V5a2 2 0 0 1 2-2zM3 9h6a3 3 0 0 1 3 3v7H8a3 3 0 0 1-3-3v-2H3V9zm12 0h6v6h-2v2a3 3 0 0 1-3 3h-4v-7a3 3 0 0 1 3-3z"/>
            </svg>
            <span class="nav-text">Lộ trình</span>
        </a>

        <a class="nav-item" href="${pageContext.request.contextPath}/eduHome/articles.jsp">
            <!-- Newspaper icon -->
            <svg class="nav-icon" viewBox="0 0 24 24" width="24" height="24" aria-hidden="true" fill="currentColor">
                <path d="M4 5h12a2 2 0 0 1 2 2v12H6a2 2 0 0 1-2-2V5zm16 4h2v8a2 2 0 0 1-2 2h-2V9h2zM6 7v10h10V7H6zm2 2h6v2H8V9zm0 4h6v2H8v-2z"/>
            </svg>
            <span class="nav-text">Bài viết</span>
        </a>
    </nav>
</aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Learning Path Section -->
            <section class="learning-path-section">
                <!-- Learning Path Header -->
                <div class="learning-path-intro">
                    <h1>Lộ trình học</h1>
                    <p>Để bắt đầu một cách thuận lợi, bạn nên tập trung vào một lộ trình học. Ví dụ: Để đi làm với vị trí "Lập trình viên Front-end" bạn nên tập trung vào lộ trình "Front-end".</p>
                </div>

                <!-- Learning Path Cards Grid -->
                <div class="learning-path-cards-grid">
                    <!-- Frontend Path Card -->
                    <div class="learning-path-card">
                        <div class="learning-path-card-content">
                            <h3>Lộ trình học Front-end</h3>
                            <p>Lập trình viên Front-end là người xây dựng ra giao diện websites. Trong phần này F8 sẽ chỉ cho bạn lộ trình để trở thành lập trình viên Front-end nhé.</p>
                            <button class="learning-path-btn" onclick="navigateTo('learningPathFE.jsp')">XEM CHI TIẾT</button>
                        </div>
                        <div class="learning-path-card-icon">
                            <img src="${pageContext.request.contextPath}/assets/images/learningPath1.webp" alt="Frontend Learning Path" class="path-icon-image" />
                        </div>
                    </div>

                    <!-- Backend Path Card -->
                    <div class="learning-path-card">
                        <div class="learning-path-card-content">
                            <h3>Lộ trình học Back-end</h3>
                            <p>Trái với Front-end thì lộ trình Back-end là người làm việc với dữ liệu, công việc thường nằm ở lộ trình "Back-end" bạn nên tập trung vào lộ trình "Back-end" nhé.</p>
                            <button class="learning-path-btn" onclick="navigateTo('learningPathDetail.jsp')">XEM CHI TIẾT</button>
                        </div>
                        <div class="learning-path-card-icon">
                            <img src="${pageContext.request.contextPath}/assets/images/learningPath2.jpg" alt="Backend Learning Path" class="path-icon-image" />
                        </div>
                    </div>
                </div>

                <!-- Facebook Community Section -->
                <div class="facebook-community-section">
                    <div class="facebook-content">
                        <h3>Tham gia cộng đồng học viên F8 trên Facebook</h3>
                        <p>Hàng nghìn người khác đang học lộ trình giống như bạn. Hãy tham gia hỏi đáp, chia sẻ và hỗ trợ nhau trong quá trình học nhé.</p>
                        <button class="facebook-join-btn" onclick="window.open('https://facebook.com', '_blank')">Tham gia nhóm</button>
                    </div>
                    <div class="facebook-illustration">
                        <svg viewBox="0 0 300 400" width="200" height="280" fill="none">
                            <!-- Social media mockup illustration -->
                            <rect x="20" y="30" width="260" height="340" rx="20" fill="#f5f5f5" stroke="#ddd" stroke-width="2"/>
                            <rect x="30" y="40" width="240" height="50" fill="#fff" stroke="#eee" stroke-width="1"/>
                            <circle cx="50" cy="65" r="8" fill="#ddd"/>
                            <rect x="65" y="60" width="80" height="4" fill="#ddd"/>
                            <rect x="65" y="68" width="60" height="3" fill="#eee"/>
                            
                            <rect x="30" y="100" width="240" height="80" fill="#fff" stroke="#eee" stroke-width="1" rx="8"/>
                            <circle cx="50" cy="120" r="8" fill="#ddd"/>
                            <rect x="65" y="115" width="80" height="4" fill="#ddd"/>
                            <rect x="65" y="123" width="60" height="3" fill="#eee"/>
                            <rect x="40" y="135" width="200" height="30" fill="#f0f0f0" rx="4"/>
                            <circle cx="250" cy="150" r="6" fill="#ff8c42"/>
                            
                            <rect x="30" y="190" width="240" height="80" fill="#fff" stroke="#eee" stroke-width="1" rx="8"/>
                            <circle cx="50" cy="210" r="8" fill="#ddd"/>
                            <rect x="65" y="205" width="80" height="4" fill="#ddd"/>
                            <rect x="65" y="213" width="60" height="3" fill="#eee"/>
                            <rect x="40" y="225" width="200" height="30" fill="#f0f0f0" rx="4"/>
                            <circle cx="250" cy="240" r="6" fill="#ff8c42"/>
                            
                            <rect x="30" y="280" width="240" height="80" fill="#fff" stroke="#eee" stroke-width="1" rx="8"/>
                            <circle cx="50" cy="300" r="8" fill="#ddd"/>
                            <rect x="65" y="295" width="80" height="4" fill="#ddd"/>
                            <rect x="65" y="303" width="60" height="3" fill="#eee"/>
                            <rect x="40" y="315" width="200" height="30" fill="#f0f0f0" rx="4"/>
                            <circle cx="250" cy="330" r="6" fill="#ff8c42"/>
                        </svg>
                    </div>
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
</body>
</html>
