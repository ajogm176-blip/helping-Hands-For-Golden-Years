package com.hhgy.servlets;

import com.hhgy.dao.RequestDAO;
import com.hhgy.model.Request;
import com.hhgy.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

/** Senior creates a new service request. */
@WebServlet("/CreateRequestServlet")
public class CreateRequestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User senior = (User) req.getSession().getAttribute("user");
        if (senior == null || !"SENIOR".equalsIgnoreCase(senior.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        Request r = new Request();
        r.setSeniorId      (senior.getUserId());
        r.setCategory      (req.getParameter("category"));
        r.setDescription   (req.getParameter("description"));
        r.setAddress       (req.getParameter("address"));
        r.setEmergencyLevel(req.getParameter("emergencyLevel"));
        try {
            r.setRequestDate(Date.valueOf(req.getParameter("requestDate")));
        } catch (Exception e) {
            r.setRequestDate(new Date(System.currentTimeMillis()));
        }

        boolean ok = new RequestDAO().createRequest(r);
        req.getSession().setAttribute("msg",
            ok ? "Request created successfully." : "Could not create request.");
        resp.sendRedirect(req.getContextPath() + "/jsp/senior/myRequests.jsp");
    }
}
