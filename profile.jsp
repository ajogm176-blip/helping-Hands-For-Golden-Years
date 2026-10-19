<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Profile</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4" style="max-width:640px;">
  <h3>My Profile</h3>
  <% User u = (User) session.getAttribute("user"); %>
  <div class="card shadow-sm mt-3"><div class="card-body">
    <form action="${pageContext.request.contextPath}/UpdateProfileServlet" method="post">
      <div class="row g-3">
        <div class="col-md-6"><label class="form-label">Name</label>
          <input name="name" value="<%= u.getName() %>" class="form-control" required></div>
        <div class="col-md-3"><label class="form-label">Age</label>
          <input name="age" type="number" value="<%= u.getAge() %>" class="form-control"></div>
        <div class="col-md-3"><label class="form-label">Gender</label>
          <select name="gender" class="form-select">
            <% for (String g : new String[]{"Male","Female","Other"}) { %>
              <option <%= g.equals(u.getGender()) ? "selected" : "" %>><%= g %></option>
            <% } %>
          </select></div>
        <div class="col-md-6"><label class="form-label">Phone</label>
          <input name="phone" value="<%= u.getPhone() %>" class="form-control"></div>
        <div class="col-md-6"><label class="form-label">Email (read-only)</label>
          <input value="<%= u.getEmail() %>" class="form-control" disabled></div>
        <div class="col-12"><label class="form-label">Address</label>
          <textarea name="address" class="form-control" rows="2"><%= u.getAddress() %></textarea></div>
        <div class="col-12"><label class="form-label">Role</label>
          <input value="<%= u.getRole() %>" class="form-control" disabled></div>
      </div>
      <button class="btn btn-primary mt-3">Update Profile</button>
    </form>
  </div></div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
