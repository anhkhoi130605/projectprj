<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lộ trình học Front-end - E-Learning System</title>
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
            <!-- Changed layout to 2-column: main content + right sidebar with promo cards -->
            <div class="learning-path-wrapper">
                <!-- Left: Main Content -->
                <div class="learning-path-detail">
                    <!-- Header Section -->
                    <div class="path-header">
                        <h1>Lộ trình học Front-end</h1>
                        <p class="path-description">
                            Hầu hết các websites hoặc ứng dụng web có 2 phần là Front-end và Back-end. Front-end là phần giao diện người dùng nhìn thấy và có tương tác, đó chính là các ứng dụng mobile hay những website bạn đã từng sử dụng. Vì vậy, nhiệm vụ của lập trình viên Front-end là xây dựng các giao diện đẹp, dễ sử dụng và tối ưu trải nghiệm người dùng.
                        </p>
                        <p class="path-price">
                            Tại Việt Nam, <span class="highlight">lương trung bình cho lập trình viên front-end vào khoảng 16.000.000đ / tháng</span>.
                        </p>
                        <p class="path-note">
                            Dưới đây là các khóa học E-Learning System đã tạo ra dành cho bạt cứ ai theo dự sự nghiệp trở thành một lập trình viên Front-end.
                        </p>
                        <div class="path-warning">
                            <p>Các khóa học có thể chưa đầy đủ, E-Learning System vẫn đang nỗ lực hoàn thiện trong thời gian sớm nhất.</p>
                        </div>
                    </div>

                    <!-- Learning Sections -->
                    <div class="learning-sections">
                        <!-- Section 1 -->
                        <section class="learning-section">
                            <h2 class="section-title">1. Tìm hiểu về ngành IT</h2>
                            <p class="section-description">
                                Để theo ngành IT - Phần mềm cần tìm hiểu những kỹ năng nào? Bạn đã có sẵn tố chất phù hợp với ngành chưa? Cùng tham quan các công ty IT và tìm hiểu về vận hóa, tác phong làm việc của ngành này nhé các bạn.
                            </p>
                            <div class="courses-grid">
                                <div class="course-card">
                                    <div class="course-image" style="background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);">
                                        <div class="course-image-overlay">
                                            <h4>Kiến Thức Nền Tảng</h4>
                                            <p>Kiến thức nhập môn</p>
                                        </div>
                                    </div>
                                    <div class="course-content">
    <h3 class="course-title">Kiến Thức Nền Tảng</h3>
    <p class="course-label">Miễn phí</p>
    <p class="course-description">
        Để có cái nhìn tổng quan về ngành IT - Lập trình với các bạn xem các videos tại khóa này trước nhé.
    </p>
    <a href="${pageContext.request.contextPath}/eduHome/lessonNewbie.jsp?id=1" class="btn-view-course">XEM KHÓA HỌC</a>
