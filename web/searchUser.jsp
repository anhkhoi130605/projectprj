<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search User</title>
    <style>
        body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;margin:0;padding:40px;background:#f6f7f9;color:#222}
        .container{max-width:980px;margin:0 auto}
        .bar{display:flex;justify-content:space-between;align-items:center;margin-bottom:16px}
        .btn{display:inline-block;padding:8px 14px;border:1px solid #ccc;background:#fff;color:#222;border-radius:6px;text-decoration:none;cursor:pointer}
        table{width:100%;border-collapse:collapse;background:#fff;border:1px solid #e5e7eb}
        th,td{padding:10px 12px;border-bottom:1px solid #e5e7eb;text-align:left}
        thead th{background:#f1f5f9;color:#334155}
        input[type=text]{padding:8px 10px;border:1px solid #cbd5e1;border-radius:6px}
        .info{padding:10px 12px;border:1px solid #bcd0f7;background:#e9f0ff;border-radius:6px}
    </style>
</head>
<body>
<div class="container">
<div class="bar">
  <h2>Search User</h2>
  <a href="./users" class="btn">Back</a>
</div>

<form action="./search" method="get" style="display:flex;gap:8px;margin-bottom:12px">
    <input type="text" name="keyword" value="${keyword}" style="max-width:320px" placeholder="Enter keyword">
    <button type="submit" class="btn">Search</button>
</form>

<c:choose>
  <c:when test="${empty searchResult}">
    <div class="info">No users found.</div>
  </c:when>
  <c:otherwise>
    <table>
      <thead>
      <tr>
        <th>ID</th><th>Username</th><th>Email</th><th>Role</th><th>Status</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="u" items="${searchResult}">
        <tr>
          <td>${u.id}</td>
          <td>${u.username}</td>
          <td>${u.email}</td>
          <td>${u.role}</td>
          <td><c:choose><c:when test="${u.status}">Active</c:when><c:otherwise>Inactive</c:otherwise></c:choose></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:otherwise>
</c:choose>
</div>
</body>
</html>
