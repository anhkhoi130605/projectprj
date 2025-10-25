package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.User;
import service.IProductService;
import service.ProductService;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

   
    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        HttpSession session = request.getSession(false);
        User loggedUser = (User) session.getAttribute("loggedUser");

        List<Product> listProduct;
        String view;

        if (loggedUser != null && "admin".equalsIgnoreCase(loggedUser.getRole())) {
          
            int page = parseInt(request.getParameter("page"));
            int size = parseInt(request.getParameter("size"));
            if (page <= 0) page = 1;
            if (size <= 0) size = 10;

            int totalItems = productService.countAllProducts();
            int totalPages = (int) Math.ceil(totalItems / (double) size);
            if (page > totalPages && totalPages > 0) page = totalPages;

            listProduct = productService.getProductsPage(page, size);

            request.setAttribute("currentPage", page);
            request.setAttribute("pageSize", size);
            request.setAttribute("totalPages", totalPages);

            view = "/product/productList.jsp"; 
        } else {
          
            listProduct = productService.getAllProducts();
            view = "/product/productListCart.jsp";
        }

        request.setAttribute("products", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/createProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        int id = parseInt(idStr);
        Product product = productService.getProduct(id);
        if (product == null) {
            response.sendRedirect("products");
            return;
        }

        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/editProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        double price = parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = parseInt(request.getParameter("stock"));
        int status = parseInt(request.getParameter("status"));

        String importDateStr = request.getParameter("importDate");
        Date importDate = parseDateOrToday(importDateStr);

        Product product = new Product(name, price, description, stock, importDate, status);
        productService.insertProduct(product);
        response.sendRedirect("products");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = parseInt(request.getParameter("stock"));
        int status = parseInt(request.getParameter("status"));
        String importDateStr = request.getParameter("importDate");
        Date importDate = parseDateOrToday(importDateStr);

        Product product = new Product(id, name, price, description, stock, importDate, status);
        productService.updateProduct(product);
        response.sendRedirect("products");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        response.sendRedirect("products");
    }

    // ======== Helpers ========
    private int parseInt(String val) {
        try {
            return Integer.parseInt(val);
        } catch (Exception e) {
            return 0;
        }
    }

    private double parseDouble(String val) {
        try {
            return Double.parseDouble(val);
        } catch (Exception e) {
            return 0;
        }
    }

    private Date parseDateOrToday(String val) {
        if (val == null || val.isEmpty()) return new Date(System.currentTimeMillis());
        return Date.valueOf(val); // yyyy-MM-dd
    }
}
