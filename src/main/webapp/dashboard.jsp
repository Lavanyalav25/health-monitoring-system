<%@ page import="com.health.entity.*, com.health.service.*, java.util.*" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
    <% 
        User user=(User) session.getAttribute("user"); 
        if (user==null) { response.sendRedirect("login.jsp"); return; }
        
        WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        HealthService healthService = context.getBean(HealthService.class);
        UserService userService = context.getBean(UserService.class);
        
        List<HealthData> records = healthService.getHistory(user);
        List<Alert> alerts = healthService.getAlerts(user);
        
        int totalRecords = records.size();
        int totalAlerts = alerts.size();
        long totalUsers = userService.getTotalUsers();
    %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Dashboard - HealthGuard</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/style.css">
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        </head>

        <body>
            <%@ include file="includes/header.jsp" %>
                <div class="container py-5">
                    <h2 class="mb-4">Welcome, <%= user.getName() %>
                    </h2>

                    <div class="row g-4 mb-5">
                        <div class="col-md-4">
                            <div class="card p-4 bg-primary text-white text-center">
                                <h5>Total Users</h5>
                                <h2 class="display-4 fw-bold">
                                    <%= totalUsers %>
                                </h2>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card p-4 bg-info text-white text-center">
                                <h5>My Health Records</h5>
                                <h2 class="display-4 fw-bold">
                                    <%= totalRecords %>
                                </h2>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card p-4 bg-danger text-white text-center">
                                <h5>Total Alerts</h5>
                                <h2 class="display-4 fw-bold">
                                    <%= totalAlerts %>
                                </h2>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="card p-4">
                                <h5 class="mb-3">Temperature Trends (°C)</h5>
                                <canvas id="tempChart"></canvas>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="card p-4">
                                <h5 class="mb-3">Heart Rate Statistics (BPM)</h5>
                                <canvas id="hrChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    const dates = [<% for (int i = records.size() - 1; i >= 0; i--) { %> "<%= records.get(i).getDate().toString().substring(5,16) %>",<% } %>];
                    const temps = [<% for (int i = records.size() - 1; i >= 0; i--) { %><%= records.get(i).getTemperature() %>,<% } %>];
                    const hrs = [<% for (int i = records.size() - 1; i >= 0; i--) { %><%= records.get(i).getHeartRate() %>,<% } %>];

                    new Chart(document.getElementById('tempChart'), {
                        type: 'line',
                        data: {
                            labels: dates,
                            datasets: [{
                                label: 'Temperature',
                                data: temps,
                                borderColor: '#0056b3',
                                fill: false,
                                tension: 0.1
                            }]
                        }
                    });

                    new Chart(document.getElementById('hrChart'), {
                        type: 'bar',
                        data: {
                            labels: dates,
                            datasets: [{
                                label: 'Heart Rate',
                                data: hrs,
                                backgroundColor: '#00aaff'
                            }]
                        }
                    });
                </script>
        </body>

        </html>