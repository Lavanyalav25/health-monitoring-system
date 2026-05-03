package com.health.controller;

import com.health.entity.HealthData;
import com.health.entity.User;
import com.health.entity.Alert;
import com.health.service.HealthService;
import com.health.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@RestController
@RequestMapping("/api/health")
@CrossOrigin(origins = "*")
public class HealthController {
    @Autowired
    private HealthService healthService;

    @Autowired
    private UserService userService;

    @PostMapping("/add/{userId}")
    public ResponseEntity<?> addData(@PathVariable Integer userId, @RequestBody HealthData data) {
        User user = new User();
        user.setId(userId);
        data.setUser(user);
        
        HealthData savedData = healthService.addHealthData(data);
        return ResponseEntity.ok(savedData);
    }

    @GetMapping("/history/{userId}")
    public ResponseEntity<List<HealthData>> getHistory(@PathVariable Integer userId) {
        User user = new User();
        user.setId(userId);
        return ResponseEntity.ok(healthService.getHistory(user));
    }

    @GetMapping("/alerts/{userId}")
    public ResponseEntity<List<Alert>> getAlerts(@PathVariable Integer userId) {
        User user = new User();
        user.setId(userId);
        return ResponseEntity.ok(healthService.getAlerts(user));
    }

    @GetMapping("/stats/{userId}")
    public ResponseEntity<Map<String, Object>> getStats(@PathVariable Integer userId) {
        User user = new User();
        user.setId(userId);
        List<HealthData> history = healthService.getHistory(user);
        List<Alert> alerts = healthService.getAlerts(user);
        
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalRecords", history.size());
        stats.put("totalAlerts", alerts.size());
        stats.put("totalUsers", userService.getTotalUsers());
        
        return ResponseEntity.ok(stats);
    }
}
