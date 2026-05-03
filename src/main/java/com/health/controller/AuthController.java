package com.health.controller;

import com.health.entity.User;
import com.health.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
@CrossOrigin(origins = "*")
public class AuthController {
    @Autowired
    private UserService userService;

    @PostMapping("/signup")
    public ResponseEntity<?> signup(@RequestBody User user) {
        if (user.getEmail() == null || user.getPassword() == null) {
            return ResponseEntity.badRequest().body("Email and Password are required");
        }
        return ResponseEntity.ok(userService.register(user));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody User loginUser) {
        Optional<User> user = userService.login(loginUser.getEmail(), loginUser.getPassword());
        if (user.isPresent()) {
            return ResponseEntity.ok(user.get());
        }
        return ResponseEntity.status(401).body("Invalid Email or Password");
    }

    // Aligned with Engineering Prompt: PUT /api/user/update
    @PutMapping("/update")
    public ResponseEntity<?> updateProfile(@RequestBody User userRequest) {
        User updated = userService.updateProfile(userRequest.getId(), userRequest.getName(), null);
        return ResponseEntity.ok(updated);
    }

    // Aligned with Engineering Prompt: PUT /api/user/change-password
    @PutMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestBody Map<String, Object> payload) {
        Integer userId = (Integer) payload.get("id");
        String newPassword = (String) payload.get("password");
        userService.updateProfile(userId, null, newPassword);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/ping")
    public String ping() {
        return "HealthGuard Backend is Operational!";
    }
}
