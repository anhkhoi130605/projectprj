<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String id = request.getParameter("id");
    if (id == null || id.isEmpty()) {
        id = "1";
    }
    
    String title = "";
    String description = "";
    String author = "";
    String authorAvatar = "";
    String tags = "";
    String content = "";
    String thumbnail = "";
    
    switch (id) {
        case "1":
            title = "TRẢI NGHIỆM HỌC THỬ REACT NATIVE, DEVOPS, C++ VỚI CÙNG CHẤT LƯỢNG CÙNG F8";
            description = "Để giúp học viên mới cảm nhận ở nâng chất lượng giảng dạy, tôi đã xây dựng 3 lớp học thử C++, React Native và DevOps với lí trình rõ.";
            author = "Huyền Lê Ngọc";
            authorAvatar = "avatar1.jpg";
            tags = "React Native,2 bảng trước,2 phút đọc";
            thumbnail = "article-featured-1.jpg";
            content = "<h2 class='section-title'>Lợi ích khi tham gia lớp học thứ F8</h2><p>Ngoài lộ trình bài bản, bạn còn nhận được:</p><ul class='benefits-list'><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Học và hỏi đáp trực tiếp với giảng viên</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Trợ giảng hỗ trợ xuyên suốt, fixx bug ngay tại lớp</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Được định hướng lộ trình học phù hợp sau khi trải nghiệm</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#FFB800'><path d='M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z'/></svg><span>Nếu bạn đang tìm một môi trường học lập trình nghiêm túc, thực tế và giàu cảm hứng – hãy thử một buổi học tại F8 nha!</span></li></ul>";
            break;
        case "2":
            title = "Giới thiệu về ngành Công Nghệ Thông Tin và Những Kiến Thức Cơ Bản Bắt Buộc Phải Học";
            description = "Ngành Công Nghệ Thông Tin (CNTT) là một lĩnh vực vực dạng phát triển mạnh mẽ và có vai trò quan trọng trong thời đại số...";
            author = "Hoàng Tuấn 12A1 40 Vĩ";
            authorAvatar = "avatar2.jpg";
            tags = "học lập trình,3 bảng trước,3 phút đọc";
            thumbnail = "article-featured-2.jpg";
            content = "<h2 class='section-title'>Ngành Công Nghệ Thông Tin là gì?</h2><p>Ngành Công Nghệ Thông Tin (CNTT) là một lĩnh vực vực dạng phát triển mạnh mẽ và có vai trò quan trọng trong thời đại số. Nó bao gồm các hoạt động liên quan đến máy tính, phần mềm, mạng máy tính và các ứng dụng công nghệ thông tin.</p><h2 class='section-title'>Kiến thức cơ bản cần biết</h2><ul class='benefits-list'><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Hiểu biết về phần cứng máy tính</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Kiến thức về hệ điều hành</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Lập trình cơ bản</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Mạng máy tính và internet</span></li></ul>";
            break;
        case "3":
            title = "SOLID - 5 nguyên lý \"vàng\" giúp viết code sạch và dễ bảo trì";
            description = "Trong hành trình phát triển phần mềm, chắc hẳn bạn đã từng gặp phải những đoạn code dài, khó hiểu và rất khó để rồi hay chữa...";
            author = "Hoàng Tuấn 12A1 40 Vĩ";
            authorAvatar = "avatar2.jpg";
            tags = "OOP,3 bảng trước,3 phút đọc";
            thumbnail = "article-featured-3.jpg";
            content = "<h2 class='section-title'>5 Nguyên lý SOLID</h2><p>SOLID là một tập hợp năm nguyên lý thiết kế phần mềm được đề xuất bởi Robert C. Martin nhằm giúp các nhà phát triển viết code sạch, dễ bảo trì và mở rộng.</p><ul class='benefits-list'><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>S - Single Responsibility Principle</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>O - Open/Closed Principle</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>L - Liskov Substitution Principle</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>I - Interface Segregation Principle</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>D - Dependency Inversion Principle</span></li></ul>";
            break;
        case "4":
            title = "[HTML - CSS - JS tại F8] Một thời mây mở học, lực lại được trang web cũ - chia sẻ cùng anh em";
            description = "[HTML - CSS - JS tại F8] Một thời mây mở học, lực lại được trang web cũ - chia sẻ cùng anh em";
            author = "Hải Đoàn";
            authorAvatar = "avatar3.jpg";
            tags = "HTML - CSS - JS tại F8,5 bảng trước,2 phút đọc";
            thumbnail = "article-featured-4.jpg";
            content = "<h2 class='section-title'>Hành trình học HTML, CSS, JS</h2><p>Bài viết chia sẻ hành trình học lập trình HTML, CSS, JS tại F8 và những bài học quý báu từ quá trình học tập.</p><ul class='benefits-list'><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Kiến thức HTML cơ bản</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>CSS styling và responsive design</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>JavaScript interactivity</span></li></ul>";
            break;
        case "5":
            title = "Hoàng Bảo Trung - Học viên tiêu biểu của F8 tòa sáng với dự án \"AI Powered Learning\"";
            description = "Trong thời đại công nghệ số 4.0, việc học không còn bị buộc trong những cách sách truyền thống. Giờ đây, trí tuệ nhân tạo (AI) đang...";
            author = "Sơn Đặng";
            authorAvatar = "avatar4.jpg";
            tags = "React15,một năm trước,6 phút đọc";
            thumbnail = "article-featured-5.jpg";
            content = "<h2 class='section-title'>Câu chuyện của Hoàng Bảo Trung</h2><p>Hoàng Bảo Trung là một học viên tiêu biểu của F8 đã tạo ra dự án \"AI Powered Learning\" - một nền tảng học tập thông minh sử dụng trí tuệ nhân tạo.</p><ul class='benefits-list'><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Học tập từ F8 và phát triển kỹ năng</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Tạo ra dự án AI Powered Learning</span></li><li><svg viewBox='0 0 24 24' width='20' height='20' fill='#4CAF50'><path d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/></svg><span>Đóng góp cho cộng đồng lập trình</span></li></ul>";
            break;
        default:
            title = "Bài viết không tồn tại";
            description = "Không tìm thấy bài viết này.";
            author = "Admin";
            authorAvatar = "avatar1.jpg";
            tags = "";
            thumbnail = "article-featured-1.jpg";
            content = "<p>Bài viết không tồn tại hoặc đã bị xóa.</p>";
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= title %> - E-Learning System</title>
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
            <article class="article-detail-container">
                <!-- Article Header -->
                <div class="article-detail-header">
                    <div class="article-detail-top">
                        <div class="author-section">
                            <img src="${pageContext.request.contextPath}/assets/images/<%= authorAvatar %>" alt="<%= author %>" class="author-avatar-large" />
                            <span class="author-name-large"><%= author %></span>
                        </div>
                        <div class="article-actions-top">
                            <button class="bookmark-btn-large" aria-label="Bookmark">
                                <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
                                    <path d="M17 3H5c-1.11 0-2 .9-2 2v16l7-3 7 3V5c0-1.1.89-2 2-2z"/>
                                </svg>
                            </button>
                            <button class="menu-btn-large" aria-label="More options">
                                <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
                                    <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <h1 class="article-detail-title"><%= title %></h1>
                    
                    <p class="article-detail-description"><%= description %></p>

                    <div class="article-detail-meta">
                        <% String[] tagArray = tags.split(",");
                           for (String tag : tagArray) { %>
                            <span class="tag"><%= tag.trim() %></span>
                        <% } %>
                    </div>

                    <div class="article-detail-image">
                        <img src="${pageContext.request.contextPath}/assets/images/<%= thumbnail %>" alt="<%= title %>" />
                    </div>
                </div>

                <!-- Article Body -->
                <div class="article-detail-body">
                    <div class="article-content-left">
                        <div class="article-engagement">
                            <div class="author-info-sidebar">
                                <img src="${pageContext.request.contextPath}/assets/images/<%= authorAvatar %>" alt="<%= author %>" class="author-avatar-small" />
                                <span class="author-name-small"><%= author %></span>
                            </div>

                            <div class="engagement-buttons">
                                <button class="like-btn" onclick="toggleLike(this)">
                                    <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                        <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                                    </svg>
                                    <span class="like-count">1</span>
                                </button>
                                <button class="comment-btn" onclick="toggleComments()">
                                    <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                                        <path d="M20 2H4c-1.1 0-2 .9-2 2v18l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2z"/>
                                    </svg>
                                    <span class="comment-count">0</span>
                                </button>
                            </div>
                        </div>

                        <!-- Article Content Sections -->
                        <section class="content-section">
                            <%= content %>
                        </section>

                        <!-- Tags Section -->
                        <div class="article-tags-section">
                            <div class="tags-container">
                                <% for (String tag : tagArray) { %>
                                    <span class="tag-item"><%= tag.trim() %></span>
                                <% } %>
                            </div>
                        </div>

                        <!-- Related Articles Section -->
                        <section class="related-articles-section">
                            <h2 class="section-title">Bài đăng cùng tác giả</h2>
                            <p class="section-subtitle">Tác giả chưa có bài đăng nào khác.</p>
                            <div class="divider"></div>
                        </section>

                        <!-- Other Featured Articles Section -->
                        <section class="other-featured-section">
                            <h2 class="section-title">Bài viết nổi bật khác</h2>
                            <p class="section-subtitle">XEM CÁC BÀI VIẾT THEO CHỦ ĐỀ</p>

                            <div class="topic-filter-tabs">
                                <button class="topic-filter-tab active" onclick="filterRelatedArticles(this)">Front-end / Mobile apps</button>
                                <button class="topic-filter-tab" onclick="filterRelatedArticles(this)">Back-end / Devops</button>
                                <button class="topic-filter-tab" onclick="filterRelatedArticles(this)">UI / UX / Design</button>
                                <button class="topic-filter-tab" onclick="filterRelatedArticles(this)">Others</button>
                            </div>

                            <div class="related-articles-list">
                                <article class="related-article-card">
                                    <div class="related-article-header">
                                        <img src="${pageContext.request.contextPath}/assets/images/avatar2.jpg" alt="Hoàng Tuấn" class="related-author-avatar" />
                                        <span class="related-author-name">Hoàng Tuấn 12A1 40 Vĩ</span>
                                    </div>
                                    <h3 class="related-article-title"><a href="${pageContext.request.contextPath}/eduHome/articlesDetail.jsp?id=2">Giới thiệu về ngành Công Nghệ Thông Tin và Những Kiến Thức Cơ Bản Bắt Buộc Phải Học</a></h3>
                                    <p class="related-article-desc">Ngành Công Nghệ Thông Tin (CNTT) là một lĩnh vực vực dạng phát triển mạnh mẽ và có vai trò quan trọng trong thời đại số...</p>
                                    <div class="related-article-meta">
                                        <span class="tag">học lập trình</span>
                                        <span class="tag">3 bảng trước</span>
                                        <span class="tag">3 phút đọc</span>
                                    </div>
                                </article>

                                <article class="related-article-card">
                                    <div class="related-article-header">
                                        <img src="${pageContext.request.contextPath}/assets/images/avatar2.jpg" alt="Hoàng Tuấn" class="related-author-avatar" />
                                        <span class="related-author-name">Hoàng Tuấn 12A1 40 Vĩ</span>
                                    </div>
                                    <h3 class="related-article-title"><a href="${pageContext.request.contextPath}/eduHome/articlesDetail.jsp?id=3">SOLID - 5 nguyên lý "vàng" giúp viết code sạch và dễ bảo trì</a></h3>
                                    <p class="related-article-desc">Trong hành trình phát triển phần mềm, chắc hẳn bạn đã từng gặp phải những đoạn code dài, khó hiểu và rất khó để rồi hay chữa...</p>
                                    <div class="related-article-meta">
                                        <span class="tag">OOP</span>
                                        <span class="tag">3 bảng trước</span>
                                        <span class="tag">3 phút đọc</span>
                                    </div>
                                </article>
                            </div>
                        </section>
                    </div>
                </div>
            </article>
        </main>
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

    <script src="${pageContext.request.contextPath}/assets/js/eduHome/eduHome.js?v=2.1"></script>
    <script src="${pageContext.request.contextPath}/assets/js/eduHome/articlesDetail.js?v=1.0"></script>
</body>
</html>
