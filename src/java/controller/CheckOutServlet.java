package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Cart;
import model.CartItem;
import model.Order;
import model.User;
import service.IOrderService;
import service.OrderServiceImpl;
import service.IProductService;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CheckOutServlet", urlPatterns = {"/checkout"})
public class CheckOutServlet extends HttpServlet {
    private IOrderService orderService;
    private IProductService productService;
 
    @Override
    public void init() {
        orderService = new OrderServiceImpl();
        productService = new ProductService();
    }

  
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        // Kiểm tra giỏ hàng
        if (cart == null || cart.getItems().isEmpty()) {
             req.setAttribute("errorMessage", "Giỏ hàng trống, không thể thanh toán.");
             resp.sendRedirect(req.getContextPath() + "/cart");
             return;
        }

        
        User loggedUser = (User) session.getAttribute("loggedUser");
        req.setAttribute("cart", cart);
        req.setAttribute("loggedUser", loggedUser);

     
        req.getRequestDispatcher("/cart/checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // LẤY ĐỐI TƯỢNG CART TỪ SESSION
        Cart cart = (Cart) session.getAttribute("cart");

        // 1. Kiểm tra giỏ hàng
        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        // 2. Lấy User ID
        User loggedUser = (User) session.getAttribute("loggedUser");
        int userId = (loggedUser != null) ? loggedUser.getId() : 0;

        // 3. Tính tổng (Dùng phương thức từ đối tượng Cart)
        double total = cart.getTotalPrice();

        // 4. Tạo Order
        Order order = new Order();
        order.setUserId(userId);
        order.setTotalPrice(total);
        order.setStatus("Pending");

        try {
            // 5. Tạo đơn hàng chính (Order)
            int orderId = orderService.createOrder(order);

         
            for (CartItem item : cart.getItems()) { 
                int productId = item.getProduct().getId();
                int qty = item.getQuantity();
                double price = item.getProduct().getPrice(); 

                orderService.addOrderDetail(orderId, productId, qty, price);

     
            }

          
            session.removeAttribute("cart");

            
            session.setAttribute("orderId", orderId);
            resp.sendRedirect(req.getContextPath() + "/cart/success.jsp");

        } catch (SQLException ex) {
            ex.printStackTrace();

           
            req.setAttribute("errorMessage", "Lỗi khi lưu đơn hàng. Vui lòng thử lại.");
            req.setAttribute("cart", cart);
            req.getRequestDispatcher("/cart/checkout.jsp").forward(req, resp);
        }
    }
}