package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;


public class AuthenticationFilter implements Filter {
    
    // Danh sách các URL không cần đăng nhập
    private static final List<String> PUBLIC_URLS = Arrays.asList(
        "/login.jsp",
        "/login",
        "/register.jsp", 
        "/register",
        "/css/",
        "/js/",
        "/images/",
        "/favicon.ico"
    );
    
    // Danh sách các URL yêu cầu đăng nhập
    private static final List<String> PROTECTED_URLS = Arrays.asList(
        "/welcome.jsp",
        "/products",
        "/cart",
        "/checkout",
        "/users",
        "/orders",
        "/search"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
      
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String path = requestURI.substring(contextPath.length());
        
        // Kiểm tra xem URL có cần authentication không
        if (isPublicUrl(path)) {
            chain.doFilter(request, response);
            return;
        }
        
        // Kiểm tra session và user đăng nhập
        HttpSession session = httpRequest.getSession(false);
        User loggedUser = null;
        
        if (session != null) {
            loggedUser = (User) session.getAttribute("loggedUser");
        }
        
        // Nếu chưa đăng nhập, redirect về trang login
        if (loggedUser == null) {
            // Lưu URL hiện tại để redirect sau khi đăng nhập
            String redirectUrl = requestURI;
            if (httpRequest.getQueryString() != null) {
                redirectUrl += "?" + httpRequest.getQueryString();
            }
            session = httpRequest.getSession(true);
            session.setAttribute("redirectAfterLogin", redirectUrl);
            
            httpResponse.sendRedirect(contextPath + "/login.jsp");
            return;
        }
        
        // Đã đăng nhập, tiếp tục xử lý request
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup
    }
    
    /**
     * Kiểm tra xem URL có phải là public URL không
     */
    private boolean isPublicUrl(String path) {
        // Kiểm tra exact match
        if (PUBLIC_URLS.contains(path)) {
            return true;
        }
        
        // Kiểm tra prefix match (cho static resources)
        for (String publicUrl : PUBLIC_URLS) {
            if (publicUrl.endsWith("/") && path.startsWith(publicUrl)) {
                return true;
            }
        }
        
        return false;
    }
}
