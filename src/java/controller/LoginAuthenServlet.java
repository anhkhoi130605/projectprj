/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.User;
import service.IUserService;
import service.UserServiceImpl;
import utils.hashPassWord;


/**
 *
 * @author Hieu
 */
@WebServlet(name = "LoginAuthenServlet", urlPatterns = {"/login"})
public class LoginAuthenServlet extends HttpServlet {
    private IUserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    /**
     * ✅ GET: Nếu đã login thì chuyển hướng về trang home, ngược lại thì mở form login.
     * @throws jakarta.servlet.ServletException
     * @throws java.io.IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // xóa session
        }

        // Xóa cookie username (nếu có)
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    cookie.setMaxAge(0);
                    cookie.setPath(request.getContextPath());
                    response.addCookie(cookie);
                }
            }
        }

        // Quay về trang chủ
        response.sendRedirect(request.getContextPath() + "/eduHome/eduHome.jsp");
    }

    /**
     * ✅ POST: Xử lý form đăng nhập.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username") != null ? request.getParameter("username").trim() : "";
        String password = request.getParameter("password") != null ? request.getParameter("password").trim() : "";
        String rememberMe = request.getParameter("rememberMe");

        // 👉 Nếu DB lưu hash thì bật dòng dưới, còn nếu test plain thì để nguyên.
        // String hashedPassword = hashPassWord.hash(password);
        // User user = userService.checkLoginUser(username, hashedPassword);
        System.out.println("Nhập username = " + username + ", password = " + password);
        User user = userService.checkLoginUser(username, password);

        if (user != null) {
            // ✅ Lưu session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // ✅ Cookie Remember Me
            if ("on".equals(rememberMe)) {
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(7 * 24 * 60 * 60); // 7 ngày
                response.addCookie(usernameCookie);
            }

            // ✅ Chuyển hướng sau khi login thành công
            response.sendRedirect(request.getContextPath() + "/eduHome/eduHome.jsp");

        } else {
            // ❌ Sai thông tin đăng nhập
            request.setAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("/authen/loginAuthen.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Authentication Servlet";
    }

}
