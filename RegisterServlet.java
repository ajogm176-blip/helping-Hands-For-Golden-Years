package com.hhgy.servlets;

import com.hhgy.dao.UserDAO;
import com.hhgy.dao.VolunteerDAO;
import com.hhgy.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/** Handles new-user registration for Seniors and Volunteers. */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User u = new User();
        u.setName    (req.getParameter("name"));
        u.setAge     (parseInt(req.getParameter("age")));
        u.setGender  (req.getParameter("gender"));
        u.setPhone   (req.getParameter("phone"));
        u.setEmail   (req.getParameter("email"));
        u.setAddress (req.getParameter("address"));
        u.setPassword(req.getParameter("password"));
        u.setRole    (req.getParameter("role"));  // SENIOR or VOLUNTEER

        UserDAO dao = new UserDAO();
        int userId = dao.register(u);

        if (userId > 0) {
            // If volunteer, also insert into volunteers table (PENDING approval)
            if ("VOLUNTEER".equalsIgnoreCase(u.getRole())) {
                new VolunteerDAO().insertVolunteer(userId, req.getParameter("idProof"));
            }
            req.getSession().setAttribute("msg", "Registration successful! Please log in.");
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("error", "Registration failed. Email may already exist.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }

    private int parseInt(String s) {
        try { return Integer.parseInt(s); } catch (Exception e) { return 0; }
    }
}
