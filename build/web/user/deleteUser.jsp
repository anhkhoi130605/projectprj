<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>Delete User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body class="container mt-5">
<div class="d-flex justify-content-between align-items-center mb-3">
  <h2>Delete User</h2>
  <a href="./users" class="btn btn-secondary">Back to List</a>
</div>
<%
    User user = (User) request.getAttribute("user");
    if (user != null) {
%>
<div class="alert alert-warning">Are you sure you want to delete this user?</div>
<table class="table table-bordered w-50">
  <tr><th>ID</th><td><%=user.getId()%></td></tr>
  <tr><th>Username</th><td><%=user.getUsername()%></td></tr>
  <tr><th>Email</th><td><%=user.getEmail()%></td></tr>
  <tr><th>Role</th><td><%=user.getRole()%></td></tr>
  <tr><th>Status</th><td><%=user.isStatus()?"Active":"Inactive"%></td></tr>
</table>
<form action="./users" method="post" class="mt-3" onsubmit="return confirm('Confirm delete?')">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" value="<%=user.getId()%>"/>
    <button type="submit" class="btn btn-danger">Confirm Delete</button>
    <a href="./users" class="btn btn-outline-secondary ms-2">Cancel</a>
</form>
<% } %>
</body>
</html>
