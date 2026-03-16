<%@ page import="com.health.dao.*, com.health.model.*, java.util.*" %>
    <% User user=(User) session.getAttribute("user"); if (user==null) { response.sendRedirect("login.jsp"); return; }
        HealthDataDAO dao=new HealthDataDAO(); List<HealthData> records = dao.getHealthRecordsByUserId(user.getId());
        %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Alerts - HealthGuard</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/style.css">
        </head>

        <body class="bg-light">
            <%@ include file="includes/header.jsp" %>
                <div class="container py-5">
                    <h2 class="mb-4">Health Alerts & Warnings</h2>
                    <div class="row g-3">
                        <% for (HealthData data : records) { String status=data.getAlertStatus(); String
                            statusClass="status-critical" ; String alertIcon="🚨" ; String badgeClass="bg-danger" ; if
                            ("Normal".equalsIgnoreCase(status)) { statusClass="status-normal" ; alertIcon="✅" ;
                            badgeClass="bg-success" ; } else if ("Warning".equalsIgnoreCase(status)) {
                            statusClass="status-warning" ; alertIcon="⚠️" ; badgeClass="bg-warning" ; } %>
                            <div class="col-12">
                                <div class="card p-3 alert-card <%= statusClass %>">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h5 class="mb-1">
                                                <%= alertIcon %>
                                                    <%= data.getAlertMessage() %>
                                            </h5>
                                            <small class="text-muted">
                                                <%= data.getDate() %>
                                            </small>
                                        </div>
                                        <span class="badge <%= badgeClass %> fw-bold">
                                            <%= status.toUpperCase() %>
                                        </span>
                                    </div>
                                    <hr class="my-2">
                                    <small>Temp: <%= data.getTemperature() %>°C | HR: <%= data.getHeartRate() %> BPM |
                                                O2: <%= data.getOxygenLevel() %>%</small>
                                </div>
                            </div>
                            <% } %>
                                <% if (records.isEmpty()) { %>
                                    <div class="col-12 text-center py-5">
                                        <p class="lead text-muted">No alerts found. Please add health data.</p>
                                    </div>
                                    <% } %>
                    </div>
                </div>
        </body>

        </html>