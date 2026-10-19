package com.hhgy.servlets;

import com.hhgy.dao.EmergencyContactDAO;
import com.hhgy.model.EmergencyContact;
import com.hhgy.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/** Add / delete emergency contacts for a senior. */
@WebServlet("/EmergencyContactServlet")
public class EmergencyContactServlet extends HttpServlet {

    private final EmergencyContactDAO dao = new EmergencyContactDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User senior = (User) req.getSession().getAttribute("user");
        if (senior == null || !"SENIOR".equalsIgnoreCase(senior.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        EmergencyContact ec = new EmergencyContact();
        ec.setSeniorId    (senior.getUserId());
        ec.setContactName (req.getParameter("contactName"));
        ec.setRelationship(req.getParameter("relationship"));
        ec.setPhone       (req.getParameter("phone"));
        dao.add(ec);

        resp.sendRedirect(req.getContextPath() + "/jsp/senior/emergency.jsp");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User senior = (User) req.getSession().getAttribute("user");
        if (senior == null) { resp.sendRedirect(req.getContextPath() + "/login.jsp"); return; }

        if ("delete".equalsIgnoreCase(req.getParameter("action"))) {
            try {
                int cid = Integer.parseInt(req.getParameter("id"));
                dao.delete(cid, senior.getUserId());
            } catch (Exception ignored) {}
        }
        resp.sendRedirect(req.getContextPath() + "/jsp/senior/emergency.jsp");
    }
}
