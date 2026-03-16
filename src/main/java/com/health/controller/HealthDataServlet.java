package com.health.controller;

import com.health.dao.HealthDataDAO;
import com.health.model.HealthData;
import com.health.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/HealthDataServlet")
public class HealthDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        double temp = Double.parseDouble(request.getParameter("temperature"));
        int hr = Integer.parseInt(request.getParameter("heart_rate"));
        int oxygen = Integer.parseInt(request.getParameter("oxygen_level"));

        HealthData data = new HealthData();
        data.setUserId(user.getId());
        data.setTemperature(temp);
        data.setHeartRate(hr);
        data.setOxygenLevel(oxygen);

        HealthDataDAO dao = new HealthDataDAO();
        if (dao.addHealthData(data)) {
            response.sendRedirect("records.jsp?msg=Data Added successfully!");
        } else {
            response.sendRedirect("add_health_data.jsp?error=Failed to add data!");
        }
    }
}
