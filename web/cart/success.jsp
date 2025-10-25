<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt Hàng Thành Công</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .success-box {
            display: inline-block;
            padding: 30px 50px;
            border: 2px solid #28a745;
            border-radius: 10px;
            background-color: #f0fff0;
        }
        .success-box h1 {
            color: #28a745;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <h1>🎉 Đặt hàng thành công!</h1>
        <p>Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đang được xử lý.</p>
        <a class="btn" href="${pageContext.request.contextPath}/products">Tiếp tục mua sắm</a>
        <a class="btn" href="${pageContext.request.contextPath}/cart">Xem giỏ hàng</a>
    </div>
</body>
</html>
