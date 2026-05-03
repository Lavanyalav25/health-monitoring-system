package com.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RedirectController {
    
    @GetMapping("/")
    public String redirectToLogin() {
        return "redirect:/login.jsp";
    }

    @GetMapping("/signup")
    public String redirectToSignup() {
        return "redirect:/signup.jsp";
    }

    @GetMapping("/profile")
    public String redirectToProfile() {
        return "redirect:/profile.jsp";
    }
}
