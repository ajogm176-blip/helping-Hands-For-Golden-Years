<%-- Shared navigation bar for logged-in pages --%>
<%@ page import="com.hhgy.model.User" %>
<%
    User _u = (User) session.getAttribute("user");
    String _role = (_u != null) ? _u.getRole().toUpperCase() : "";
    String ctx = request.getContextPath();
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="<%= ctx %>/index.jsp">🤝 Helping Hands</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div id="nav" class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto align-items-lg-center">
        <% if ("SENIOR".equals(_role)) { %>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/senior/dashboard.jsp">Dashboard</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/senior/createRequest.jsp">New Request</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/senior/myRequests.jsp">My Requests</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/senior/emergency.jsp">Emergency</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/senior/profile.jsp">Profile</a></li>
        <% } else if ("VOLUNTEER".equals(_role)) { %>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/volunteer/dashboard.jsp">Dashboard</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/volunteer/available.jsp">Available</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/volunteer/myAccepted.jsp">My Tasks</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/volunteer/profile.jsp">Profile</a></li>
        <% } else if ("ADMIN".equals(_role)) { %>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/admin/dashboard.jsp">Dashboard</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/admin/seniors.jsp">Seniors</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/admin/volunteers.jsp">Volunteers</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/admin/requests.jsp">Requests</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= ctx %>/jsp/admin/manageUsers.jsp">Manage Users</a></li>
        <% } %>
        <% if (_u != null) { %>
          <li class="nav-item ms-lg-3">
            <span class="navbar-text text-white-50">Hi, <%= _u.getName() %></span>
          </li>
          <li class="nav-item ms-lg-2">
            <a class="btn btn-light btn-sm" href="<%= ctx %>/LogoutServlet">Logout</a>
          </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>
<%
    String _msg = (String) session.getAttribute("msg");
    if (_msg != null) { session.removeAttribute("msg");
%>
<div class="container mt-3">
  <div class="alert alert-success py-2"><%= _msg %></div>
</div>
<% } %>
