<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit User</title>
    <style>
        body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;margin:0;padding:40px;background:#f6f7f9;color:#222}
        .container{max-width:760px;margin:0 auto}
        .header{display:flex;justify-content:space-between;align-items:center;margin-bottom:16px}
        .btn{display:inline-block;padding:8px 14px;border:1px solid #ccc;background:#fff;color:#222;border-radius:6px;text-decoration:none;cursor:pointer}
        form{max-width:520px;background:#fff;border:1px solid #e5e7eb;border-radius:8px;padding:20px}
        .field{margin-bottom:12px}
        label{display:block;font-size:14px;margin-bottom:6px;color:#444}
        input[type=text],input[type=password],input[type=email],input[type=date],select{width:100%;padding:10px 12px;border:1px solid #cbd5e1;border-radius:6px}
    </style>
</head>
<body>
<div class="container">
<div class="header">
  <h2>Edit User</h2>
    <a href="./users" class="btn">Back to List</a>
</div>
<form action="./users?action=update" method="post">
    <input type="hidden" name="id" value="${user.id}">
    <div class="field"><label>Username</label><input type="text" name="username" value="${user.username}"></div>
    <div class="field"><label>Email</label><input type="email" name="email" value="${user.email}"></div>
    <div class="field"><label>Country</label><input type="text" name="country" value="${user.country}"></div>
    <div class="field"><label>Password</label><input type="password" name="password" value="${user.password}"></div>
    <div class="field"><label>Date of Birth</label><input type="date" name="dob" value="${user.dob}"></div>
    <div class="field">
        <label>Role</label>
        <select name="role">
            <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
            <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
        </select>
    </div>
    <div class="field">
        <label>Status</label>
        <select name="status">
            <option value="true" ${user.status ? 'selected' : ''}>Active</option>
            <option value="false" ${!user.status ? 'selected' : ''}>Inactive</option>
        </select>
    </div>
    <button type="submit" class="btn">Update</button>
    <a href="./users" class="btn">Cancel</a>
</form>
</div>
</body>
</html>
