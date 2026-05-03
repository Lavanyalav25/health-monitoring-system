<%@ page import="com.health.entity.*, com.health.service.*, java.util.*" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<% 
    User user = (User) session.getAttribute("user"); 
    if (user == null) { response.sendRedirect("login.jsp"); return; }
    
    WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    HealthService healthService = context.getBean(HealthService.class);
    
    List<HealthData> history = healthService.getHistory(user);
    List<Alert> alerts = healthService.getAlerts(user);
    int totalRecords = history.size();
    
    String healthStatus = "NORMAL";
    String statusClass = "bg-success";
    if (!history.isEmpty()) {
        HealthData latest = history.get(0);
        if (latest.getTemperature() > 38 || latest.getHeartRate() > 100 || latest.getOxygenLevel() < 95) {
            healthStatus = "ABNORMAL";
            statusClass = "bg-danger";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Settings - HealthGuard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .profile-card { border-radius: 15px; border: none; }
        .avatar-circle {
            width: 100px; height: 100px;
            background: #007bff; color: white;
            border-radius: 50%; display: flex;
            align-items: center; justify-content: center;
            font-size: 40px; font-weight: bold;
            margin: 0 auto 20px;
        }
    </style>
</head>
<body class="bg-light">
    <%@ include file="includes/header.jsp" %>
    
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card profile-card shadow-sm p-4 text-center">
                    <div class="avatar-circle shadow-sm">
                        <%= user.getName().substring(0, 1).toUpperCase() %>
                    </div>
                    <h3 class="fw-bold mb-1"><%= user.getName() %></h3>
                    <p class="text-muted small mb-4"><%= user.getEmail() %></p>
                    
                    <div class="bg-light rounded-3 p-3 text-start mb-3">
                        <div class="d-flex justify-content-between mb-2">
                            <small class="text-muted fw-bold caps-small">RECORDS</small>
                            <span class="badge bg-primary rounded-pill"><%= totalRecords %></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <small class="text-muted fw-bold caps-small">STATUS</small>
                            <span class="badge <%= statusClass %> rounded-pill"><%= healthStatus %></span>
                        </div>
                    </div>
                    <div class="mt-2">
                         <span class="badge bg-success-subtle text-success border border-success-subtle px-3 py-2 rounded-pill w-100">Identity Verified</span>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-8">
                <% String msg = request.getParameter("msg"); %>
                <% String error = request.getParameter("error"); %>
                <% if (msg != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fa fa-check-circle me-2"></i> <%= msg %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <% } %>
                <% if (error != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fa fa-exclamation-triangle me-2"></i> <%= error %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <% } %>

                <div class="card profile-card shadow-sm p-4 mb-4">
                    <h5 class="fw-bold text-primary mb-4"><i class="fa fa-id-card me-2"></i> Account Information</h5>
                    <form action="ProfileServlet" method="POST">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Full Name</label>
                                <input type="text" name="name" class="form-control form-control-lg" value="<%= user.getName() %>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Registered Email</label>
                                <input type="email" class="form-control form-control-lg bg-light" value="<%= user.getEmail() %>" readonly>
                                <small class="text-muted">Email cannot be changed for security reasons.</small>
                            </div>
                            <div class="col-12 mt-4">
                                <button type="submit" class="btn btn-primary btn-lg px-4 shadow-sm">Update Details</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="card profile-card shadow-sm p-4 text-start">
                    <h5 class="fw-bold text-danger mb-4"><i class="fa fa-shield-alt me-2"></i> Security: Change Password</h5>
                    <form action="ProfileServlet" method="POST">
                        <input type="hidden" name="name" value="<%= user.getName() %>">
                        <div class="row g-3 align-items-end">
                            <div class="col-md-8">
                                <label class="form-label text-muted small fw-bold">New Secure Password</label>
                                <input type="password" name="password" class="form-control form-control-lg" placeholder="••••••••" required>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-outline-danger btn-lg w-100 shadow-sm">Update Password</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
