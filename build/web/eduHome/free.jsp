<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khóa Học Miễn Phí - EduPlatform</title>
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
            <section class="free-courses-section">
                <div class="section-header">
                    <h2>Khóa Học Miễn Phí</h2>
                    <p style="color: #666; margin-top: 0.5rem;">Khám phá các khóa học miễn phí chất lượng cao từ F8</p>
                </div>
                
                <div class="free-courses-grid">
                    <div class="free-course-card gradient-red-purple" onclick="alert('Khóa học này sẽ sớm được mở')">
                        <h3>Kiến Thức Nền Tảng</h3>
                        <p>Kiến thức nhập môn()</p>
                        <div class="course-footer">
                            <span class="course-type">Miễn phí</span>
                            <div class="course-info-small">
                                <span>137.209 học viên</span>
                                <span>9 lượt xem</span>
                                <span>3h12p</span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card gradient-cyan" onclick="alert('Khóa học này sẽ sớm được mở')">
                        <h3>Lập trình C++ cơ bản, nâng cao</h3>
                        <p>Từ cơ bản đến nâng cao</p>
                        <div class="course-footer">
                            <span class="course-type">Miễn phí</span>
                            <div class="course-info-small">
                                <span>37.619 học viên</span>
                                <span>55 lượt xem</span>
                                <span>10h18p</span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card gradient-blue-purple" onclick="alert('Khóa học này sẽ sớm được mở')">
                        <h3>HTML, CSS từ Zero đến Hero</h3>
                        <p>Từ zero đến hero</p>
                        <div class="course-footer">
                            <span class="course-type">Miễn phí</span>
                            <div class="course-info-small">
                                <span>215.719 học viên</span>
                                <span>117 lượt xem</span>
                                <span>29h5p</span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card gradient-magenta" onclick="alert('Khóa học này sẽ sớm được mở')">
                        <h3>Responsive Với Grid System</h3>
                        <p>@web design</p>
                        <div class="course-footer">
                            <span class="course-type">Miễn phí</span>
                            <div class="course-info-small">
                                <span>48.016 học viên</span>
                                <span>34 lượt xem</span>
                                <span>6h31p</span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card gradient-yellow-orange" onclick="alert('Khóa học này sẽ sớm được mở')">
                        <h3>Lập Trình JavaScript Cơ Bản</h3>
                        <p>{ Cơ bản}</p>
                        <div class="course-footer">
                            <span class="course-type">Miễn phí</span>
                            <div class="course-info-small">
                                <span>151.915 học viên</span>
                                <span>112 lượt xem</span>
                                <span>24h15p</span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card gradient-orange-red" onclick="alert('Khóa học này sẽ sớm được mở')">
                        <h3>Lập Trình JavaScript Nâng Cao</h3>
                        <p>{ Nâng cao}</p>
                        <div class="course-footer">
                            <span class="course-type">Miễn phí</span>
                            <div class="course-info-small">
                                <span>41.744 học viên</span>
                                <span>19 lượt xem</span>
                                <span>8h41p</span>
                            </div>
                        </div>
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
