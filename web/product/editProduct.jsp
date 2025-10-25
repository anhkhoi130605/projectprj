<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>✏️ Sửa sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList.css">
    <style>
        /* Form container đồng bộ với container admin */
        .form-container {
            max-width: 520px;
            margin: 40px auto;
            background: #fff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 24px;
        }
        .form-container h2 {
            text-align: center;
            color: #0d6efd;
            margin-bottom: 24px;
        }
        .field {
            margin-bottom: 16px;
        }
        .field label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
            color: #444;
        }
        .field input,
        .field textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 14px;
        }
        .field input:focus,
        .field textarea:focus {
            border-color: #0d6efd;
            outline: none;
        }
        .form-actions {
            margin-top: 20px;
            text-align: right;
        }
        .btn {
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 14px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: background 0.2s, color 0.2s;
        }
        .btn.save {background:#0d6efd;color:#fff;}
        .btn.save:hover {background:#0b5ed7;}
        .btn.back {background:#6c757d;color:#fff;margin-left:10px;}
        .btn.back:hover {background:#5a6268;}
    </style>
</head>
<body>
<div class="form-container">
    <h2>✏️ Sửa sản phẩm</h2>
    <form action="${pageContext.request.contextPath}/products" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${product.id}">

        <div class="field">
            <label for="name">Tên sản phẩm</label>
            <input type="text" id="name" name="name" value="${product.name}" required>
        </div>

        <div class="field">
            <label for="price">Giá</label>
            <input type="number" id="price" name="price" step="0.01" value="${product.price}" required>
        </div>

        <div class="field">
            <label for="description">Mô tả</label>
            <textarea id="description" name="description" rows="4">${product.description}</textarea>
        </div>

        <div class="field">
            <label for="stock">Tồn kho</label>
<input type="number" id="stock" name="stock" min="0" value="${p.stock}" required>

        </div>

        <div class="field">
    <label for="importDate">Ngày nhập</label>
    <c:choose>
        <c:when test="${not empty product.importDate}">
            <fmt:formatDate value="${product.importDate}" pattern="yyyy-MM-dd" var="importDateStr"/>
            <input type="date" id="importDate" name="importDate" value="${importDateStr}">
        </c:when>
        <c:otherwise>
            <input type="date" id="importDate" name="importDate">
        </c:otherwise>
    </c:choose>
</div>

        <div class="form-actions">
            <button type="submit" class="btn save">💾 Lưu thay đổi</button>
            <a href="${pageContext.request.contextPath}/products" class="btn back">⬅ Quay lại</a>
        </div>
    </form>
</div>
</body>
</html>
