<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>User List</title>
    <style>
        body {
            font-family: "Segoe UI", Roboto, sans-serif;
            margin: 0;
            padding: 40px;
            background: #f6f7f9;
            color: #222;
        }
        .container {
            max-width: 980px;
            margin: 0 auto;
        }
        h2 {
            color: #0d6efd;
            margin-bottom: 16px;
        }
        .bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
            flex-wrap: wrap;
            gap: 12px;
        }
        .bar form {
            display: flex;
            gap: 8px;
        }
        .btn {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .btn.primary {background:#0d6efd;color:#fff;border:none;}
        .btn.primary:hover {background:#0b5ed7;}
        .btn.danger {background:#dc3545;color:#fff;border:none;}
        .btn.danger:hover {background:#bb2d3b;}
        .btn.back {background:#fff;color:black;border:1px solid #ccc;}
       
        .btn.default {background:#fff;color:#222;border:1px solid #ccc;}
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px 12px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
            font-size: 14px;
        }
        thead th {
            background: #f1f5f9;
            color: #334155;
            font-weight: 600;
        }
        .table-actions a,
        .table-actions form {
            display: inline-block;
            margin-right: 8px;
        }
        input[type=text] {
            padding: 8px 10px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="bar">
        <h2>👤 User List</h2>
        <form action="./search" method="get">
            <input type="text" name="keyword" value="${param.keyword}" placeholder="Search username or email" style="width:260px;"/>
            <button type="submit" class="btn primary">Search</button>
        </form>
        <div style="display:flex;gap:8px;flex-wrap:wrap;">
            <a href="welcome.jsp" class="btn back">🔙 Back</a>
            <a href="./login?action=logout" class="btn default">Logout</a>
            <a href="./user/createUser.jsp" class="btn primary">Create New User</a>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> list = (List<User>) request.getAttribute("listUser");
            if (list != null && !list.isEmpty()) {
                for (User u : list) {
        %>
        <tr>
            <td><%=u.getId()%></td>
            <td><%=u.getUsername()%></td>
            <td><%=u.getEmail()%></td>
            <td><%=u.getRole()%></td>
            <td><%=u.isStatus()?"Active":"Inactive"%></td>
            <td class="table-actions">
                <a class="btn default" href="users?action=edit&id=<%=u.getId()%>">Edit</a>
                <form action="users" method="post" onsubmit="return confirm('Are you sure to delete?')">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="<%=u.getId()%>"/>
                    <button type="submit" class="btn danger">Delete</button>
                </form>
            </td>
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="6" style="text-align:center;color:#777;">No users found</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
