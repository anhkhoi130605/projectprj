<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<html>
<head>
    <title>Delete Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body class="container mt-5">
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Delete Product</h2>
    <a href="./products" class="btn btn-secondary">Back to List</a>
</div>

<%
    Product product = (Product) request.getAttribute("product");
    if (product != null) {
%>

<div class="alert alert-warning">Are you sure you want to delete this product?</div>

<table class="table table-bordered w-75">
    <tr><th>ID</th><td><%=product.getId()%></td></tr>
    <tr><th>Name</th><td><%=product.getName()%></td></tr>
    <tr><th>Price</th><td><%=product.getPrice()%></td></tr>
    <tr><th>Description</th><td><%=product.getDescription()%></td></tr>
    <tr><th>Stock</th><td><%=product.getStock()%></td></tr>
    <tr><th>Import Date</th><td><%=product.getImportDate()%></td></tr>
</table>

<form action="./products" method="post" class="mt-3" onsubmit="return confirm('Confirm delete?')">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" value="<%=product.getId()%>"/>
    <button type="submit" class="btn btn-danger">Confirm Delete</button>
    <a href="./products" class="btn btn-outline-secondary ms-2">Cancel</a>
</form>

<% } %>
</body>
</html>
