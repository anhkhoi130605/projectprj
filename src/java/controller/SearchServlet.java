package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.User;
import service.IUserService;
import service.UserServiceImpl;

import java.io.IOException;
import java.util.List;

public class SearchServlet extends HttpServlet {

    private IUserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        String keyword = req.getParameter("keyword");
        if (keyword == null) keyword = "";

   
        List<User> filtered = userService.searchUser(keyword);

        req.setAttribute("searchResult", filtered);
        req.setAttribute("keyword", keyword);
        req.getRequestDispatcher("/searchUser.jsp").forward(req, resp);
    }
}
