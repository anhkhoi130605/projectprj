<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Báo cáo Tài chính - InstructorsHome</title>
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
            <a href="FinanceReport.jsp" class="nav-item active">
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
            <!-- Wallet Information -->
            <section class="section">
                <h2><i class="fas fa-wallet"></i> Thông tin Ví</h2>
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3><i class="fas fa-dollar-sign"></i> Số dư hiện tại</h3>
                        <div class="stat-number">$2,450.00</div>
                        <div class="stat-description">Số tiền có thể rút</div>
                    </div>
                    <div class="stat-card">
                        <h3><i class="fas fa-chart-line"></i> Thu nhập tháng này</h3>
                        <div class="stat-number">$1,250.00</div>
                        <div class="stat-description">Tăng 15% so với tháng trước</div>
                    </div>
                    <div class="stat-card">
                        <h3><i class="fas fa-calendar"></i> Lần rút cuối</h3>
                        <div class="stat-number">$500.00</div>
                        <div class="stat-description">Ngày 01/12/2024</div>
                    </div>
                </div>
            </section>

            <!-- Bank Information -->
            <section class="section">
                <h2><i class="fas fa-university"></i> Thông tin Ngân hàng</h2>
                <div class="card">
                    <div class="card-header">
                        Thông tin tài khoản ngân hàng
                    </div>
                    <div class="card-body">
                        <div class="stats-grid">
                            <div class="stat-card">
                                <h4>Tên ngân hàng</h4>
                                <p style="font-size: 1.2rem; font-weight: 600; color: var(--primary-color);">Vietcombank</p>
                            </div>
                            <div class="stat-card">
                                <h4>Số tài khoản</h4>
                                <p style="font-size: 1.2rem; font-weight: 600; color: var(--primary-color);">1234567890</p>
                            </div>
                            <div class="stat-card">
                                <h4>Chủ tài khoản</h4>
                                <p style="font-size: 1.2rem; font-weight: 600; color: var(--primary-color);">Nguyễn Văn A</p>
                            </div>
                        </div>
                        <div style="margin-top: 20px;">
                            <button class="btn btn-primary" onclick="showBankForm()">
                                <i class="fas fa-edit"></i> Cập nhật thông tin ngân hàng
                            </button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Income Report -->
            <section class="section">
                <h2><i class="fas fa-chart-bar"></i> Báo cáo Thu nhập</h2>
                <div class="card">
                    <div class="card-header">
                        Doanh thu theo khóa học
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Tên khóa học</th>
                                        <th>Số lượng bán</th>
                                        <th>Giá bán</th>
                                        <th>Tổng thu nhập</th>
                                        <th>Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div>
                                                <div style="font-weight: 600;">React.js Cơ bản</div>
                                                <div style="font-size: 12px; color: var(--text-muted);">Khóa học lập trình</div>
                                            </div>
                                        </td>
                                        <td><strong>45</strong></td>
                                        <td>$29.99</td>
                                        <td><strong style="color: var(--accent-color);">$1,349.55</strong></td>
                                        <td>Tháng 12/2024</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <div style="font-weight: 600;">Python Advanced</div>
                                                <div style="font-size: 12px; color: var(--text-muted);">Khóa học lập trình</div>
                                            </div>
                                        </td>
                                        <td><strong>23</strong></td>
                                        <td>$49.99</td>
                                        <td><strong style="color: var(--accent-color);">$1,149.77</strong></td>
                                        <td>Tháng 12/2024</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <div style="font-weight: 600;">JavaScript ES6+</div>
                                                <div style="font-size: 12px; color: var(--text-muted);">Khóa học lập trình</div>
                                            </div>
                                        </td>
                                        <td><strong>38</strong></td>
                                        <td>$39.99</td>
                                        <td><strong style="color: var(--accent-color);">$1,519.62</strong></td>
                                        <td>Tháng 11/2024</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <div style="font-weight: 600;">HTML/CSS Master</div>
                                                <div style="font-size: 12px; color: var(--text-muted);">Khóa học lập trình</div>
                                            </div>
                                        </td>
                                        <td><strong>67</strong></td>
                                        <td>$19.99</td>
                                        <td><strong style="color: var(--accent-color);">$1,339.33</strong></td>
                                        <td>Tháng 11/2024</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Transaction History -->
            <section class="section">
                <h2><i class="fas fa-history"></i> Lịch sử Giao dịch</h2>
                <div class="card">
                    <div class="card-header">
                        Lịch sử rút tiền và nhận thanh toán
                    </div>
                    <div class="card-body">
                        <div class="activity-list">
                            <div class="activity-item">
                                <div class="activity-icon" style="background-color: #dc3545;">
                                    <i class="fas fa-arrow-up"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Rút tiền: $500.00</h4>
                                    <p>01/12/2024 • Vietcombank - 1234567890 • Trạng thái: Thành công</p>
                                </div>
                                <div style="color: #dc3545; font-weight: 600; font-size: 1.2rem;">
                                    -$500.00
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon" style="background-color: #28a745;">
                                    <i class="fas fa-arrow-down"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Nhận thanh toán: $1,250.00</h4>
                                    <p>15/12/2024 • Từ khóa học React.js • Trạng thái: Đã nhận</p>
                                </div>
                                <div style="color: #28a745; font-weight: 600; font-size: 1.2rem;">
                                    +$1,250.00
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon" style="background-color: #28a745;">
                                    <i class="fas fa-arrow-down"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Nhận thanh toán: $800.00</h4>
                                    <p>10/12/2024 • Từ khóa học Python • Trạng thái: Đã nhận</p>
                                </div>
                                <div style="color: #28a745; font-weight: 600; font-size: 1.2rem;">
                                    +$800.00
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon" style="background-color: #dc3545;">
                                    <i class="fas fa-arrow-up"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Rút tiền: $300.00</h4>
                                    <p>25/11/2024 • Vietcombank - 1234567890 • Trạng thái: Thành công</p>
                                </div>
                                <div style="color: #dc3545; font-weight: 600; font-size: 1.2rem;">
                                    -$300.00
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon" style="background-color: #28a745;">
                                    <i class="fas fa-arrow-down"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Nhận thanh toán: $1,200.00</h4>
                                    <p>01/11/2024 • Từ khóa học JavaScript • Trạng thái: Đã nhận</p>
                                </div>
                                <div style="color: #28a745; font-weight: 600; font-size: 1.2rem;">
                                    +$1,200.00
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Withdraw Money Section -->
            <section class="section">
                <h2><i class="fas fa-money-bill-wave"></i> Rút tiền</h2>
                <div class="card">
                    <div class="card-header">
                        Rút tiền từ ví
                    </div>
                    <div class="card-body">
                        <div class="stats-grid">
                            <div class="stat-card">
                                <h4>Số tiền có thể rút</h4>
                                <div class="stat-number">$2,450.00</div>
                                <p style="color: var(--text-muted);">Số dư hiện tại trong ví</p>
                            </div>
                            <div class="stat-card">
                                <h4>Số tiền tối thiểu</h4>
                                <div class="stat-number">$50.00</div>
                                <p style="color: var(--text-muted);">Số tiền tối thiểu để rút</p>
                            </div>
                        </div>
                        
                        <form style="margin-top: 20px;">
                            <div class="form-group">
                                <label for="withdrawAmount">Số tiền muốn rút ($) *</label>
                                <input type="number" id="withdrawAmount" class="form-control" placeholder="0.00" step="0.01" min="50" max="2450" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="withdrawNote">Ghi chú (tùy chọn)</label>
                                <textarea id="withdrawNote" class="form-control" rows="3" placeholder="Nhập ghi chú cho giao dịch rút tiền"></textarea>
                            </div>
                            
                            <div style="display: flex; gap: 10px; margin-top: 20px;">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-money-bill-wave"></i> Rút tiền
                                </button>
                                <button type="button" class="btn btn-secondary">
                                    <i class="fas fa-history"></i> Xem lịch sử rút tiền
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>

            <!-- Bank Information Form Modal -->
            <div id="bankFormModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); z-index: 1000;">
                <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: var(--bg-card); padding: 30px; border-radius: 8px; width: 90%; max-width: 500px;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                        <h3><i class="fas fa-university"></i> Cập nhật thông tin ngân hàng</h3>
                        <button onclick="hideBankForm()" style="background: none; border: none; font-size: 24px; cursor: pointer;">&times;</button>
                    </div>
                    
                    <form>
                        <div class="form-group">
                            <label for="bankName">Tên ngân hàng *</label>
                            <select id="bankName" class="form-control" required>
                                <option value="">Chọn ngân hàng</option>
                                <option value="Vietcombank">Vietcombank</option>
                                <option value="BIDV">BIDV</option>
                                <option value="VietinBank">VietinBank</option>
                                <option value="Agribank">Agribank</option>
                                <option value="Techcombank">Techcombank</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="bankAccount">Số tài khoản *</label>
                            <input type="text" id="bankAccount" class="form-control" placeholder="Nhập số tài khoản" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="accountHolder">Chủ tài khoản *</label>
                            <input type="text" id="accountHolder" class="form-control" placeholder="Nhập tên chủ tài khoản" required>
                        </div>
                        
                        <div style="display: flex; gap: 10px; justify-content: flex-end; margin-top: 20px;">
                            <button type="button" class="btn btn-secondary" onclick="hideBankForm()">Hủy</button>
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/instructorsHome.js"></script>
    <script>
        function showBankForm() {
            document.getElementById('bankFormModal').style.display = 'block';
        }
        
        function hideBankForm() {
            document.getElementById('bankFormModal').style.display = 'none';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('bankFormModal');
            if (event.target === modal) {
                hideBankForm();
            }
        }
    </script>
    </body>
</html>