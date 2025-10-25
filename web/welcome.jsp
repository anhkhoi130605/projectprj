<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            font-family: "Segoe UI", Roboto, sans-serif;
            margin: 0;
            padding: 40px;
            background: #f0f2f5;
            color: #222;
        }
        .container {max-width: 720px;margin: 0 auto;}
        .card {background:#fff;border-radius:10px;box-shadow:0 4px 12px rgba(0,0,0,0.1);padding:30px;margin-top:30px;}
        h2 {margin-bottom: 8px;color: #0d6efd;}
        .badge {padding: 4px 10px;border-radius: 50px;background: #e9ecef;color: #444;font-size: 13px;}
        .btn {display:inline-block;padding:10px 18px;border:none;border-radius:6px;text-decoration:none;cursor:pointer;font-size:14px;transition:background 0.2s;}
        .btn.primary {background:#0d6efd;color:#fff}
        .btn.primary:hover{background:#0b5ed7}
        .btn.danger{background:#dc3545;color:#fff}
        .btn.danger:hover{background:#bb2d3b}
        .btn.neutral{background:#6c757d;color:#fff}
        .btn.neutral:hover{background:#565e64}
        .row{display:flex;gap:10px;margin:20px 0}
        form {margin-top: 20px}
        .grid{display:grid;grid-template-columns:repeat(2,1fr);gap:16px}
        .field{display:flex;flex-direction:column}
        label{margin-bottom:6px;font-weight:500;color:#333;font-size:14px}
        input, select {padding:10px 12px;border:1px solid #d0d7de;border-radius:6px;font-size:14px;}
        button[type=submit] {margin-top:16px;width:100%;background:#0d6efd;color:#fff;border:none;border-radius:6px;padding:12px;font-size:15px;cursor:pointer;transition:background 0.2s;}
        button[type=submit]:hover{background:#0b5ed7}
        .alert {padding:12px 16px;border-radius:6px;margin-bottom:20px;}
        .alert.warning {background:#fff3cd;color:#664d03;border:1px solid #ffeeba;}
    </style>
</head>
<body>
<div class="container">
    <c:choose>
        <c:when test="${empty sessionScope.loggedUser}">
            <div class="card">
                <h1>Chào mừng đã tới với PAGE</h1>
                <div class="alert warning">Bạn chưa đăng nhập.</div>
                <a href="login.jsp" class="btn primary">Đi tới đăng nhập</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="card">
                <h2>Welcome, ${sessionScope.loggedUser.username}!</h2>
                <p>Your role: <span class="badge">${sessionScope.loggedUser.role}</span></p>

                <div class="row">
                    <a href="search" class="btn neutral">Search User</a>
                    <c:if test="${fn:toLowerCase(sessionScope.loggedUser.role) eq 'admin'}">
                        <a href="users" class="btn primary">Manage Users</a>
                        <a href="products" class="btn primary">Manage Products</a>
                    </c:if>
                    <a href="login?action=logout" class="btn danger">Logout</a>
                </div>

                <hr style="margin:24px 0"/>

                <h3 style="margin-bottom:16px;color:#333">Cập nhật thông tin cá nhân</h3>
                <form action="users" method="post">
                    <input type="hidden" name="action" value="update"/>
                    <input type="hidden" name="id" value="${sessionScope.loggedUser.id}"/>

                    <div class="grid">
                        <div class="field">
                            <label>Username</label>
                            <input name="username" value="${sessionScope.loggedUser.username}" required/>
                        </div>
                        <div class="field">
                            <label>Email</label>
                            <input type="email" name="email" value="${sessionScope.loggedUser.email}" required/>
                        </div>
                        <div class="field">
                            <label>Country</label>
                            <input name="country" value="${sessionScope.loggedUser.country}"/>
                        </div>
                        <div class="field">
                            <label>Password</label>
                            <input type="password" name="password" value="${sessionScope.loggedUser.password}" required/>
                        </div>
                        <div class="field">
                            <label>Date of Birth</label>
                            <input type="date" name="dob" value="${sessionScope.loggedUser.dob}"/>
                        </div>
                    </div>

                    <c:if test="${fn:toLowerCase(sessionScope.loggedUser.role) eq 'admin'}">
                        <div class="grid" style="margin-top:16px">
                            <div class="field">
                                <label>Role</label>
                                <select name="role">
                                    <option value="user" ${sessionScope.loggedUser.role == 'user' ? 'selected' : ''}>user</option>
                                    <option value="admin" ${sessionScope.loggedUser.role == 'admin' ? 'selected' : ''}>admin</option>
                                </select>
                            </div>
                            <div class="field">
                                <label>Status</label>
                                <select name="status">
                                    <option value="true" ${sessionScope.loggedUser.status ? 'selected' : ''}>Active</option>
                                    <option value="false" ${!sessionScope.loggedUser.status ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>
                        </div>
                    </c:if>

                    <button type="submit">💾 Save changes</button>
                </form>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
