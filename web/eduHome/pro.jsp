<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khóa Học Pro - EduPlatform</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/EduHome.css?v=2.0">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo">
                <span class="logo-icon">F8</span>
                <span class="logo-text">Học Lập Trình Để Đi Làm</span>
            </div>
            
            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm khóa học...">
                <button class="search-btn">
                    <img src="${pageContext.request.contextPath}/images/search-icon.png" alt="Search" class="icon-small">
                </button>
            </div>
            
            <div class="header-actions">
                <button class="btn-login" onclick="openAuthModal('signup')">Đăng kí</button>
                <button class="btn-signup" onclick="openAuthModal('login')">Đăng nhập</button>
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
            <section class="pro-courses-section">
                <div class="section-header">
                    <h2>Khóa Học Pro <span class="badge-pro">PRO</span></h2>
                    <p style="color: #666; margin-top: 0.5rem;">Các khóa học chất lượng cao với giá ưu đãi</p>
                </div>
                
                <div class="pro-courses-grid">
                    <div class="pro-course-card gradient-blue">
                        <div class="course-header">
                            <span class="course-icon">👑</span>
                        </div>
                        <h3>HTML, CSS Pro<span class="pro-badge">Pro</span></h3>
                        <p>Cho người mới bắt đầu</p>
                        <div class="course-pricing">
                            <span class="original-price">2.500.000đ</span>
                            <span class="discount-price">1.299.000đ</span>
                        </div>
                        <div class="course-stats">
                            <span>Sơn Đặng</span>
                            <span>590 lượt xem</span>
                            <span>116h50p</span>
                        </div>
                        <button class="form-submit" style="margin-top: 1rem; width: 100%;">Đăng ký khóa học</button>
                    </div>

                    <div class="pro-course-card gradient-yellow">
                        <div class="course-header">
                            <span class="course-icon">⭐</span>
                        </div>
                        <h3>JavaScript Pro<span class="pro-badge">Pro</span></h3>
                        <p>Cho người mới bắt đầu</p>
                        <div class="course-pricing">
                            <span class="original-price">3.299.000đ</span>
                            <span class="discount-price">1.399.000đ</span>
                        </div>
                        <div class="course-stats">
                            <span>Sơn Đặng</span>
                            <span>254 lượt xem</span>
                            <span>49h34p</span>
                        </div>
                        <button class="form-submit" style="margin-top: 1rem; width: 100%;">Đăng ký khóa học</button>
                    </div>

                    <div class="pro-course-card gradient-pink">
                        <div class="course-header">
                            <span class="course-icon">💎</span>
                        </div>
                        <h3>Ngôn ngữ Sass<span class="pro-badge">Pro</span></h3>
                        <p>Cho Frontend Developer</p>
                        <div class="course-pricing">
                            <span class="original-price">400.000đ</span>
                            <span class="discount-price">299.000đ</span>
                        </div>
                        <div class="course-stats">
                            <span>Sơn Đặng</span>
                            <span>27 lượt xem</span>
                            <span>6h18p</span>
                        </div>
                        <button class="form-submit" style="margin-top: 1rem; width: 100%;">Đăng ký khóa học</button>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <!-- Authentication Modal -->
    <div id="authModal" class="modal">
        <div class="modal-content">
            <button class="modal-close" onclick="closeAuthModal()">✕</button>
            
            <div class="modal-header">
                <div class="modal-logo">F8</div>
                <h2 id="modalTitle">Đăng nhập vào F8</h2>
                <p id="modalSubtitle">Mỗi người nên sử dụng riêng một tài khoản, tài khoản nhiều người sử dụng chung sẽ bị khóa.</p>
            </div>

            <div class="modal-body">
                <button class="auth-btn email-btn" id="emailToggleBtn" onclick="toggleAuthForm()">
                    <img src="${pageContext.request.contextPath}/images/user-icon.png" alt="User" class="btn-icon">
                    <span id="emailBtnText">Sử dụng email / số điện thoại</span>
                </button>

                <button class="auth-btn google-btn" onclick="handleGoogleLogin()">
                    <span class="btn-icon">G</span>
                    <span id="googleBtnText">Đăng nhập với Google</span>
                </button>

                <div id="authForm" class="auth-form" style="display: none;">
                    <div class="form-group" id="usernameGroup" style="display: none;">
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
                            <button type="button" class="password-toggle" onclick="togglePasswordVisibility()">
                                <img src="${pageContext.request.contextPath}/images/eye-icon.png" alt="Show" class="icon-small">
                            </button>
                        </div>
                        <span class="error-message" id="passwordError"></span>
                    </div>

                    <div class="form-group" id="confirmPasswordGroup" style="display: none;">
                        <div class="password-input-wrapper">
                            <input type="password" id="confirmPasswordInput" placeholder="Nhập lại mật khẩu" class="form-input" onchange="validateConfirmPassword()">
                            <button type="button" class="password-toggle" onclick="toggleConfirmPasswordVisibility()">
                                <img src="${pageContext.request.contextPath}/images/eye-icon.png" alt="Show" class="icon-small">
                            </button>
                        </div>
                        <span class="error-message" id="confirmPasswordError"></span>
                    </div>

                    <div class="form-group" id="rememberMeGroup" style="display: none;">
                        <label class="checkbox-label">
                            <input type="checkbox" id="rememberMe" class="checkbox-input">
                            <span>Ghi nhớ đăng nhập</span>
                        </label>
                    </div>

                    <button class="form-submit" id="submitBtn" onclick="handleFormSubmit()">
                        <span id="submitBtnText">Tiếp tục</span>
                        <span id="loadingSpinner" class="loading-spinner" style="display: none;">⏳</span>
                    </button>

                    <span class="error-message" id="generalError"></span>
                </div>

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
                <h4>F8 - Học Lập Trình Để Đi Làm</h4>
                <p>Điện thoại: 08 1919 8989</p>
                <p>Email: contact@fullstack.edu.vn</p>
                <p>Địa chỉ: Số 1, ngõ 41, Trần Duy Hưng, Cầu Giấy, Hà Nội</p>
            </div>
            <div class="footer-section">
                <h4>VỀ F8</h4>
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
            <p>&copy; 2018 - 2025 F8. Nền tảng học lập trình hàng đầu Việt Nam</p>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/assets/js/EduHome.js?v=2.0"></script>
</body>
</html>
