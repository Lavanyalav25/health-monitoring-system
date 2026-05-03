package com.health.controller;

import com.health.entity.User;
import com.health.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.io.IOException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        
        WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        UserService userService = context.getBean(UserService.class);

        try {
            User updatedUser = userService.updateProfile(currentUser.getId(), name, password);
            session.setAttribute("user", updatedUser);
            response.sendRedirect("profile.jsp?msg=Profile updated successfully");
        } catch (Exception e) {
            response.sendRedirect("profile.jsp?error=" + e.getMessage());
        }
    }
}
