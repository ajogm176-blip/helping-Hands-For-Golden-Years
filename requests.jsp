<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>All Requests</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>All Service Requests</h3>
  <% List<Request> list = new RequestDAO().getAll(); %>
  <div class="table-responsive mt-3"><table class="table table-bordered bg-white align-middle">
    <thead class="table-light"><tr>
      <th>#</th><th>Senior</th><th>Volunteer</th><th>Category</th>
      <th>Description</th><th>Date</th><th>Level</th><th>Status</th>
    </tr></thead><tbody>
    <% if (list.isEmpty()) { %>
      <tr><td colspan="8" class="text-center text-muted">No requests in the system.</td></tr>
    <% } else { for (Request r : list) {
         String cls = "badge-pending";
         if ("ACCEPTED".equals(r.getStatus()))  cls = "badge-accepted";
         if ("COMPLETED".equals(r.getStatus())) cls = "badge-completed";
    %>
      <tr>
        <td><%= r.getRequestId() %></td>
        <td><%= r.getSeniorName() %></td>
        <td><%= r.getVolunteerName() == null ? "-" : r.getVolunteerName() %></td>
        <td><%= r.getCategory() %></td>
        <td><%= r.getDescription() %></td>
        <td><%= r.getRequestDate() %></td>
        <td><%= r.getEmergencyLevel() %></td>
        <td><span class="badge <%= cls %>"><%= r.getStatus() %></span></td>
      </tr>
    <% } } %>
    </tbody></table></div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
