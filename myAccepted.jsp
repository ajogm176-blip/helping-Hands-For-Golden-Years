<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>My Accepted Tasks</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>My Accepted Tasks</h3>
  <%
    User u = (User) session.getAttribute("user");
    List<Request> list = new RequestDAO().getByVolunteer(u.getUserId());
  %>
  <% if (list.isEmpty()) { %>
    <div class="alert alert-info mt-3">You have not accepted any requests yet.</div>
  <% } else { %>
    <div class="table-responsive mt-3"><table class="table table-bordered bg-white align-middle">
      <thead class="table-light"><tr>
        <th>#</th><th>Senior</th><th>Category</th><th>Description</th>
        <th>Address</th><th>Date</th><th>Status</th><th>Action</th>
      </tr></thead><tbody>
      <% for (Request r : list) {
           String cls = "badge-pending";
           if ("ACCEPTED".equals(r.getStatus()))  cls = "badge-accepted";
           if ("COMPLETED".equals(r.getStatus())) cls = "badge-completed";
      %>
        <tr>
          <td><%= r.getRequestId() %></td>
          <td><%= r.getSeniorName() %></td>
          <td><%= r.getCategory() %></td>
          <td><%= r.getDescription() %></td>
          <td><%= r.getAddress() %></td>
          <td><%= r.getRequestDate() %></td>
          <td><span class="badge <%= cls %>"><%= r.getStatus() %></span></td>
          <td>
            <% if ("ACCEPTED".equals(r.getStatus())) { %>
              <a class="btn btn-primary btn-sm"
                 href="${pageContext.request.contextPath}/RequestActionServlet?action=complete&id=<%= r.getRequestId() %>"
                 onclick="return confirmAction('Mark this request as completed?')">Complete</a>
            <% } else { %>—<% } %>
          </td>
        </tr>
      <% } %>
      </tbody></table></div>
  <% } %>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
