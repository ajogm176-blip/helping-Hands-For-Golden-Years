<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Volunteers</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>Registered Volunteers</h3>
  <% List<User> vols = new UserDAO().findAllVolunteers(); %>
  <div class="table-responsive mt-3"><table class="table table-bordered bg-white align-middle">
    <thead class="table-light"><tr>
      <th>#</th><th>Name</th><th>Phone</th><th>Email</th><th>ID Proof</th><th>Status</th><th>Action</th>
    </tr></thead><tbody>
    <% if (vols.isEmpty()) { %>
      <tr><td colspan="7" class="text-center text-muted">No volunteers registered.</td></tr>
    <% } else { for (User v : vols) {
         String s = v.getVerificationStatus();
         String cls = "badge-pending";
         if ("APPROVED".equalsIgnoreCase(s)) cls = "badge-approved";
         if ("REJECTED".equalsIgnoreCase(s)) cls = "badge-rejected";
    %>
      <tr>
        <td><%= v.getUserId() %></td><td><%= v.getName() %></td><td><%= v.getPhone() %></td>
        <td><%= v.getEmail() %></td><td><%= v.getIdProofNumber() %></td>
        <td><span class="badge <%= cls %>"><%= s %></span></td>
        <td>
          <% if (!"APPROVED".equalsIgnoreCase(s)) { %>
            <a class="btn btn-success btn-sm"
               href="${pageContext.request.contextPath}/AdminActionServlet?action=approve&id=<%= v.getUserId() %>">Approve</a>
          <% } %>
          <% if (!"REJECTED".equalsIgnoreCase(s)) { %>
            <a class="btn btn-danger btn-sm"
               href="${pageContext.request.contextPath}/AdminActionServlet?action=reject&id=<%= v.getUserId() %>">Reject</a>
          <% } %>
        </td>
      </tr>
    <% } } %>
    </tbody></table></div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
