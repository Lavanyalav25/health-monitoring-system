package com.health.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "health_data")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HealthData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    @JsonIgnore
    private User user;

    @Column(nullable = false)
    private Double temperature;

    @Column(nullable = false)
    private Integer heartRate;

    @Column(nullable = false)
    private Integer oxygenLevel;

    @Column(nullable = false)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime date = LocalDateTime.now();

    @JsonIgnore
    public String getAlertStatus() {
        if (temperature > 38 || heartRate > 100 || oxygenLevel < 95) {
            if (temperature > 39 || heartRate > 120 || oxygenLevel < 90) return "Critical";
            return "Warning";
        }
        return "Normal";
    }

    @JsonIgnore
    public String getAlertMessage() {
        StringBuilder msg = new StringBuilder();
        if (temperature > 38) msg.append("Fever Alert! ");
        if (heartRate > 100) msg.append("High Heart Rate Alert! ");
        if (oxygenLevel < 95) msg.append("Low Oxygen level! ");
        return msg.toString().isEmpty() ? "All systems normal" : msg.toString();
    }
}
