package com.hhgy.servlets;

import com.hhgy.dao.RequestDAO;
import com.hhgy.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Volunteer actions on requests.
 *   ?action=accept&id=#
 *   ?action=complete&id=#
 */
@WebServlet("/RequestActionServlet")
public class RequestActionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User volunteer = (User) req.getSession().getAttribute("user");
        if (volunteer == null || !"VOLUNTEER".equalsIgnoreCase(volunteer.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        int requestId;
        try { requestId = Integer.parseInt(req.getParameter("id")); }
        catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/jsp/volunteer/dashboard.jsp");
            return;
        }

        String action = req.getParameter("action");
        RequestDAO dao = new RequestDAO();
        boolean ok = false;

        if ("accept".equalsIgnoreCase(action)) {
            ok = dao.acceptRequest(requestId, volunteer.getUserId());
            req.getSession().setAttribute("msg", ok ? "Request accepted." : "Unable to accept request.");
            resp.sendRedirect(req.getContextPath() + "/jsp/volunteer/available.jsp");
        } else if ("complete".equalsIgnoreCase(action)) {
            ok = dao.completeRequest(requestId, volunteer.getUserId());
            req.getSession().setAttribute("msg", ok ? "Request marked completed." : "Unable to update request.");
            resp.sendRedirect(req.getContextPath() + "/jsp/volunteer/myAccepted.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/jsp/volunteer/dashboard.jsp");
        }
    }
}
