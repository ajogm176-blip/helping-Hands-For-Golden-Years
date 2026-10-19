<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Volunteer Dashboard</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4">
  <h3>Volunteer Dashboard</h3>
  <div class="row g-3 mt-2">
    <div class="col-md-4 col-6"><a class="dash-tile" href="available.jsp"><div class="icon">📋</div><strong>Available Requests</strong></a></div>
    <div class="col-md-4 col-6"><a class="dash-tile" href="myAccepted.jsp"><div class="icon">✅</div><strong>My Accepted Tasks</strong></a></div>
    <div class="col-md-4 col-6"><a class="dash-tile" href="profile.jsp"><div class="icon">👤</div><strong>Profile</strong></a></div>
  </div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
