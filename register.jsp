<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>Register – Helping Hands</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container" style="max-width:640px; margin-top:50px; margin-bottom:50px;">
  <div class="card shadow-sm">
    <div class="card-body p-4">
      <h3 class="text-center mb-4">Create Account</h3>

      <% String err = (String) request.getAttribute("error"); %>
      <% if (err != null) { %>
        <div class="alert alert-danger py-2"><%= err %></div>
      <% } %>

      <form action="RegisterServlet" method="post">
        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">Register as</label>
            <select name="role" id="role" class="form-select" required onchange="toggleVol()">
              <option value="SENIOR">Senior Citizen</option>
              <option value="VOLUNTEER">Volunteer</option>
            </select>
          </div>
          <div class="col-md-6">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" required>
          </div>
          <div class="col-md-3">
            <label class="form-label">Age</label>
            <input type="number" name="age" class="form-control" min="1" max="120" required>
          </div>
          <div class="col-md-3">
            <label class="form-label">Gender</label>
            <select name="gender" class="form-select">
              <option>Male</option><option>Female</option><option>Other</option>
            </select>
          </div>
          <div class="col-md-6">
            <label class="form-label">Phone</label>
            <input type="tel" name="phone" class="form-control" required>
          </div>
          <div class="col-12">
            <label class="form-label">Address</label>
            <textarea name="address" class="form-control" rows="2" required></textarea>
          </div>
          <div class="col-md-6">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" minlength="4" required>
          </div>
          <div class="col-12" id="volRow" style="display:none;">
            <label class="form-label">ID Proof Number (Aadhaar / PAN / Voter ID)</label>
            <input type="text" name="idProof" class="form-control">
            <small class="text-muted">Volunteer accounts require admin approval before login.</small>
          </div>
        </div>
        <button class="btn btn-primary w-100 mt-4">Register</button>
      </form>
      <p class="text-center mt-3 mb-0">
        Already registered? <a href="login.jsp">Login</a>
      </p>
    </div>
  </div>
</div>

<script>
function toggleVol(){
    document.getElementById('volRow').style.display =
        document.getElementById('role').value === 'VOLUNTEER' ? 'block' : 'none';
}
</script>
</body>
</html>
