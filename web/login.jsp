<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - HealthGuard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="bg-light">
    <%@ include file="includes/header.jsp" %>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card p-4">
                        <h2 class="text-center text-primary mb-4">Login</h2>
                        <% String msg=request.getParameter("msg"); %>
                            <% String error=request.getParameter("error"); %>
                                <% if (msg !=null) { %>
                                    <div class="alert alert-success">
                                        <%= msg %>
                                    </div>
                                    <% } %>
                                        <% if (error !=null) { %>
                                            <div class="alert alert-danger">
                                                <%= error %>
                                            </div>
                                            <% } %>
                                                <form action="LoginServlet" method="post">
                                                    <div class="mb-3">
                                                        <label class="form-label">Email</label>
                                                        <input type="email" name="email" class="form-control" required
                                                            placeholder="Enter your email">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Password</label>
                                                        <input type="password" name="password" class="form-control"
                                                            required placeholder="Enter password">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary w-100">Login</button>
                                                </form>
                                                <p class="text-center mt-3">Don't have an account? <a
                                                        href="signup.jsp">Sign up here</a></p>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>