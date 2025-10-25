package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Filter phân quyền cho các URL yêu cầu quyền admin
 */
public class AuthorizationFilter implements Filter {
    
    // Danh sách các URL chỉ dành cho admin
    private static final List<String> ADMIN_ONLY_URLS = Arrays.asList(
        "/users",
        "/user/",
        "/product/createProduct.jsp",
        "/product/editProduct.jsp", 
        "/product/deleteProduct.jsp",
        "/product/productList.jsp"
    );
    
    // Danh sách các action chỉ dành cho admin
    private static final List<String> ADMIN_ONLY_ACTIONS = Arrays.asList(
        "create", "edit", "delete", "update", "insert"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String path = requestURI.substring(contextPath.length());
        String action = httpRequest.getParameter("action");
        
        // Kiểm tra xem URL có yêu cầu quyền admin không
        if (!requiresAdminAccess(path, action)) {
            chain.doFilter(request, response);
            return;
        }
        
        // Kiểm tra quyền admin
        HttpSession session = httpRequest.getSession(false);
        if (session == null) {
            httpResponse.sendRedirect(contextPath + "/login.jsp");
            return;
        }
        
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser == null) {
            httpResponse.sendRedirect(contextPath + "/login.jsp");
            return;
        }
        
        // Kiểm tra role admin
        if (!"admin".equalsIgnoreCase(loggedUser.getRole())) {
            // User thường không có quyền truy cập, redirect về trang chủ
            httpResponse.sendRedirect(contextPath + "/welcome.jsp");
            return;
        }
        
        // Admin có quyền, tiếp tục xử lý
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup
    }
    
    /**
     * Kiểm tra xem URL/action có yêu cầu quyền admin không
     */
    private boolean requiresAdminAccess(String path, String action) {
        // Kiểm tra URL admin-only
        for (String adminUrl : ADMIN_ONLY_URLS) {
            if (path.startsWith(adminUrl)) {
                return true;
            }
        }
        
        // Kiểm tra action admin-only
        if (action != null && ADMIN_ONLY_ACTIONS.contains(action)) {
            return true;
        }
        
        return false;
    }
}
