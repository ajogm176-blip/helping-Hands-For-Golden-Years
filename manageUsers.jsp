<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Manage Users</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>Manage Users</h3>
  <p class="text-muted">Remove any senior or volunteer from the system.</p>
  <%
    List<User> seniors = new UserDAO().findByRole("SENIOR");
    List<User> vols    = new UserDAO().findByRole("VOLUNTEER");
    List<User> all = new ArrayList<User>(); all.addAll(seniors); all.addAll(vols);
  %>
  <div class="table-responsive mt-3"><table class="table table-bordered bg-white align-middle">
    <thead class="table-light"><tr>
      <th>#</th><th>Name</th><th>Email</th><th>Phone</th><th>Role</th><th>Action</th>
    </tr></thead><tbody>
    <% if (all.isEmpty()) { %>
      <tr><td colspan="6" class="text-center text-muted">No users to manage.</td></tr>
    <% } else { for (User x : all) { %>
      <tr>
        <td><%= x.getUserId() %></td><td><%= x.getName() %></td>
        <td><%= x.getEmail() %></td><td><%= x.getPhone() %></td>
        <td><span class="badge bg-secondary"><%= x.getRole() %></span></td>
        <td>
          <a class="btn btn-sm btn-danger"
             href="${pageContext.request.contextPath}/AdminActionServlet?action=delete&id=<%= x.getUserId() %>"
             onclick="return confirmAction('Delete this user and all their data?')">Delete</a>
        </td>
      </tr>
    <% } } %>
    </tbody></table></div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
