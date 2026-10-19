package com.hhgy.servlets;

import com.hhgy.dao.UserDAO;
import com.hhgy.dao.VolunteerDAO;
import com.hhgy.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/** Authenticates a user and stores them in session, then redirects to dashboard. */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email    = req.getParameter("email");
        String password = req.getParameter("password");

        User user = new UserDAO().login(email, password);

        if (user == null) {
            req.setAttribute("error", "Invalid email or password.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // Volunteers must be APPROVED by admin before they can use the system
        if ("VOLUNTEER".equalsIgnoreCase(user.getRole())) {
            String status = new VolunteerDAO().getStatus(user.getUserId());
            if (!"APPROVED".equalsIgnoreCase(status)) {
                req.setAttribute("error",
                    "Your volunteer account is currently " + status + ". Please wait for admin approval.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            }
        }

        HttpSession session = req.getSession();
        session.setAttribute("user", user);

        switch (user.getRole().toUpperCase()) {
            case "SENIOR":    resp.sendRedirect("jsp/senior/dashboard.jsp");    break;
            case "VOLUNTEER": resp.sendRedirect("jsp/volunteer/dashboard.jsp"); break;
            case "ADMIN":     resp.sendRedirect("jsp/admin/dashboard.jsp");     break;
            default:          resp.sendRedirect("login.jsp");
        }
    }
}
