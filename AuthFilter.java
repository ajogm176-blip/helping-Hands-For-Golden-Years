package com.hhgy.filters;

import com.hhgy.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Protects /jsp/* pages: only logged-in users with the matching role can view.
 *   /jsp/senior/*    -> SENIOR
 *   /jsp/volunteer/* -> VOLUNTEER
 *   /jsp/admin/*     -> ADMIN
 */
@WebFilter("/jsp/*")
public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String uri  = req.getRequestURI();
        String role = user.getRole().toUpperCase();

        boolean allowed =
            (uri.contains("/jsp/senior/")    && role.equals("SENIOR"))    ||
            (uri.contains("/jsp/volunteer/") && role.equals("VOLUNTEER")) ||
            (uri.contains("/jsp/admin/")     && role.equals("ADMIN"));

        if (!allowed) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
}
