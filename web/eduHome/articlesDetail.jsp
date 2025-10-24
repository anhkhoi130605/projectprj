<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Bài Viết - EduPlatform</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/EduHome.css?v=2.0">
    <style>
        .article-detail-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 2rem;
            border-radius: 12px;
        }

        .article-detail-header {
            margin-bottom: 2rem;
        }

        .article-detail-header h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
            line-height: 1.4;
        }

        .article-detail-meta {
            display: flex;
            gap: 2rem;
            color: #999;
            font-size: 0.95rem;
            margin-bottom: 1rem;
        }

        .article-detail-image {
            width: 100%;
            height: 400px;
            border-radius: 12px;
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .article-detail-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .article-detail-content {
            line-height: 1.8;
            color: #333;
        }

        .article-detail-content p {
            margin-bottom: 1.5rem;
        }

        .article-detail-content h2 {
            font-size: 1.5rem;
            margin: 2rem 0 1rem;
        }

        .article-detail-content h3 {
            font-size: 1.2rem;
            margin: 1.5rem 0 0.75rem;
        }

        .article-detail-content ul,
        .article-detail-content ol {
            margin-left: 2rem;
            margin-bottom: 1.5rem;
        }

        .article-detail-content li {
            margin-bottom: 0.5rem;
        }

        .article-detail-content code {
            background-color: #f5f5f5;
            padding: 0.2rem 0.4rem;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            color: #d63384;
        }

        .article-detail-content pre {
            background-color: #f5f5f5;
            padding: 1rem;
            border-radius: 8px;
            overflow-x: auto;
            margin-bottom: 1.5rem;
        }

        .article-detail-content pre code {
            color: #333;
            padding: 0;
        }

        .article-related {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid #e0e0e0;
        }

        .article-related h3 {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
        }

        .related-articles {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }
    </style>
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
                <input type="text" placeholder="Tìm kiếm...">
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
            <div class="article-detail-container">
                <div class="article-detail-header">
                    <h1>Tổng hợp các sản phẩm của học viên tại F8</h1>
                    <div class="article-detail-meta">
                        <span><strong>Tác giả:</strong> Sơn Đặng</span>
                        <span><strong>Ngày đăng:</strong> 15 Tháng 10, 2024</span>
                        <span><strong>Thời gian đọc:</strong> 6 phút</span>
                    </div>
                </div>

                <div class="article-detail-image">
                    <img src="${pageContext.request.contextPath}/images/article-thumb1.png" alt="Article">
                </div>

                <div class="article-detail-content">
                    <p>F8 là một nền tảng học lập trình hàng đầu tại Việt Nam, nơi hàng ngàn học viên đã hoàn thành các khóa học và tạo ra những sản phẩm tuyệt vời. Bài viết này sẽ giới thiệu một số sản phẩm nổi bật của các học viên F8.</p>

                    <h2>Những Sản Phẩm Nổi Bật</h2>
                    <p>Các học viên của F8 đã tạo ra nhiều dự án web thú vị, từ các trang web cá nhân đến các ứng dụng web phức tạp. Dưới đây là một số sản phẩm nổi bật:</p>

                    <h3>1. Trang Web Cá Nhân</h3>
                    <p>Nhiều học viên đã tạo ra các trang web cá nhân để giới thiệu bản thân và các dự án của họ. Những trang web này thường sử dụng HTML, CSS và JavaScript để tạo ra giao diện đẹp và tương tác.</p>

                    <h3>2. Ứng Dụng Web</h3>
                    <p>Một số học viên đã phát triển các ứng dụng web sử dụng React, Vue hoặc Angular. Những ứng dụng này có chức năng phức tạp như quản lý công việc, quản lý tài chính, v.v.</p>

                    <h3>3. Dự Án Open Source</h3>
                    <p>Một số học viên đã đóng góp cho các dự án open source hoặc tạo ra các dự án open source của riêng họ. Những dự án này giúp cộng đồng lập trình viên và cải thiện kỹ năng của họ.</p>

                    <h2>Cách Bắt Đầu Tạo Sản Phẩm</h2>
                    <p>Nếu bạn muốn tạo ra sản phẩm của riêng mình, dưới đây là một số bước để bắt đầu:</p>
                    <ul>
                        <li>Chọn một ý tưởng dự án mà bạn quan tâm</li>
                        <li>Lập kế hoạch chi tiết cho dự án</li>
                        <li>Bắt đầu viết code</li>
                        <li>Kiểm tra và sửa lỗi</li>
                        <li>Triển khai dự án</li>
                        <li>Chia sẻ dự án với cộng đồng</li>
                    </ul>

                    <h2>Kết Luận</h2>
                    <p>Các sản phẩm của học viên F8 là minh chứng cho chất lượng giáo dục tại F8. Nếu bạn muốn trở thành một lập trình viên giỏi, hãy tham gia F8 và bắt đầu học lập trình ngay hôm nay!</p>

                    <div class="article-related">
                        <h3>Bài Viết Liên Quan</h3>
                        <div class="related-articles">
                            <div class="article-card" onclick="navigateTo('articlesDetail.jsp')">
                                <div class="article-image">
                                    <img src="${pageContext.request.contextPath}/images/article-thumb2.png" alt="Related">
                                </div>
                                <div class="article-info">
                                    <h3>[Phần 1] Tạo dự án ReactJS với Webpack và Babel</h3>
                                    <div class="article-meta">
                                        <span class="author">Sơn Đặng</span>
                                        <span class="date">12 phút đọc</span>
                                    </div>
                                </div>
                            </div>

                            <div class="article-card" onclick="navigateTo('articlesDetail.jsp')">
                                <div class="article-image">
                                    <img src="${pageContext.request.contextPath}/images/article-thumb3.png" alt="Related">
                                </div>
                                <div class="article-info">
                                    <h3>Cách đưa code lên GitHub và tạo GitHub Pages</h3>
                                    <div class="article-meta">
                                        <span class="author">Vo Minh Kha</span>
                                        <span class="date">4 phút đọc</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
