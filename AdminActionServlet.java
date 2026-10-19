package com.hhgy.servlets;

import com.hhgy.dao.UserDAO;
import com.hhgy.dao.VolunteerDAO;
import com.hhgy.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Admin actions: approve/reject volunteers, delete users.
 *   ?action=approve&id=#
 *   ?action=reject&id=#
 *   ?action=delete&id=#
 */
@WebServlet("/AdminActionServlet")
public class AdminActionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User admin = (User) req.getSession().getAttribute("user");
        if (admin == null || !"ADMIN".equalsIgnoreCase(admin.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String action = req.getParameter("action");
        int id;
        try { id = Integer.parseInt(req.getParameter("id")); }
        catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/jsp/admin/dashboard.jsp");
            return;
        }

        VolunteerDAO vDao = new VolunteerDAO();
        UserDAO uDao = new UserDAO();
        String redirect = "jsp/admin/volunteers.jsp";

        if ("approve".equalsIgnoreCase(action)) {
            vDao.updateStatus(id, "APPROVED");
        } else if ("reject".equalsIgnoreCase(action)) {
            vDao.updateStatus(id, "REJECTED");
        } else if ("delete".equalsIgnoreCase(action)) {
            uDao.deleteUser(id);
            redirect = "jsp/admin/manageUsers.jsp";
        }
        resp.sendRedirect(req.getContextPath() + "/" + redirect);
    }
}
