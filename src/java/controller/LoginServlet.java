package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.User;
import service.IUserService;
import service.UserServiceImpl;
import java.io.IOException;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

public class LoginServlet extends HttpServlet {
    private IUserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = req.getSession(false);
            if (session != null) session.invalidate();

            Cookie cookie = new Cookie("rememberMe", "");
            cookie.setMaxAge(0);
            cookie.setPath("/");
            resp.addCookie(cookie);

            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("rememberMe".equals(c.getName())) {
                    String rememberValue = URLDecoder.decode(c.getValue(), StandardCharsets.UTF_8);
                    String[] parts = rememberValue.split(":");
                    if (parts.length == 2) {
                        User user = userService.login(parts[0], parts[1]);
                        if (user != null) {
                            HttpSession session = req.getSession();
                            session.setAttribute("loggedUser", user);
                            resp.sendRedirect(req.getContextPath() + "/welcome.jsp");
                            return;
                        }
                    }
                }
            }
        }

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("loggedUser") != null) {
            resp.sendRedirect(req.getContextPath() + "/welcome.jsp");
            return;
        }

        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String usernameOrEmail = req.getParameter("usernameOrEmail");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        User user = userService.login(usernameOrEmail, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedUser", user);
            session.setMaxInactiveInterval(30 * 60);

            if ("on".equals(remember)) {
                String cookieValue = URLEncoder.encode(usernameOrEmail + ":" + password, StandardCharsets.UTF_8);
                Cookie cookie = new Cookie("rememberMe", cookieValue);
                cookie.setMaxAge(7 * 24 * 60 * 60);
                cookie.setPath("/");
                resp.addCookie(cookie);
            }

            String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
            if (redirectUrl != null) {
                session.removeAttribute("redirectAfterLogin");
                resp.sendRedirect(redirectUrl);
            } else {
               
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    resp.sendRedirect(req.getContextPath() + "/welcome.jsp");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/products");
                }
            }
        } else {
            req.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
