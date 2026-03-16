<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - HealthGuard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="bg-light">
    <%@ include file="includes/header.jsp" %>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card p-4">
                        <h2 class="text-center text-primary mb-4">Create Account</h2>
                        <% String error=request.getParameter("error"); %>
                            <% if (error !=null) { %>
                                <div class="alert alert-danger">
                                    <%= error %>
                                </div>
                                <% } %>
                                    <form action="SignupServlet" method="post">
                                        <div class="mb-3">
                                            <label class="form-label">Full Name</label>
                                            <input type="text" name="name" class="form-control" required
                                                placeholder="John Doe">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input type="email" name="email" class="form-control" required
                                                placeholder="john@example.com">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Password</label>
                                            <input type="password" name="password" class="form-control" required
                                                placeholder="Create password">
                                        </div>
                                        <button type="submit" class="btn btn-primary w-100">Sign Up</button>
                                    </form>
                                    <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login</a>
                                    </p>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>