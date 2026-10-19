<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Helping Hands for Golden Years</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">🤝 Helping Hands</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div id="nav" class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
        <li class="nav-item"><a class="nav-link" href="#how">How It Works</a></li>
        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        <li class="nav-item"><a class="btn btn-light btn-sm ms-2" href="register.jsp">Register</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero -->
<section class="hero text-center">
  <div class="container">
    <h1 class="display-4">Helping Hands for Golden Years</h1>
    <p class="lead mt-3">Connecting senior citizens with kind volunteers for everyday assistance.</p>
    <a href="register.jsp" class="btn btn-light btn-lg mt-3">Get Started</a>
  </div>
</section>

<!-- About -->
<section id="about" class="section bg-white">
  <div class="container text-center">
    <h2>About the Project</h2>
    <p class="text-muted col-md-8 mx-auto">
      Helping Hands is a community-driven web platform that lets senior citizens request
      everyday assistance—such as medical help, grocery shopping or bill payments—and
      allows verified volunteers to step forward and help.
    </p>
  </div>
</section>

<!-- Services -->
<section id="services" class="section">
  <div class="container">
    <h2 class="text-center">Our Services</h2>
    <div class="row g-4 mt-2">
      <div class="col-md-4"><div class="card feature-card p-4 text-center"><h5>🩺 Medical Help</h5><p class="text-muted small">Doctor visits, medicine pickup, lab tests.</p></div></div>
      <div class="col-md-4"><div class="card feature-card p-4 text-center"><h5>🛒 Grocery Purchase</h5><p class="text-muted small">Daily groceries and essentials delivered.</p></div></div>
      <div class="col-md-4"><div class="card feature-card p-4 text-center"><h5>💡 Bill Payment</h5><p class="text-muted small">Electricity, water and other utility bills.</p></div></div>
      <div class="col-md-4"><div class="card feature-card p-4 text-center"><h5>🚗 Transportation</h5><p class="text-muted small">Help getting to hospitals or family visits.</p></div></div>
      <div class="col-md-4"><div class="card feature-card p-4 text-center"><h5>📱 Digital Assistance</h5><p class="text-muted small">Help with phones, apps and online forms.</p></div></div>
      <div class="col-md-4"><div class="card feature-card p-4 text-center"><h5>🆘 Emergency Contacts</h5><p class="text-muted small">Keep important contacts at your fingertips.</p></div></div>
    </div>
  </div>
</section>

<!-- How it works -->
<section id="how" class="section bg-white">
  <div class="container">
    <h2 class="text-center">How It Works</h2>
    <div class="row text-center mt-4 g-4">
      <div class="col-md-3"><div class="p-3"><h1 class="text-primary">1</h1><h6>Register</h6><p class="small text-muted">Sign up as a senior or volunteer.</p></div></div>
      <div class="col-md-3"><div class="p-3"><h1 class="text-primary">2</h1><h6>Post Request</h6><p class="small text-muted">Seniors post requests for help.</p></div></div>
      <div class="col-md-3"><div class="p-3"><h1 class="text-primary">3</h1><h6>Accept Task</h6><p class="small text-muted">Volunteers accept available requests.</p></div></div>
      <div class="col-md-3"><div class="p-3"><h1 class="text-primary">4</h1><h6>Complete</h6><p class="small text-muted">Task is completed and marked done.</p></div></div>
    </div>
  </div>
</section>

<!-- Contact -->
<section id="contact" class="section">
  <div class="container text-center">
    <h2>Contact Us</h2>
    <p class="text-muted">📧 support@helpinghands.local &nbsp; | &nbsp; 📞 +91-99999-00000</p>
  </div>
</section>

<footer class="text-center">
  <small>&copy; <%= java.time.Year.now() %> Helping Hands for Golden Years – Academic Project</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
