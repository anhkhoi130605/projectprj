package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Cart;
import model.CartItem;
import model.Product;
import service.CartServiceImpl;
import service.ICartService;
import service.IProductService;
import service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
    private IProductService productService;
    private ICartService cartService;

    @Override
    public void init() {
        productService = new ProductService();
        cartService = new CartServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Đặt Cart và tổng tiền vào request để hiển thị trên JSP
        req.setAttribute("cart", cart);
        req.setAttribute("cartTotal", cart.getTotalPrice());

        // Cần truyền list items (nếu JSP cần)
        req.setAttribute("cartItems", cart.getItems());

        // Xử lý thông báo từ session
        String errorMessage = (String) session.getAttribute("errorMessage");
        String successMessage = (String) session.getAttribute("successMessage");
        
        if (errorMessage != null) {
            req.setAttribute("errorMessage", errorMessage);
            session.removeAttribute("errorMessage"); // Xóa sau khi đã lấy
        }
        if (successMessage != null) {
            req.setAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage"); // Xóa sau khi đã lấy
        }

        req.getRequestDispatcher("/cart/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");
        String productIdStr = req.getParameter("productId");
        int productId = 0;
        try { productId = Integer.parseInt(productIdStr); } catch (Exception ignored) {}

        String errorMessage = null;
        String successMessage = null;

        switch (action == null ? "" : action) {
            case "add":
                int qty = 1;
                try { qty = Integer.parseInt(req.getParameter("quantity")); } catch (Exception ignored) {}
                Product p = productService.getProduct(productId);
                if (p != null) {
                    try {
                        cartService.addToCart(cart, p, qty);
                        successMessage = "Đã thêm " + qty + " " + p.getName() + " vào giỏ hàng";
                    } catch (IllegalArgumentException e) {
                        errorMessage = e.getMessage();
                    }
                }
                break;
            case "update":
                int newQty = 1;
                try { newQty = Integer.parseInt(req.getParameter("quantity")); } catch (Exception ignored) {}
                Product product = productService.getProduct(productId);
                if (product != null) {
                    try {
                        cartService.updateCartItem(cart, productId, newQty);
                        successMessage = "Đã cập nhật số lượng " + product.getName() + " thành " + newQty;
                    } catch (IllegalArgumentException e) {
                        errorMessage = e.getMessage();
                    }
                }
                break;
            case "remove":
                cartService.removeCartItem(cart, productId);
                successMessage = "Đã xóa sản phẩm khỏi giỏ hàng";
                break;
        }
        
        // Lưu thông báo vào session để hiển thị trên JSP
        if (errorMessage != null) {
            session.setAttribute("errorMessage", errorMessage);
        }
        if (successMessage != null) {
            session.setAttribute("successMessage", successMessage);
        }
        
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}