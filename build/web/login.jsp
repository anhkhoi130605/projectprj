<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <style>
        body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;margin:0;padding:40px;background:#f6f7f9;color:#222}
        .container{max-width:760px;margin:0 auto}
        .header{display:flex;justify-content:space-between;align-items:center;margin-bottom:16px}
        .btn{display:inline-block;padding:8px 14px;border:1px solid #ccc;background:#fff;color:#222;border-radius:6px;text-decoration:none;cursor:pointer}
        .btn.primary{background:#0d6efd;border-color:#0d6efd;color:#fff}
        form{max-width:420px;background:#fff;border:1px solid #e5e7eb;border-radius:8px;padding:20px}
        .field{margin-bottom:12px}
        label{display:block;font-size:14px;margin-bottom:6px;color:#444}
        input[type=text],input[type=password]{width:100%;padding:10px 12px;border:1px solid #cbd5e1;border-radius:6px}
        .error{color:#b42318;margin-top:10px}
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>Login</h2>
        <a href="./welcome.jsp" class="btn">Back</a>
    </div>
    <form action="login" method="post">
        <div class="field">
            <label>Username or Email</label>
            <input type="text" name="usernameOrEmail" required>
        </div>
        <div class="field">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>
        <div class="field">
            <label><input type="checkbox" name="remember"> Remember Me</label>
        </div>
        <button type="submit" class="btn primary">Login</button>
        <a href="welcome.jsp" class="btn">Cancel</a>
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>
    </form>
</div>
</body>
</html>
