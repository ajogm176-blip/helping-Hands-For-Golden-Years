<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Seniors</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>Registered Seniors</h3>
  <% List<User> seniors = new UserDAO().findByRole("SENIOR"); %>
  <div class="table-responsive mt-3"><table class="table table-bordered bg-white align-middle">
    <thead class="table-light"><tr>
      <th>#</th><th>Name</th><th>Age</th><th>Gender</th><th>Phone</th><th>Email</th><th>Address</th>
    </tr></thead><tbody>
    <% if (seniors.isEmpty()) { %>
      <tr><td colspan="7" class="text-center text-muted">No seniors registered.</td></tr>
    <% } else { for (User s : seniors) { %>
      <tr>
        <td><%= s.getUserId() %></td><td><%= s.getName() %></td><td><%= s.getAge() %></td>
        <td><%= s.getGender() %></td><td><%= s.getPhone() %></td><td><%= s.getEmail() %></td>
        <td><%= s.getAddress() %></td>
      </tr>
    <% } } %>
    </tbody></table></div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
