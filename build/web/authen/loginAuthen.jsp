<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Edu Platform</title>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/authen/loginAuthen.css">

<!-- JS -->
<script src="${pageContext.request.contextPath}/assets/js/authen/loginAuthen.js"></script>
</head>
<body>
    <div class="geometric-bg">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="auth-container">
        <div class="auth-header">
            <h1>Đăng nhập</h1>
            <p>Chào mừng bạn đến với hệ thống học tập</p>
        </div>

        <!-- Form Login -->
        <form action="${pageContext.request.contextPath}/login" method="post" class="auth-form">
            <div class="form-group">
                <input type="text" id="username" name="username" class="form-input" required placeholder=" " />
                <label for="username">Tên đăng nhập</label>
            </div>

            <div class="form-group">
                <input type="password" id="password" name="password" class="form-input" required placeholder=" " />
                <label for="password">Mật khẩu</label>
            </div>

            <div class="form-group remember-me">
                <input type="checkbox" id="rememberMe" name="rememberMe" />
                <label for="rememberMe">Ghi nhớ đăng nhập</label>
            </div>
            <div class="forgot-password">
                <a href="#" onclick="forgotPassword()">Quên mật khẩu?</a>
            </div>

            <button type="submit" class="btn-primary">Đăng nhập</button>
        </form>

        <div class="social-login">
            <h3>Hoặc đăng nhập bằng</h3>
            <div class="social-buttons">
                <button class="btn-social btn-google" onclick="loginWithGoogle()">Google</button>
                <button class="btn-social btn-facebook" onclick="loginWithFacebook()">Facebook</button>
            </div>
        </div>

        <div class="auth-links">
            <p>Bạn chưa có tài khoản? <a href="${pageContext.request.contextPath}/login/registerRole.jsp ">Đăng ký ngay</a></p>
        </div>
    </div>
</body>
</html>
