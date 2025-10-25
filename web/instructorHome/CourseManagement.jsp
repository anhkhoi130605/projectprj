<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Khóa học - InstructorsHome</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/instructorsHome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

        <nav class="sidebar">
            <a href="InstructorDashboard.jsp" class="nav-item">
                <i class="fas fa-home"></i> Trang chủ
            </a>
            <a href="CourseManagement.jsp" class="nav-item active">
                <i class="fas fa-laptop-code"></i> Khóa học
            </a>
            <a href="FinanceReport.jsp" class="nav-item">
                <i class="fas fa-chart-line"></i> Báo cáo
            </a>
            <a href="ArticleManage.jsp" class="nav-item">
                <i class="fas fa-blog"></i> Bài viết
            </a>
            <a href="CourseContentManager.jsp" class="nav-item">
                <i class="fas fa-video"></i> Nội dung
            </a>
            <a href="AssignmentDetails.jsp" class="nav-item">
                <i class="fas fa-tasks"></i> Bài tập
            </a>
        </nav>

        <main class="content-area">
            <section class="section">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <h2><i class="fas fa-laptop-code"></i> Quản lý Khóa học</h2>
                    <button class="btn btn-primary" onclick="showCourseForm()">
                        <i class="fas fa-plus"></i> Tạo khóa học mới
                    </button>
                </div>
            </section>

            <section class="section">
                <h3><i class="fas fa-list"></i> Danh sách Khóa học</h3>
                <div class="card">
                    <div class="card-header">
                        Tất cả khóa học của bạn
                    </div>
                    <div class="card-body">
                        <div class="stats-grid">
                            <div class="stat-card">
                                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 15px;">
                                    <div>
                                        <h4>React.js Cơ bản</h4>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Cấp độ: Beginner</p>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Giá: $29.99</p>
                                    </div>
                                    <span class="btn btn-success" style="padding: 5px 10px; font-size: 12px;">Published</span>
                                </div>
                                <div style="display: flex; gap: 10px; margin-top: 15px;">
                                    <button class="btn btn-primary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-edit"></i> Chỉnh sửa
                                    </button>
                                    <button class="btn btn-secondary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-eye"></i> Xem nội dung
                                    </button>
                                </div>
                            </div>

                            <div class="stat-card">
                                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 15px;">
                                    <div>
                                        <h4>Python Advanced</h4>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Cấp độ: Advanced</p>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Giá: $49.99</p>
                                    </div>
                                    <span class="btn btn-warning" style="padding: 5px 10px; font-size: 12px; background-color: #ffc107; color: #000;">Draft</span>
                                </div>
                                <div style="display: flex; gap: 10px; margin-top: 15px;">
                                    <button class="btn btn-primary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-edit"></i> Chỉnh sửa
                                    </button>
                                    <button class="btn btn-secondary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-eye"></i> Xem nội dung
                                    </button>
                                </div>
                            </div>

                            <div class="stat-card">
                                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 15px;">
                                    <div>
                                        <h4>JavaScript ES6+</h4>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Cấp độ: Intermediate</p>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Giá: $39.99</p>
                                    </div>
                                    <span class="btn btn-info" style="padding: 5px 10px; font-size: 12px; background-color: #17a2b8; color: white;">Pending Review</span>
                                </div>
                                <div style="display: flex; gap: 10px; margin-top: 15px;">
                                    <button class="btn btn-primary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-edit"></i> Chỉnh sửa
                                    </button>
                                    <button class="btn btn-secondary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-eye"></i> Xem nội dung
                                    </button>
                                </div>
                            </div>

                            <div class="stat-card">
                                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 15px;">
                                    <div>
                                        <h4>HTML/CSS Master</h4>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Cấp độ: Beginner</p>
                                        <p style="color: var(--text-muted); margin: 5px 0;">Giá: $19.99</p>
                                    </div>
                                    <span class="btn btn-success" style="padding: 5px 10px; font-size: 12px;">Published</span>
                                </div>
                                <div style="display: flex; gap: 10px; margin-top: 15px;">
                                    <button class="btn btn-primary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-edit"></i> Chỉnh sửa
                                    </button>
                                    <button class="btn btn-secondary" style="padding: 8px 15px; font-size: 12px;">
                                        <i class="fas fa-eye"></i> Xem nội dung
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div id="courseFormModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); z-index: 1000;">
                <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: var(--bg-card); padding: 30px; border-radius: 8px; width: 90%; max-width: 600px; max-height: 80vh; overflow-y: auto;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                        <h3><i class="fas fa-plus"></i> Tạo khóa học mới</h3>
                        <button onclick="hideCourseForm()" style="background: none; border: none; font-size: 24px; cursor: pointer;">&times;</button>
                    </div>
                    
                    <form>
                        <div class="form-group">
                            <label for="courseName">Tên khóa học *</label>
                            <input type="text" id="courseName" class="form-control" placeholder="Nhập tên khóa học" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="courseDescription">Mô tả khóa học *</label>
                            <textarea id="courseDescription" class="form-control" rows="4" placeholder="Mô tả chi tiết về khóa học" required></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label for="coursePrice">Giá khóa học ($) *</label>
                            <input type="number" id="coursePrice" class="form-control" placeholder="0.00" step="0.01" min="0" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="courseLevel">Cấp độ *</label>
                            <select id="courseLevel" class="form-control" required>
                                <option value="">Chọn cấp độ</option>
                                <option value="Beginner">Beginner</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="courseImage">Ảnh bìa khóa học</label>
                            <input type="file" id="courseImage" class="form-control" accept="image/*">
                        </div>
                        
                        <div class="form-group">
                            <label for="courseStatus">Trạng thái</label>
                            <select id="courseStatus" class="form-control">
                                <option value="Draft">Draft</option>
                                <option value="Published">Published</option>
                                <option value="Pending Review">Pending Review</option>
                            </select>
                        </div>
                        
                        <div style="display: flex; gap: 10px; justify-content: flex-end; margin-top: 20px;">
                            <button type="button" class="btn btn-secondary" onclick="hideCourseForm()">Hủy</button>
                            <button type="submit" class="btn btn-primary">Tạo khóa học</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/instructorsHome.js"></script>
    <script>
        function showCourseForm() {
            document.getElementById('courseFormModal').style.display = 'block';
        }
        
        function hideCourseForm() {
            document.getElementById('courseFormModal').style.display = 'none';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('courseFormModal');
            if (event.target === modal) {
                hideCourseForm();
            }
        }
    </script>
    </body>
</html>