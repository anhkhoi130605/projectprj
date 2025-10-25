<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Bài tập - InstructorsHome</title>
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
            <a href="CourseManagement.jsp" class="nav-item">
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
            <a href="AssignmentDetails.jsp" class="nav-item active">
                <i class="fas fa-tasks"></i> Bài tập
            </a>
        </nav>

        <main class="content-area">
            <!-- Assignment Info -->
            <section class="section">
                <h2><i class="fas fa-tasks"></i> Quản lý Bài tập</h2>
                <div class="card">
                    <div class="card-header">
                        <h3>Assignment: Tạo Component đầu tiên</h3>
                        <p style="margin: 5px 0; color: var(--text-muted);">Khóa học: React.js Cơ bản | Tổng số câu hỏi: 5</p>
                    </div>
                </div>
            </section>

            <!-- Tab Navigation -->
            <section class="section">
                <div style="display: flex; gap: 10px; margin-bottom: 20px;">
                    <button class="btn btn-primary" id="questionsTab" onclick="showTab('questions')">
                        <i class="fas fa-question"></i> Quản lý Câu hỏi
                    </button>
                    <button class="btn btn-secondary" id="submissionsTab" onclick="showTab('submissions')">
                        <i class="fas fa-file-alt"></i> Bài nộp Học viên
                    </button>
                </div>
            </section>

            <!-- Questions Management Tab -->
            <div id="questionsContent">
                <section class="section">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                        <h3><i class="fas fa-question"></i> Quản lý Câu hỏi Trắc nghiệm</h3>
                        <button class="btn btn-primary" onclick="showQuestionForm()">
                            <i class="fas fa-plus"></i> Thêm câu hỏi mới
                        </button>
                    </div>

                    <!-- Question 1 -->
                    <div class="card" style="margin-bottom: 15px;">
                        <div class="card-header">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <h4>Câu hỏi 1: React là gì?</h4>
                                <div style="display: flex; gap: 10px;">
                                    <button class="btn btn-primary" style="padding: 5px 10px; font-size: 12px;">
                                        <i class="fas fa-edit"></i> Sửa
                                    </button>
                                    <button class="btn btn-danger" style="padding: 5px 10px; font-size: 12px;">
                                        <i class="fas fa-trash"></i> Xóa
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p style="margin-bottom: 15px; font-weight: 600;">React là một thư viện JavaScript được phát triển bởi Facebook để xây dựng giao diện người dùng.</p>
                            
                            <h5 style="margin-bottom: 10px;">Các lựa chọn:</h5>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" checked disabled> 
                                    <span style="color: var(--accent-color); font-weight: 600;">A. Một thư viện JavaScript (Đúng)</span>
                                </label>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" disabled> 
                                    <span>B. Một framework JavaScript</span>
                                </label>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" disabled> 
                                    <span>C. Một ngôn ngữ lập trình</span>
                                </label>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" disabled> 
                                    <span>D. Một database</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Question 2 -->
                    <div class="card" style="margin-bottom: 15px;">
                        <div class="card-header">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <h4>Câu hỏi 2: JSX là gì?</h4>
                                <div style="display: flex; gap: 10px;">
                                    <button class="btn btn-primary" style="padding: 5px 10px; font-size: 12px;">
                                        <i class="fas fa-edit"></i> Sửa
                                    </button>
                                    <button class="btn btn-danger" style="padding: 5px 10px; font-size: 12px;">
                                        <i class="fas fa-trash"></i> Xóa
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <p style="margin-bottom: 15px; font-weight: 600;">JSX là một extension syntax cho JavaScript.</p>
                            
                            <h5 style="margin-bottom: 10px;">Các lựa chọn:</h5>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" disabled> 
                                    <span>A. Một ngôn ngữ lập trình mới</span>
                                </label>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" checked disabled> 
                                    <span style="color: var(--accent-color); font-weight: 600;">B. Extension syntax cho JavaScript (Đúng)</span>
                                </label>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" disabled> 
                                    <span>C. Một framework</span>
                                </label>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <label style="display: flex; align-items: center; gap: 10px;">
                                    <input type="checkbox" disabled> 
                                    <span>D. Một thư viện</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <!-- Submissions Tab -->
            <div id="submissionsContent" style="display: none;">
                <section class="section">
                    <h3><i class="fas fa-file-alt"></i> Danh sách Bài nộp của Học viên</h3>
                    
                    <div class="card">
                        <div class="card-header">
                            Tất cả bài nộp
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Học viên</th>
                                            <th>Ngày nộp</th>
                                            <th>Trạng thái</th>
                                            <th>Điểm</th>
                                            <th>Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div style="display: flex; align-items: center; gap: 10px;">
                                                    <div style="width: 40px; height: 40px; background-color: var(--primary-color); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold;">
                                                        NV
                                                    </div>
                                                    <div>
                                                        <div style="font-weight: 600;">Nguyễn Văn A</div>
                                                        <div style="font-size: 12px; color: var(--text-muted);">nguyenvana@email.com</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>15/12/2024 14:30</td>
                                            <td><span class="btn btn-success" style="padding: 3px 8px; font-size: 11px;">Đã nộp</span></td>
                                            <td><strong>8/10</strong></td>
                                            <td>
                                                <button class="btn btn-primary" style="padding: 5px 10px; font-size: 12px;">
                                                    <i class="fas fa-eye"></i> Xem chi tiết
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="display: flex; align-items: center; gap: 10px;">
                                                    <div style="width: 40px; height: 40px; background-color: var(--accent-color); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold;">
                                                        TB
                                                    </div>
                                                    <div>
                                                        <div style="font-weight: 600;">Trần Thị B</div>
                                                        <div style="font-size: 12px; color: var(--text-muted);">tranthib@email.com</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>14/12/2024 16:45</td>
                                            <td><span class="btn btn-success" style="padding: 3px 8px; font-size: 11px;">Đã nộp</span></td>
                                            <td><strong>9/10</strong></td>
                                            <td>
                                                <button class="btn btn-primary" style="padding: 5px 10px; font-size: 12px;">
                                                    <i class="fas fa-eye"></i> Xem chi tiết
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="display: flex; align-items: center; gap: 10px;">
                                                    <div style="width: 40px; height: 40px; background-color: #ffc107; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #000; font-weight: bold;">
                                                        LC
                                                    </div>
                                                    <div>
                                                        <div style="font-weight: 600;">Lê Văn C</div>
                                                        <div style="font-size: 12px; color: var(--text-muted);">levanc@email.com</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>13/12/2024 10:20</td>
                                            <td><span class="btn btn-warning" style="padding: 3px 8px; font-size: 11px; background-color: #ffc107; color: #000;">Chưa nộp</span></td>
                                            <td><span style="color: var(--text-muted);">-</span></td>
                                            <td>
                                                <button class="btn btn-secondary" style="padding: 5px 10px; font-size: 12px;" disabled>
                                                    <i class="fas fa-eye"></i> Xem chi tiết
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <!-- Add Question Form Modal -->
            <div id="questionFormModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); z-index: 1000;">
                <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: var(--bg-card); padding: 30px; border-radius: 8px; width: 90%; max-width: 700px; max-height: 80vh; overflow-y: auto;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                        <h3><i class="fas fa-plus"></i> Thêm câu hỏi mới</h3>
                        <button onclick="hideQuestionForm()" style="background: none; border: none; font-size: 24px; cursor: pointer;">&times;</button>
                    </div>
                    
                    <form>
                        <div class="form-group">
                            <label for="questionTitle">Tiêu đề câu hỏi *</label>
                            <input type="text" id="questionTitle" class="form-control" placeholder="Nhập tiêu đề câu hỏi" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="questionDescription">Mô tả câu hỏi *</label>
                            <textarea id="questionDescription" class="form-control" rows="3" placeholder="Nhập nội dung câu hỏi" required></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label>Các lựa chọn trả lời *</label>
                            <div style="margin-bottom: 10px;">
                                <div style="display: flex; gap: 10px; align-items: center;">
                                    <input type="text" class="form-control" placeholder="Lựa chọn A" required>
                                    <label style="display: flex; align-items: center; gap: 5px; white-space: nowrap;">
                                        <input type="checkbox"> Đúng
                                    </label>
                                </div>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <div style="display: flex; gap: 10px; align-items: center;">
                                    <input type="text" class="form-control" placeholder="Lựa chọn B" required>
                                    <label style="display: flex; align-items: center; gap: 5px; white-space: nowrap;">
                                        <input type="checkbox"> Đúng
                                    </label>
                                </div>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <div style="display: flex; gap: 10px; align-items: center;">
                                    <input type="text" class="form-control" placeholder="Lựa chọn C" required>
                                    <label style="display: flex; align-items: center; gap: 5px; white-space: nowrap;">
                                        <input type="checkbox"> Đúng
                                    </label>
                                </div>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <div style="display: flex; gap: 10px; align-items: center;">
                                    <input type="text" class="form-control" placeholder="Lựa chọn D" required>
                                    <label style="display: flex; align-items: center; gap: 5px; white-space: nowrap;">
                                        <input type="checkbox"> Đúng
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <div style="display: flex; gap: 10px; justify-content: flex-end; margin-top: 20px;">
                            <button type="button" class="btn btn-secondary" onclick="hideQuestionForm()">Hủy</button>
                            <button type="submit" class="btn btn-primary">Tạo câu hỏi</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/instructorsHome.js"></script>
    <script>
        function showTab(tabName) {
            // Hide all content
            document.getElementById('questionsContent').style.display = 'none';
            document.getElementById('submissionsContent').style.display = 'none';
            
            // Remove active class from all tabs
            document.getElementById('questionsTab').className = 'btn btn-secondary';
            document.getElementById('submissionsTab').className = 'btn btn-secondary';
            
            // Show selected content
            if (tabName === 'questions') {
                document.getElementById('questionsContent').style.display = 'block';
                document.getElementById('questionsTab').className = 'btn btn-primary';
            } else if (tabName === 'submissions') {
                document.getElementById('submissionsContent').style.display = 'block';
                document.getElementById('submissionsTab').className = 'btn btn-primary';
            }
        }
        
        function showQuestionForm() {
            document.getElementById('questionFormModal').style.display = 'block';
        }
        
        function hideQuestionForm() {
            document.getElementById('questionFormModal').style.display = 'none';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('questionFormModal');
            if (event.target === modal) {
                hideQuestionForm();
            }
        }
    </script>
    </body>
</html>