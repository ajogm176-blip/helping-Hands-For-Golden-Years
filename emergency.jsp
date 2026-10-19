<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Emergency Contacts</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>Emergency Contacts</h3>

  <div class="card shadow-sm mt-3"><div class="card-body">
    <h6>Add a Contact</h6>
    <form action="${pageContext.request.contextPath}/EmergencyContactServlet" method="post" class="row g-2">
      <div class="col-md-4"><input name="contactName" class="form-control" placeholder="Name" required></div>
      <div class="col-md-3"><input name="relationship" class="form-control" placeholder="Relationship" required></div>
      <div class="col-md-3"><input name="phone" class="form-control" placeholder="Phone" required></div>
      <div class="col-md-2"><button class="btn btn-primary w-100">Add</button></div>
    </form>
  </div></div>

  <%
    User u = (User) session.getAttribute("user");
    List<EmergencyContact> contacts = new EmergencyContactDAO().getBySenior(u.getUserId());
  %>
  <div class="table-responsive mt-4"><table class="table table-bordered bg-white align-middle">
    <thead class="table-light"><tr><th>#</th><th>Name</th><th>Relationship</th><th>Phone</th><th></th></tr></thead>
    <tbody>
    <% if (contacts.isEmpty()) { %>
      <tr><td colspan="5" class="text-center text-muted">No contacts added.</td></tr>
    <% } else { for (EmergencyContact ec : contacts) { %>
      <tr>
        <td><%= ec.getContactId() %></td>
        <td><%= ec.getContactName() %></td>
        <td><%= ec.getRelationship() %></td>
        <td><%= ec.getPhone() %></td>
        <td>
          <a class="btn btn-sm btn-danger"
             href="${pageContext.request.contextPath}/EmergencyContactServlet?action=delete&id=<%= ec.getContactId() %>"
             onclick="return confirmAction('Delete this contact?')">Delete</a>
        </td>
      </tr>
    <% } } %>
    </tbody></table></div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
