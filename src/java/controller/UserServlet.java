package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.User;
import service.IUserService;
import service.UserServiceImpl;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class UserServlet extends HttpServlet {
    private IUserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       
        HttpSession session = req.getSession(false);
        User logged = (User) session.getAttribute("loggedUser");
        
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "create":
                req.getRequestDispatcher("user/createUser.jsp").forward(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            default:
                listUsers(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
      
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        switch (action) {
            case "create":
                insertUser(req, resp);
                break;
            case "update":
                updateUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            default:
                resp.sendRedirect("users");
        }
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<User> list = userService.selectAllUsers();
        req.setAttribute("listUser", list);
        req.getRequestDispatcher("user/listUser.jsp").forward(req, resp);
    }

    private void insertUser(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        boolean status = "true".equalsIgnoreCase(req.getParameter("status"));
        String dobStr = req.getParameter("dob");
        Date dob = (dobStr != null && !dobStr.isEmpty()) ? Date.valueOf(dobStr) : null;

        User newUser = new User(0, username, email, country, role, status, password, dob);
        userService.insertUser(newUser);
        resp.sendRedirect("users");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User existingUser = userService.selectUser(id);
        req.setAttribute("user", existingUser);
        req.getRequestDispatcher("user/editUser.jsp").forward(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        boolean status = "true".equalsIgnoreCase(req.getParameter("status"));
        String dobStr = req.getParameter("dob");
        Date dob = (dobStr != null && !dobStr.isEmpty()) ? Date.valueOf(dobStr) : null;

        User updatedUser = new User(id, username, email, country, role, status, password, dob);
        userService.updateUser(updatedUser);
        resp.sendRedirect("users");
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        userService.deleteUser(id);
        resp.sendRedirect("users");
    }
}
