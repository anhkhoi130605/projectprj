<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        body { font-family: "Segoe UI", Roboto, sans-serif; margin: 0; padding: 40px; background: #f0f2f5; color: #222; }
        .container { max-width: 1400px; margin: 0 auto; }
        h2 { margin-bottom: 20px; color: #0d6efd; }
        table { width: 100%; border-collapse: collapse; background: #fff; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 6px rgba(0,0,0,0.1); table-layout: auto; }
        th, td { padding: 12px 16px; border-bottom: 1px solid #e0e0e0; text-align: left; font-size: 14px; vertical-align: top; }
        th { background: #f8f9fa; color: #333; font-weight: 600; white-space: nowrap; }
        td { white-space: nowrap; }
        td:nth-child(4) { white-space: normal; max-width: 400px; word-wrap: break-word; }
        tr:hover { background: #f6f8fa; }
        .btn { padding: 6px 12px; border-radius: 6px; font-size: 13px; text-decoration: none; transition: background 0.2s; display: inline-block; }
        .btn.add {background:#0d6efd;color:#fff} .btn.add:hover{background:#5c636a}
        .btn.edit {background:#ffc107;color:#000} .btn.edit:hover{background:#e0a800}
        .btn.delete {background:#dc3545;color:#fff} .btn.delete:hover{background:#bb2d3b}
        .btn.back {background:#0d6efd;color:#fff} .btn.back:hover {background:#5c636a}
        .top-actions { margin-bottom: 16px; }
        .top-actions a + a { margin-left: 8px; }
    </style>
</head>
<body>
<div class="container">
    <h2>📦 Danh sách sản phẩm</h2>

    <div class="top-actions">
        <a href="products?action=new" class="btn add">➕ Thêm sản phẩm</a>
        <a href="welcome.jsp" class="btn back">🔙 Quay lại</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Mô tả</th>
            <th>Tồn kho</th>
            <th>Ngày nhập</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>${p.description}</td>
                <td>${p.stock}</td>
                <td>
                    <fmt:formatDate value="${p.importDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <a href="products?action=edit&id=${p.id}" class="btn edit">✏️ Sửa</a>
                    <a href="products?action=delete&id=${p.id}" 
                       class="btn delete" 
                       onclick="return confirm('Bạn có chắc muốn xoá sản phẩm này?');">🗑️ Xoá</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty products}">
            <tr>
                <td colspan="7" style="text-align:center;color:#777;">Không có sản phẩm nào</td>
            </tr>
        </c:if>
    </table>

    <c:if test="${totalPages > 1}">
        <div style="margin-top:16px;">
            <c:set var="size" value="${pageSize != null ? pageSize : 10}"/>
            <a class="btn" href="products?page=1&size=${size}">⏮ Đầu</a>
            <a class="btn" href="products?page=${currentPage > 1 ? currentPage - 1 : 1}&size=${size}">◀ Trước</a>
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a class="btn ${i == currentPage ? 'edit' : ''}" href="products?page=${i}&size=${size}">${i}</a>
            </c:forEach>
            <a class="btn" href="products?page=${currentPage < totalPages ? currentPage + 1 : totalPages}&size=${size}">Sau ▶</a>
            <a class="btn" href="products?page=${totalPages}&size=${size}">Cuối ⏭</a>
        </div>
    </c:if>
</div>
</body>
</html>
