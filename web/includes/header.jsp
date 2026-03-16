<%@ page import="com.health.model.User" %>
    <% User _headerUser=(User) session.getAttribute("user"); %>
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                    <span class="fs-4 fw-bold">HealthGuard</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <% if (_headerUser !=null) { %>
                            <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                            <li class="nav-item"><a class="nav-link" href="add_health_data.jsp">Add Data</a></li>
                            <li class="nav-item"><a class="nav-link" href="alerts.jsp">Alerts</a></li>
                            <li class="nav-item"><a class="nav-link" href="records.jsp">Records</a></li>
                            <li class="nav-item btn btn-outline-light ms-2"><a class="nav-link p-0 text-white"
                                    href="LogoutServlet">Logout (<%= _headerUser.getName() %>)</a></li>
                            <% } else { %>
                                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                                <li class="nav-item"><a class="nav-link btn btn-light text-primary px-3 ms-2"
                                        href="signup.jsp">Sign Up</a></li>
                                <% } %>
                    </ul>
                </div>
            </div>
        </nav>