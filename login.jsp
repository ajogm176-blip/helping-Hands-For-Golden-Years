<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>Login – Helping Hands</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container" style="max-width:420px; margin-top:80px;">
  <div class="card shadow-sm">
    <div class="card-body p-4">
      <h3 class="text-center mb-4">Login</h3>

      <% String err = (String) request.getAttribute("error"); %>
      <% if (err != null) { %>
        <div class="alert alert-danger py-2"><%= err %></div>
      <% } %>
      <% String msg = (String) session.getAttribute("msg");
         if (msg != null) { session.removeAttribute("msg"); %>
        <div class="alert alert-success py-2"><%= msg %></div>
      <% } %>

      <form action="LoginServlet" method="post">
        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="password" name="password" class="form-control" required>
        </div>
        <button class="btn btn-primary w-100">Login</button>
      </form>

      <p class="text-center mt-3 mb-0">
        New here? <a href="register.jsp">Create an account</a><br>
        <a href="index.jsp" class="small text-muted">← Back to home</a>
      </p>
    </div>
  </div>
</div>

</body>
</html>
