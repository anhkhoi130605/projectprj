<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>✏️ Sửa sản phẩm</title>
    <style>
        body {
            font-family: system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Noto Sans,sans-serif;
            margin: 0;
            padding: 40px;
            background: #f6f7f9;
            color: #222;
        }
        .container {
            max-width: 760px;
            margin: 0 auto;
        }
        h2 {
            color: #0d6efd;
            margin-bottom: 24px;
        }
        form {
            max-width: 520px;
            background: #fff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 20px;
        }
        .field {
            margin-bottom: 12px;
        }
        label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
            color: #444;
        }
        input[type=text],
        input[type=number],
        input[type=date],
        textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 14px;
        }
        .form-actions {
            margin-top: 16px;
        }
        .btn {
            display: inline-block;
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
<div class="container">
    <h2>✏️ Thêm sản phẩm</h2>
    <form action="products?action=insert" method="post">
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
        <input type="date" id="importDate" name="importDate"
               value="<fmt:formatDate value='${product.importDate}' pattern='yyyy-MM-dd'/>">
    </div>

    <div class="form-actions">
        <button type="submit" class="btn save">💾 Cập nhật</button>
        <a href="products" class="btn back">⬅ Quay lại danh sách</a>
    </div>
</form>

</div>
</body>
</html>
