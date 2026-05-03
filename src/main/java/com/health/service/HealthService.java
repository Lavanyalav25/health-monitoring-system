package com.health.service;

import com.health.entity.HealthData;
import com.health.entity.User;
import com.health.entity.Alert;
import com.health.repository.HealthDataRepository;
import com.health.repository.AlertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class HealthService {
    @Autowired
    private HealthDataRepository healthDataRepository;

    @Autowired
    private AlertRepository alertRepository;

    public HealthData addHealthData(HealthData data) {
        HealthData saved = healthDataRepository.save(data);
        generateAlerts(saved);
        return saved;
    }

    public List<HealthData> getHistory(User user) {
        return healthDataRepository.findByUserOrderByIdDesc(user);
    }

    public List<Alert> getAlerts(User user) {
        return alertRepository.findByUserOrderByCreatedAtDesc(user);
    }

    private void generateAlerts(HealthData data) {
        if (data.getTemperature() > 38) {
            saveAlert(data, "Fever Alert", "Critical body temperature detected: " + data.getTemperature() + "°C", "Critical");
        }
        if (data.getHeartRate() > 100) {
            saveAlert(data, "High Heart Rate", "Tachycardia warning: " + data.getHeartRate() + " BPM", "Warning");
        }
        if (data.getOxygenLevel() < 95) {
            saveAlert(data, "Low Oxygen", "Hypoxia warning: Oxygen saturation dropped to " + data.getOxygenLevel() + "%", "Critical");
        }
    }

    private void saveAlert(HealthData data, String type, String msg, String status) {
        Alert alert = new Alert();
        alert.setUser(data.getUser());
        alert.setHealthData(data);
        alert.setType(type);
        alert.setMessage(msg);
        alert.setStatus(status);
        alertRepository.save(alert);
    }
}
