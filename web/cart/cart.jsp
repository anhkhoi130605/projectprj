<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8"/>
<title>Giỏ Hàng</title>
<style>
    body {
        font-family: "Segoe UI", Roboto, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    .container {
        max-width: 1000px;
        margin: 30px auto;
        background: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    }
    h1 {
        text-align: center;
        color: #0d6efd;
        margin-bottom: 25px;
    }
    .empty-cart {
        text-align: center;
        padding: 30px;
        font-size: 18px;
        background: #fff3cd;
        color: #856404;
        border-radius: 10px;
        border: 1px solid #ffeeba;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 14px 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f8f9fa;
        font-weight: 600;
        color: #333;
    }
    tr:hover {
        background-color: #f1f5f9;
    }
    input[type=number] {
        width: 60px;
        padding: 6px;
        border-radius: 5px;
        border: 1px solid #ccc;
        text-align: center;
    }
    button {
        padding: 6px 12px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background 0.2s;
        font-weight: 500;
    }
    .btn-update {
        background: #0d6efd;
        color: #fff;
    }
    .btn-update:hover {
        background: #0b5ed7;
    }
    .btn-remove {
        background: #dc3545;
        color: #fff;
    }
    .btn-remove:hover {
        background: #bb2d3b;
    }
    tfoot td {
        font-size: 18px;
        font-weight: bold;
        color: #0d6efd;
    }
    .btn-checkout {
        background: #28a745;
        color: #fff;
        padding: 14px 24px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        border: none;
        cursor: pointer;
        transition: background 0.2s;
    }
    .btn-checkout:hover {
        background: #218838;
    }
    a {
        color: #0d6efd;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
    .checkout {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
    .alert {
        padding: 12px 16px;
        margin-bottom: 20px;
        border-radius: 8px;
        font-weight: 500;
    }
    .alert-error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    .stock-info {
        font-size: 12px;
        color: #6c757d;
        margin-top: 4px;
    }
    .stock-warning {
        color: #dc3545;
        font-weight: 500;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Giỏ Hàng Của Bạn</h1>

    <!-- Hiển thị thông báo lỗi -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">
            ${errorMessage}
        </div>
    </c:if>

    <!-- Hiển thị thông báo thành công -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
            ${successMessage}
        </div>
    </c:if>

    <!-- Giỏ trống -->
    <c:if test="${empty cart.items}">
        <div class="empty-cart">
            Giỏ hàng của bạn đang trống. <a href="${pageContext.request.contextPath}/products">Tiếp tục mua hàng</a>
        </div>
    </c:if>

    <!-- Giỏ có sản phẩm -->
    <c:if test="${not empty cart.items}">
        <table>
            <thead>
                <tr>
                    <th>Sản Phẩm</th>
                    <th>Giá</th>
                    <th>Số Lượng</th>
                    <th>Thành Tiền</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart.items}">
                    <tr>
                        <td>
                            ${item.product.name}
                            <div class="stock-info">
                                Tồn kho: <span class="${item.quantity > item.product.stock ? 'stock-warning' : ''}">${item.product.stock}</span>
                            </div>
                        </td>
                        <td>${item.product.price} VND</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name="productId" value="${item.product.id}"/>
                                <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.product.stock}" 
                                       onchange="validateStock(this, ${item.product.stock}, '${item.product.name}')" 
                                       onblur="this.form.submit()"/>
                            </form>
                        </td>
                        <td>${item.totalPrice} VND</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="remove"/>
                                <input type="hidden" name="productId" value="${item.product.id}"/>
                                <button type="submit" class="btn-remove">Xóa</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">Tổng Cộng:</td>
                    <td>${cart.totalPrice} VND</td>
                    <td></td>
                </tr>
            </tfoot>
        </table>

        <div class="checkout">
            <!-- Quay lại mua hàng -->
            <a href="${pageContext.request.contextPath}/products"
               style="background: #0d6efd; color: #fff; padding: 14px 24px; border-radius: 8px; font-size: 16px; font-weight: 600;">
                ← Tiếp tục mua hàng
            </a>

            <!-- Thanh toán -->
            <form action="${pageContext.request.contextPath}/checkout" method="post" style="margin:0;">
                <button type="submit" class="btn-checkout">Tiến hành thanh toán</button>
            </form>
        </div>
    </c:if>
</div>

<script>
function validateStock(input, maxStock, productName) {
    const quantity = parseInt(input.value);
    
    if (quantity > maxStock) {
        alert('Số lượng yêu cầu (' + quantity + ') vượt quá tồn kho hiện có (' + maxStock + ') của sản phẩm ' + productName);
        input.value = maxStock; // Đặt lại giá trị về tồn kho tối đa
        input.focus();
        return false;
    }
    
    if (quantity < 1) {
        alert('Số lượng phải lớn hơn 0');
        input.value = 1;
        input.focus();
        return false;
    }
    
    return true;
}

// Tự động ẩn thông báo sau 5 giây
document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            alert.style.opacity = '0';
            setTimeout(function() {
                alert.remove();
            }, 300);
        }, 5000);
    });
});
</script>
</body>
</html>
