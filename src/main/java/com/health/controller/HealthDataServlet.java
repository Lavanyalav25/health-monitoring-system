package com.health.controller;

import com.health.service.HealthService;
import com.health.entity.HealthData;
import com.health.entity.User;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.context.WebApplicationContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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

        WebApplicationContext context = WebApplicationContextUtils
                .getRequiredWebApplicationContext(getServletContext());
        HealthService healthService = context.getBean(HealthService.class);

        HealthData data = new HealthData();
        data.setUser(user);
        data.setTemperature(temp);
        data.setHeartRate(hr);
        data.setOxygenLevel(oxygen);

        try {
            healthService.addHealthData(data);
            response.sendRedirect("records.jsp?msg=Data Added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_health_data.jsp?error=Failed to add data: " + e.getMessage());
        }
    }
}
