<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add Health Data - HealthGuard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="bg-light">
    <%@ include file="includes/header.jsp" %>
        <div class="container py-5 text-center">
            <h2 class="mb-4">Enter Health Parameters</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card p-5 text-start">
                        <% String error=request.getParameter("error"); %>
                            <% if (error !=null) { %>
                                <div class="alert alert-danger">
                                    <%= error %>
                                </div>
                                <% } %>
                                    <form action="HealthDataServlet" method="post">
                                        <div class="mb-3">
                                            <label class="form-label">Body Temperature (°C)</label>
                                            <input type="number" step="0.1" name="temperature" class="form-control"
                                                required placeholder="e.g., 37.0">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Heart Rate (BPM)</label>
                                            <input type="number" name="heart_rate" class="form-control" required
                                                placeholder="e.g., 72">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Oxygen Level (%)</label>
                                            <input type="number" name="oxygen_level" class="form-control" required
                                                placeholder="e.g., 98">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-lg w-100 mt-3">Submit
                                            Records</button>
                                    </form>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>