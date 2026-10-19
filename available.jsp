<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Available Requests</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>Available Requests</h3>
  <% List<Request> list = new RequestDAO().getAvailable(); %>
  <% if (list.isEmpty()) { %>
    <div class="alert alert-info mt-3">No pending requests at the moment.</div>
  <% } else { %>
    <div class="table-responsive mt-3"><table class="table table-bordered bg-white align-middle">
      <thead class="table-light"><tr>
        <th>#</th><th>Senior</th><th>Category</th><th>Description</th>
        <th>Address</th><th>Date</th><th>Level</th><th>Action</th>
      </tr></thead><tbody>
      <% for (Request r : list) { %>
        <tr>
          <td><%= r.getRequestId() %></td>
          <td><%= r.getSeniorName() %></td>
          <td><%= r.getCategory() %></td>
          <td><%= r.getDescription() %></td>
          <td><%= r.getAddress() %></td>
          <td><%= r.getRequestDate() %></td>
          <td><span class="badge bg-secondary"><%= r.getEmergencyLevel() %></span></td>
          <td>
            <a class="btn btn-success btn-sm"
               href="${pageContext.request.contextPath}/RequestActionServlet?action=accept&id=<%= r.getRequestId() %>"
               onclick="return confirmAction('Accept this request?')">Accept</a>
          </td>
        </tr>
      <% } %>
      </tbody></table></div>
  <% } %>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
