<%@ page import="com.health.entity.User" %>
    <% User user=(User) session.getAttribute("user"); %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Health Monitoring & Early Warning System</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/style.css">
        </head>

        <body>
            <%@ include file="includes/header.jsp" %>

                <section class="hero-section">
                    <div class="container text-center">
                        <h1 class="display-3 fw-bold mb-4">Your Health, Our Priority</h1>
                        <p class="lead mb-5">Monitor your health parameters in real-time and get automated early warning
                            alerts
                            for abnormal conditions.</p>
                        <% if (user==null) { %>
                            <a href="signup.jsp" class="btn btn-light btn-lg text-primary fw-bold mx-2">Get Started</a>
                            <a href="login.jsp" class="btn btn-outline-light btn-lg mx-2">Login</a>
                            <% } else { %>
                                <a href="dashboard.jsp" class="btn btn-light btn-lg text-primary fw-bold">Go to
                                    Dashboard</a>
                                <% } %>
                    </div>
                </section>

                <div class="container py-5">
                    <div class="row text-center g-4">
                        <div class="col-md-4">
                            <div class="card p-4">
                                <h3 class="h4 mb-3 text-primary">Real-time Monitoring</h3>
                                <p class="text-muted">Track temperature, heart rate, and oxygen levels with ease.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card p-4">
                                <h3 class="h4 mb-3 text-primary">Early Warning Alerts</h3>
                                <p class="text-muted">Automated alerts for fever, tachycardia, or low oxygen levels.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card p-4">
                                <h3 class="h4 mb-3 text-primary">Visual Trends</h3>
                                <p class="text-muted">Interactive charts to visualize your health status over time.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>