</div>

                                </div>
                            </div>
                        </section>

                        <!-- Section 2 -->
                        <section class="learning-section">
                            <h2 class="section-title">2. HTML và CSS</h2>
                            <p class="section-description">
                                Để học web Front-end chúng ta luôn bắt đầu với ngôn ngữ HTML và CSS, đây là 2 ngôn ngữ cơ bản nhất trong mỗi website trên internet. Trong khóa học này F8 sẽ chia sẻ từ những kiến thức cơ bản nhất. Sau khóa học này bạn sẽ tự lâm được 2 giao diện websites là The Band và Shopeee.
                            </p>
                            <div class="courses-grid">
                                <div class="course-card">
                                    <div class="course-image" style="background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);">
                                        <div class="course-image-overlay">
                                            <h4>HTML CSS Pro</h4>
                                            <p>Lập trình web cơ bản</p>
                                        </div>
                                    </div>
                                    <div class="course-content">
                                        <h3 class="course-title">HTML CSS Pro</h3>
                                        <p class="course-price">2.500.000đ <span class="original-price">1.299.000đ</span></p>
                                        <p class="course-description">Khóa học HTML CSS Pro phù hợp cho cả người mới bắt đầu, lên tới 8 dự án Figma, 300+ bài tập và flashcards, tăng 3+ games, tăng 20+ Figma để thực hành, công đồng viên Pro nhất tính hỗ trợ nhau, mua một lần mãi mãi.</p>
                                        <a href="${pageContext.request.contextPath}/eduHome/lessonNewbie.jsp?id=3" class="btn-view-course">XEM KHÓA HỌC</a>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- Section 3 -->
                        <section class="learning-section">
                            <h2 class="section-title">3. JavaScript</h2>
                            <p class="section-description">
                                Với HTML, CSS bạn mới chỉ xây dựng được các websites tĩnh, chỉ bao gồm phần giao diện và gần như chưa có xử lý chức năng. Để thêm nhiều chức năng phong phú và tăng tính tương tác của website bạn cần học javascript.
                            </p>
                            <div class="courses-grid">
                                <div class="course-card">
                                    <div class="course-image" style="background: linear-gradient(135deg, #f1c40f 0%, #f39c12 100%);">
                                        <div class="course-image-overlay">
                                            <h4>JavaScript Cơ Bản</h4>
                                            <p>Lập trình hàm</p>
                                        </div>
                                    </div>
                                    <div class="course-content">
                                        <h3 class="course-title">Lập Trình JavaScript Cơ Bản</h3>
                                        <p class="course-label">Miễn phí</p>
                                        <p class="course-description">Học javascript cơ bản phù hợp cho người chưa từng học lập trình. Với hơn 100 bài học và có bài tập thực hành sau mỗi bài học.</p>
                                        <a href="${pageContext.request.contextPath}/eduHome/lessonNewbie.jsp?id=5" class="btn-view-course">XEM KHÓA HỌC</a>
                                    </div>
                                </div>
                                <div class="course-card">
                                    <div class="course-image" style="background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);">
                                        <div class="course-image-overlay">
                                            <h4>JavaScript Nâng Cao</h4>
                                            <p>Lập trình nâng cao</p>
                                        </div>
                                    </div>
                                    <div class="course-content">
                                        <h3 class="course-title">Lập Trình JavaScript Nâng Cao</h3>
                                        <p class="course-label">Miễn phí</p>
                                        <p class="course-description">Hiểu sâu hơn về cách javascript hoạt động, tìm hiểu về IIFE, closure, reference types, this keyword, bind, call, apply, prototype...</p>
                                        <a href="${pageContext.request.contextPath}/eduHome/lessonNewbie.jsp?id=6" class="btn-view-course">XEM KHÓA HỌC</a>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- Section 4 -->
                        <section class="learning-section">
                            <h2 class="section-title">4. Sử dụng Ubuntu/Linux</h2>
                            <p class="section-description">
                                Cách làm việc với hệ điều hành Ubuntu/Linux qua Windows Terminal & WSL. Khi đi làm, nhiều trường hợp bạn cần nắm vững các dòng lệnh cơ bản của Ubuntu/Linux.
                            </p>
                            <div class="courses-grid">
                                <div class="course-card">
                                    <div class="course-image" style="background: linear-gradient(135deg, #9b59b6 0%, #8e44ad 100%);">
                                        <div class="course-image-overlay">
                                            <h4>Terminal & Ubuntu</h4>
                                            <p>Lập trình hệ thống</p>
                                        </div>
                                    </div>
                                    <div class="course-content">
                                        <h3 class="course-title">Làm việc với Terminal & Ubuntu</h3>
                                        <p class="course-label">Miễn phí</p>
                                        <p class="course-description">Số hầu một terminal hiện đại, mạnh mẽ trong tập biến và học cách làm việc với Ubuntu là một bước quan trọng trên con đường trở thành một Web Developer.</p>
                                        <a href="${pageContext.request.contextPath}/eduHome/lessonNewbie.jsp?id=4" class="btn-view-course">XEM KHÓA HỌC</a>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- Section 5 -->
                        <section class="learning-section">
                            <h2 class="section-title">5. Libraries and Frameworks</h2>
                            <p class="section-description">
                                Một websites hay ứng dụng đại phức tạp, chỉ sử dụng HTML, CSS, Javascript theo từng code thuần (từ code từ đầu tới cuối) sẽ rất khó khăn. Vì vậy các Libraries, Frameworks ra đời nhằm đơn giản hóa việc lập trình website hoặc mobile.
                            </p>
                            <div class="courses-grid">
                                <div class="course-card">
                                    <div class="course-image" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                        <div class="course-image-overlay">
                                            <h4>ReactJS</h4>
                                            <p>Lập trình frontend</p>
                                        </div>
                                    </div>
                                    <div class="course-content">
                                        <h3 class="course-title">Xây Dựng Website với ReactJS</h3>
                                        <p class="course-label">Miễn phí</p>
                                        <p class="course-description">Khóa học ReactJS từ cơ bản tới nâng cao, kết quả cuối cùng khóa học này là bạn có thể làm hầu hết các dự án trên Tiktok, bạn có thể tự tin đi xin việc khi nam chắc các kiến thức được chia sẻ trong khóa học này.</p>
                                        <a href="${pageContext.request.contextPath}/eduHome/lessonNewbie.jsp?id=7" class="btn-view-course">XEM KHÓA HỌC</a>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

                <!-- Right: Promo Cards Sidebar -->
                <aside class="learning-path-sidebar">
                    <!-- Promo Card 1 -->
                    <div class="promo-card promo-card-1">
                        <div class="promo-card-content">
                            <div class="promo-header">Khóa học</div>
                            <h3 class="promo-title">HTML CSS PRO</h3>
                            <ul class="promo-features">
                                <li>✓ Thực hành 8 dự án</li>
                                <li>✓ Hơn 300 bài tập thử thách</li>
                                <li>✓ Tổng ứng dụng Flashcards</li>
                                <li>✓ Tổng 3 Games tuyệt HTML CSS</li>
                                <li>✓ Tổng 20+ thiết kế Figma</li>
                            </ul>
                            <button class="btn-promo">Tìm hiểu thêm ></button>
                        </div>
                    </div>

                    <!-- Promo Card 2 -->
                    <div class="promo-card promo-card-2">
                        <div class="promo-card-content">
                            <div class="promo-header">Theo dõi kênh Youtube</div>
                            <div class="youtube-info">
                                 <img src="${pageContext.request.contextPath}/assets/images/card1.png" alt="F8 Official" class="youtube-avatar">
                                <div class="youtube-details">
                                    <h4>E-Learning System Official</h4>
                                    <button class="btn-subscribe">SUBSCRIBE</button>
                                </div>
                            </div>
                            <ul class="youtube-features">
                                <li>✓ Vlog về cuộc sống lập trình viên</li>
                                <li>✓ Chia sẻ kinh nghiệm làm việc thực tế</li>
                                <li>✓ Hiểu con người, tính cách Founder F8</li>
                            </ul>
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
</body>
</html>
