<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Sản Phẩm</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 30px auto;
}

h2 {
    text-align: center;
    color: #333;
}

.nav-links {
    text-align: center;
    margin-bottom: 20px;
}

.nav-links a {
    display: inline-block;
    margin: 0 10px;
    padding: 8px 15px;
    background: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: 0.3s;
}

.nav-links a:hover {
    background: #0056b3;
}

.products {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.product-card {
    background: #fff;
    width: 220px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    padding: 15px;
    text-align: center;
    transition: 0.3s;
}

.product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

.product-card h3 {
    font-size: 18px;
    color: #333;
    margin: 10px 0;
}

.product-card p {
    font-size: 16px;
    color: #555;
    margin: 5px 0 15px 0;
}

.product-card form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.product-card input[type=number] {
    width: 60px;
    padding: 5px;
    margin-bottom: 10px;
    text-align: center;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.add-btn {
    background: #28a745;
    color: #fff;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

.add-btn:hover {
    background: #218838;
}
</style>
</head>
<body>

<div class="container">
    <h2>Danh Sách Sản Phẩm</h2>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/cart">Xem Giỏ Hàng</a>
        <a href="${pageContext.request.contextPath}/welcome.jsp">Trang Chủ</a>
    </div>

    <div class="products">
        <c:forEach var="p" items="${products}">
            <div class="product-card">
                <h3>${p.name}</h3>
                <p>Giá: ${p.price} VND</p>
                <form action="${pageContext.request.contextPath}/cart" method="post">
                    <input type="hidden" name="action" value="add"/>
                    <input type="hidden" name="productId" value="${p.id}"/>
                    <input type="number" name="quantity" value="1" min="1"/>
                    <button type="submit" class="add-btn">Thêm vào Giỏ</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
