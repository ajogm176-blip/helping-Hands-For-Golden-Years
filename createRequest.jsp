<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hhgy.model.*,com.hhgy.dao.*,java.util.*" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<title>Create Request</title></head><body>
<jsp:include page="/jsp/common/header.jsp"/>
<div class="container mt-4" style="max-width:720px;">
  <h3>Create New Service Request</h3>
  <div class="card shadow-sm mt-3"><div class="card-body">
    <form action="${pageContext.request.contextPath}/CreateRequestServlet" method="post">
      <div class="row g-3">
        <div class="col-md-6">
          <label class="form-label">Service Category</label>
          <select name="category" class="form-select" required>
            <option value="Medical Help">Medical Help</option>
            <option value="Grocery Purchase">Grocery Purchase</option>
            <option value="Bill Payment">Bill Payment</option>
            <option value="Transportation">Transportation</option>
            <option value="Digital Assistance">Digital Assistance</option>
          </select>
        </div>
        <div class="col-md-6">
          <label class="form-label">Emergency Level</label>
          <select name="emergencyLevel" class="form-select" required>
            <option value="LOW">Low</option>
            <option value="MEDIUM" selected>Medium</option>
            <option value="HIGH">High</option>
          </select>
        </div>
        <div class="col-12">
          <label class="form-label">Description</label>
          <textarea name="description" class="form-control" rows="3" required></textarea>
        </div>
        <div class="col-md-8">
          <label class="form-label">Address</label>
          <input type="text" name="address" class="form-control" required>
        </div>
        <div class="col-md-4">
          <label class="form-label">Preferred Date</label>
          <input type="date" name="requestDate" class="form-control" required>
        </div>
      </div>
      <button class="btn btn-primary mt-4">Submit Request</button>
    </form>
  </div></div>
</div>
<jsp:include page="/jsp/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body></html>
