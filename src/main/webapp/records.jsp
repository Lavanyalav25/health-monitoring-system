<%@ page import="com.health.entity.*, com.health.service.*, java.util.*" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
    <% 
        User user=(User) session.getAttribute("user"); 
        if (user==null) { response.sendRedirect("login.jsp"); return; }
        
        WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        HealthService healthService = context.getBean(HealthService.class);
        
        List<HealthData> records = healthService.getHistory(user);
    %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Health Records - HealthGuard</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/style.css">
        </head>

        <body class="bg-light">
            <%@ include file="includes/header.jsp" %>
                <div class="container py-5">
                    <h2 class="mb-4 text-primary">Your Health Records</h2>
                    <% String msg=request.getParameter("msg"); %>
                        <% if (msg !=null) { %>
                            <div class="alert alert-success">
                                <%= msg %>
                            </div>
                            <% } %>
                                <div class="card p-0 shadow-sm border-0">
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th class="ps-4">Date</th>
                                                    <th>Temperature (°C)</th>
                                                    <th>Heart Rate (BPM)</th>
                                                    <th>Oxygen Level (%)</th>
                                                    <th class="pe-4 text-end">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (HealthData data : records) { %>
                                                    <tr>
                                                        <td class="ps-4 text-muted">
                                                            <%= data.getDate().toString().substring(0, 16) %>
                                                        </td>
                                                        <td class="fw-bold text-primary">
                                                            <%= data.getTemperature() %>
                                                        </td>
                                                        <td>
                                                            <%= data.getHeartRate() %>
                                                        </td>
                                                        <td>
                                                            <%= data.getOxygenLevel() %>%
                                                        </td>
                                                        <td class="pe-4 text-end">
                                                            <% String badgeClass="bg-danger" ; if
                                                                ("Normal".equalsIgnoreCase(data.getAlertStatus())) {
                                                                badgeClass="bg-success" ; } %>
                                                                <span class="badge <%= badgeClass %>">
                                                                    <%= data.getAlertStatus() %>
                                                                </span>
                                                        </td>
                                                    </tr>
                                                    <% } %>
                                                        <% if (records.isEmpty()) { %>
                                                            <tr>
                                                                <td colspan="5" class="text-center py-5">No records
                                                                    available. <a href="add_health_data.jsp">Add now</a>
                                                                </td>
                                                            </tr>
                                                            <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                </div>
        </body>

        </html>