<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Học Lập Trình Để Đi Làm - EduPlatform</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base/base.css?v=2.1">
</head>
<body>
    <!-- Header -->
    <jsp:include page="/common/header.jsp" />

    <div class="main-container">
        <!-- Sidebar -->
        <jsp:include page="/common/sidebar.jsp" />


        <!-- Main Content -->
        <main class="main-content">
            <!-- Image carousel banner at the top -->
            <section class="banner-carousel">
                <div class="carousel-container">
                    <div class="carousel-slide active">
                        <img src="${pageContext.request.contextPath}/assets/images/banner1.jpeg" alt="Web Development">
                    </div>
                    <div class="carousel-slide">
                        <img src="${pageContext.request.contextPath}/assets/images/banner2.jpg" alt="Coding Skills">
                    </div>
                    <div class="carousel-slide">
                        <img src="${pageContext.request.contextPath}/assets/images/banner3.jpg" alt="Programming">
                    </div>
                    <div class="carousel-slide">
                        <img src="${pageContext.request.contextPath}/assets/images/banner4.jpg" alt="Tech Education">
                    </div>
                </div>
                
                <div class="carousel-dots">
                    <span class="dot active" onclick="currentSlide(0)"></span>
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                    <span class="dot" onclick="currentSlide(3)"></span>
                </div>
            </section>

            <!-- Move intro section right after banner, before pro courses -->
            <section class="intro-section">
                <div class="intro-content">
                    <h2>Chào mừng đến với E-Learning System - Học Lập Trình Để Đi Làm</h2>
                    <p> E-Learning System là nền tảng học lập trình hàng đầu tại Việt Nam, cung cấp các khóa học chất lượng cao từ cơ bản đến nâng cao. Chúng tôi cam kết giúp bạn trở thành một lập trình viên chuyên nghiệp với kỹ năng thực tế và kinh nghiệm làm việc.</p>
                    <div class="intro-features">
                        <div class="feature-item">
                            <svg class="feature-icon" viewBox="0 0 24 24" width="32" height="32" fill="currentColor">
                                <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5z"/>
                            </svg>
                            <h4>Giáo viên Chuyên Nghiệp</h4>
                            <p>Học từ những lập trình viên có kinh nghiệm thực tế</p>
                        </div>
                        <div class="feature-item">
                            <svg class="feature-icon" viewBox="0 0 24 24" width="32" height="32" fill="currentColor">
                                <path d="M18 2H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 18H6V4h12v16zm-5.5-10c.83 0 1.5-.67 1.5-1.5S13.33 7 12.5 7 11 7.67 11 8.5s.67 1.5 1.5 1.5z"/>
                            </svg>
                            <h4>Nội Dung Cập Nhật</h4>
                            <p>Các khóa học được cập nhật theo xu hướng công nghệ mới nhất</p>
                        </div>
                        <div class="feature-item">
                            <svg class="feature-icon" viewBox="0 0 24 24" width="32" height="32" fill="currentColor">
                                <path d="M20 6h-2.18c.11-.89.35-1.76.77-2.57.9-1.79.14-3.34-1.64-3.34-.92 0-1.78.38-2.24 1.03C15.15 1.31 13.63.5 12 .5s-3.15.81-3.71 1.62c-.46-.65-1.32-1.03-2.24-1.03-1.78 0-2.54 1.55-1.64 3.34.42.81.66 1.68.77 2.57H4c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm-5-2c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm-4 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1z"/>
                            </svg>
                            <h4>Hỗ Trợ Việc Làm</h4>
                            <p>Được hỗ trợ tìm việc làm sau khi hoàn thành khóa học</p>
                        </div>
                        <div class="feature-item">
                            <svg class="feature-icon" viewBox="0 0 24 24" width="32" height="32" fill="currentColor">
                                <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V5h14v14zm-5-6.71l-2.75 3.54-2.16-2.66c-.44-.53-1.25-.58-1.78-.15-.53.44-.58 1.25-.15 1.78l3 3.67c.25.31.61.5.99.5.38 0 .74-.19.99-.5l3.54-4.29c.44-.53.39-1.34-.15-1.78-.53-.44-1.34-.39-1.78.15z"/>
                            </svg>
                            <h4>Chứng Chỉ Hoàn Thành</h4>
                            <p>Nhận chứng chỉ được công nhận khi hoàn thành khóa học</p>
                        </div>
                    </div>
                </div>
            </section>
            
             <!-- Learning Path Roadmap -->
            <section id="roadmap" class="roadmap-section">
                <h2>Sơ Đồ Lộ Trình Học Cơ Bản</h2>
                <div class="roadmap-container">
                    <div class="roadmap-step step-1">
                        <div class="step-number">1</div>
                        <h3>HTML & CSS Cơ Bản</h3>
                        <p>Học cấu trúc trang web và tạo giao diện đẹp</p>
                        <span class="step-duration">4 tuần</span>
                    </div>
                    <svg class="roadmap-arrow" viewBox="0 0 100 100" preserveAspectRatio="none">
                        <path d="M 10 50 Q 50 10, 90 50" stroke="currentColor" stroke-width="2" fill="none" marker-end="url(#arrowhead)"/>
                        <defs>
                            <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
                                <polygon points="0 0, 10 3, 0 6" fill="currentColor"/>
                            </marker>
                        </defs>
                    </svg>
                    
                    <div class="roadmap-step step-2">
                        <div class="step-number">2</div>
                        <h3>JavaScript Cơ Bản</h3>
                        <p>Làm cho trang web tương tác và động</p>
                        <span class="step-duration">6 tuần</span>
                    </div>
                    <svg class="roadmap-arrow" viewBox="0 0 100 100" preserveAspectRatio="none">
                        <path d="M 10 50 Q 50 10, 90 50" stroke="currentColor" stroke-width="2" fill="none" marker-end="url(#arrowhead)"/>
                        <defs>
                            <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
                                <polygon points="0 0, 10 3, 0 6" fill="currentColor"/>
                            </marker>
                        </defs>
                    </svg>
                    
                    <div class="roadmap-step step-3">
                        <div class="step-number">3</div>
                        <h3>ReactJS</h3>
                        <p>Xây dựng ứng dụng web hiện đại</p>
                        <span class="step-duration">8 tuần</span>
                    </div>
                    <svg class="roadmap-arrow" viewBox="0 0 100 100" preserveAspectRatio="none">
                        <path d="M 10 50 Q 50 10, 90 50" stroke="currentColor" stroke-width="2" fill="none" marker-end="url(#arrowhead)"/>
                        <defs>
                            <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
                                <polygon points="0 0, 10 3, 0 6" fill="currentColor"/>
                            </marker>
                        </defs>
                    </svg>

                    <div class="roadmap-step step-4">
                        <div class="step-number">4</div>
                        <h3>Backend & Database</h3>
                        <p>Xây dựng máy chủ và quản lý dữ liệu</p>
                        <span class="step-duration">10 tuần</span>
                    </div>
                </div>
            </section>

            <!-- Pro Courses Section -->
            <section class="pro-courses-section">
                <div class="section-header">
                    <h2>Khóa học Pro <span class="badge-pro">PRO</span></h2>
                </div>
                
                <div class="pro-courses-grid">
                    <div class="pro-course-card" onclick="openAuthModal('signup')">
                        <div class="course-image">
                            <img src="${pageContext.request.contextPath}/assets/images/pro1.webp" alt="HTML CSS Pro" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>HTML, CSS Pro</h3>
                            <p class="course-description">Cho người mới bắt đầu</p>
                            <div class="course-pricing">
                                <span class="original-price">2.500.000đ</span>
                                <span class="discount-price">1.299.000đ</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">Sơn Đặng</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">590</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">116h50p</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="pro-course-card" onclick="openAuthModal('signup')">
                        <div class="course-image">
                            <img src="${pageContext.request.contextPath}/assets/images/pro2.jpg" alt="JavaScript Pro" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>JavaScript Pro</h3>
                            <p class="course-description">Cho người mới bắt đầu</p>
                            <div class="course-pricing">
                                <span class="original-price">3.299.000đ</span>
                                <span class="discount-price">1.399.000đ</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">Sơn Đặng</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">254</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">49h34p</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="pro-course-card" onclick="openAuthModal('signup')">
                        <div class="course-image ">
                            <img src="${pageContext.request.contextPath}/assets/images/pro3.png" alt="Ngôn ngữ Sass" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>Ngôn ngữ Sass</h3>
                            <p class="course-description">Cho Frontend Developer</p>
                            <div class="course-pricing">
                                <span class="original-price">400.000đ</span>
                                <span class="discount-price">299.000đ</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">Sơn Đặng</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">27</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">6h18p</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Free Courses Section -->
            <section class="free-courses-section">
                <div class="section-header">
                    
                    <h2>Khóa học miễn phí</h2>
                    <a href="free.jsp" class="view-all">Xem lộ trình ></a>
                </div>
                
                <div class="free-courses-grid">
                    <div class="free-course-card" onclick="navigateTo('lessonNewbie.jsp?id=1')">
                        <div class="course-image">
                            <img src="${pageContext.request.contextPath}/assets/images/free1.jpg" alt="Kiến Thức Nền Tảng" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>Kiến Thức Nền Tảng</h3>
                            <p class="course-description">Kiến thức nhập môn()</p>
                            <div class="course-pricing">
                                <span class="course-type">Miễn phí</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">137.212</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">9</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">3h12p</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card" onclick="navigateTo('lessonNewbie.jsp?id=2')">
                        <div class="course-image">
                            <img src="${pageContext.request.contextPath}/assets/images/free2.png" alt="Lập trình C++" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>Lập trình C++ cơ bản, nâng cao</h3>
                            <p class="course-description">Lập trình C++ cơ bản, nâng cao</p>
                            <div class="course-pricing">
                                <span class="course-type">Miễn phí</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">37.626</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">55</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">10h18p</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card" onclick="navigateTo('lessonNewbie.jsp?id=3')">
                        <div class="course-image ">
                            <img src="${pageContext.request.contextPath}/assets/images/free3.png" alt="HTML CSS từ Zero đến Hero" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>HTML, CSS từ Zero đến Hero</h3>
                            <p class="course-description">Từ zero đến hero</p>
                            <div class="course-pricing">
                                <span class="course-type">Miễn phí</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">215.726</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">117</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">29h5p</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card" onclick="navigateTo('lessonNewbie.jsp?id=4')">
                        <div class="course-image">
                            <img src="${pageContext.request.contextPath}/assets/images/free4.png" alt="Responsive Với Grid System" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>Responsive Với Grid System</h3>
                            <p class="course-description">@web design</p>
                            <div class="course-pricing">
                                <span class="course-type">Miễn phí</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">48.017</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">34</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">6h31p</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card" onclick="navigateTo('lessonNewbie.jsp?id=5')">
                        <div class="course-image">
                            <img src="${pageContext.request.contextPath}/assets/images/free5.jpg" alt="Lập Trình JavaScript Cơ Bản" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>Lập Trình JavaScript Cơ Bản</h3>
                            <p class="course-description">Cơ bản</p>
                            <div class="course-pricing">
                                <span class="course-type">Miễn phí</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">151.921</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">112</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">24h15p</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="free-course-card" onclick="navigateTo('lessonNewbie.jsp?id=6')">
                        <div class="course-image">
                            <img src="${pageContext.request.contextPath}/assets/images/free6.jpg" alt="Lập Trình JavaScript Nâng Cao" class="course-image-img" />
                        </div>
                        <div class="course-content">
                            <h3>Lập Trình JavaScript Nâng Cao</h3>
                            <p class="course-description">Nâng cao</p>
                            <div class="course-pricing">
                                <span class="course-type">Miễn phí</span>
                            </div>
                            <div class="course-stats-row">
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                                    </svg>
                                    <span class="stat-label">41.746</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                                    </svg>
                                    <span class="stat-label">19</span>
                                </span>
                                <span class="stat-item">
                                    <svg class="stat-icon" viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                                        <path d="M11.99 5C6.47 5 2 9.48 2 15s4.47 10 9.99 10C17.52 25 22 20.52 22 15S17.52 5 11.99 5zM15.5 15.5h-4v-4h4v4z"/>
                                    </svg>
                                    <span class="stat-label">8h41p</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Featured Videos Section -->
            <section class="videos-section">
                <div class="section-header">
                    <h2>Videos nổi bật</h2>
                    <a href="#" class="view-all">Xem tất cả ></a>
                </div>
                
                <div class="videos-scroll">
                    <div class="video-card" onclick="window.open('https://www.youtube.com/watch?v=NVmi45IPG80', '_blank')">
                        <div class="video-thumbnail">
                            <img src="${pageContext.request.contextPath}/assets/images/video1.jpg" alt="HTML CSS">
                            <span class="play-button">▶</span>
                            <span class="duration">07:53</span>
                        </div>
                        <div class="video-info">
                            <h3>Bạn sẽ làm được gì sau khóa học?</h3>
                            <div class="video-stats">
                                <span>1.118.468 lượt xem</span>
                                <span>6.567 lượt thích</span>
                                <span>147 bình luận</span>
                            </div>
                        </div>
                    </div>

                    <div class="video-card" onclick="window.open('https://www.youtube.com/watch?v=YH-E4Y3EaT4', '_blank')">
                        <div class="video-thumbnail">
                            <img src="${pageContext.request.contextPath}/assets/images/video2.jpg" alt="Internship">
                            <span class="play-button">▶</span>
                            <span class="duration">34:51</span>
                        </div>
                        <div class="video-info">
                            <h3>Sinh viên IT đi thực tập tại doanh nghiệp cần biết những gì?</h3>
                            <div class="video-stats">
                                <span>263.572 lượt xem</span>
                                <span>6.434 lượt thích</span>
                                <span>236 bình luận</span>
                            </div>
                        </div>
                    </div>

                    <div class="video-card" onclick="window.open('https://www.youtube.com/watch?v=70j3UJO-_uY', '_blank')">
                        <div class="video-thumbnail">
                            <img src="${pageContext.request.contextPath}/assets/images/video3.jpg" alt="Programming Methods">
                            <span class="play-button">▶</span>
                            <span class="duration">24:06</span>
                        </div>
                        <div class="video-info">
                            <h3>Phương pháp học lập trình </h3>
                            <div class="video-stats">
                                <span>131.590 lượt xem</span>
                                <span>6.203 lượt thích</span>
                                <span>340 bình luận</span>
                            </div>
                        </div>
                    </div>

                    <div class="video-card" onclick="window.open('https://www.youtube.com/watch?v=IjWuRvHyS3Q', '_blank')">
                        <div class="video-thumbnail">
                            <img src="${pageContext.request.contextPath}/assets/images/video4.jpg" alt="Code Battle">
                            <span class="play-button">▶</span>
                            <span class="duration">25:10</span>
                        </div>
                        <div class="video-info">
                            <h3>"Code Thiếu Nhi Battle" Trạng Giải Trả Sửa Size L</h3>
                            <div class="video-stats">
                                <span>282.432 lượt xem</span>
                                <span>5.683 lượt thích</span>
                                <span>182 bình luận</span>
                            </div>
                        </div>
                    </div>


                </div>
            </section>

            <!-- Featured Articles Section -->
            <section id="articles" class="articles-section">
                <div class="section-header">
                    <h2>Bài viết nổi bật</h2>
                    <a href="articles.jsp" class="view-all">Xem tất cả ></a>
                </div>
                
                <div class="articles-scroll">
                    <article class="article-card" onclick="navigateTo('articlesDetail.jsp')">
                        <div class="article-image">
                            <img src="${pageContext.request.contextPath}/assets/images/art1.jpg" alt="Student Collection">
                        </div>
                        <div class="article-info">
                            <h3>Tổng hợp các sản phẩm của học viên tại E-Learning System </h3>
                            <div class="article-meta">
                                <span class="author">Sơn Đặng</span>
                                <span class="date">6 phút đọc</span>
                            </div>
                        </div>
                    </article>

                    <article class="article-card" onclick="navigateTo('articlesDetail.jsp')">
                        <div class="article-image">
                            <img src="${pageContext.request.contextPath}/assets/images/art2.jpg" alt="Webpack React">
                        </div>
                        <div class="article-info">
                            <h3>[Phần 1] Tạo dự án ReactJS với Webpack và Babel</h3>
                            <div class="article-meta">
                                <span class="author">Sơn Đặng</span>
                                <span class="date">12 phút đọc</span>
                            </div>
                        </div>
                    </article>

                    <article class="article-card" onclick="navigateTo('articlesDetail.jsp')">
                        <div class="article-image">
                            <img src="${pageContext.request.contextPath}/assets/images/art3.png" alt="GitHub Pages">
                        </div>
                        <div class="article-info">
                            <h3>Cách đưa code lên GitHub và tạo GitHub Pages</h3>
                            <div class="article-meta">
                                <span class="author">Vo Minh Kha</span>
                                <span class="date">4 phút đọc</span>
                            </div>
                        </div>
                    </article>

                    <article class="article-card" onclick="navigateTo('articlesDetail.jsp')">
                        <div class="article-image">
                            <img src="${pageContext.request.contextPath}/assets/images/art4.jpg" alt="F8 Experience">
                        </div>
                        <div class="article-info">
                            <h3>Kỳ sự ngày thứ 25 học ở E-Learning System </h3>
                            <div class="article-meta">
                                <span class="author">Sơn Sơn</span>
                                <span class="date">1 phút đọc</span>
                            </div>
                        </div>
                    </article>

                    
                </div>
            </section>
        </main>
    </div>


    <!-- Footer -->
    <jsp:include page="/common/footer.jsp" />

    <script src="${pageContext.request.contextPath}/assets/js/eduHome/eduHome.js?v=2.1"></script>
</body>
</html>