package com.hhgy.servlets;

import com.hhgy.dao.UserDAO;
import com.hhgy.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User current = (User) req.getSession().getAttribute("user");
        if (current == null) { resp.sendRedirect(req.getContextPath() + "/login.jsp"); return; }

        current.setName   (req.getParameter("name"));
        current.setAddress(req.getParameter("address"));
        current.setPhone  (req.getParameter("phone"));
        current.setGender (req.getParameter("gender"));
        try { current.setAge(Integer.parseInt(req.getParameter("age"))); } catch (Exception ignored) {}

        new UserDAO().updateProfile(current);
        req.getSession().setAttribute("user", current);
        req.getSession().setAttribute("msg", "Profile updated.");

        String role = current.getRole().toLowerCase();
        resp.sendRedirect(req.getContextPath() + "/jsp/" + role + "/profile.jsp");
    }
}
