package com.health.model;

import java.sql.Timestamp;

public class HealthData {
    private int id;
    private int userId;
    private double temperature;
    private int heartRate;
    private int oxygenLevel;
    private Timestamp date;

    public HealthData() {}
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public double getTemperature() { return temperature; }
    public void setTemperature(double temperature) { this.temperature = temperature; }
    public int getHeartRate() { return heartRate; }
    public void setHeartRate(int heartRate) { this.heartRate = heartRate; }
    public int getOxygenLevel() { return oxygenLevel; }
    public void setOxygenLevel(int oxygenLevel) { this.oxygenLevel = oxygenLevel; }
    public Timestamp getDate() { return date; }
    public void setDate(Timestamp date) { this.date = date; }

    public String getAlertStatus() {
        if (temperature > 38 || heartRate > 100 || oxygenLevel < 95) {
            if (temperature > 39 || heartRate > 120 || oxygenLevel < 90) return "Critical";
            return "Warning";
        }
        return "Normal";
    }

    public String getAlertMessage() {
        StringBuilder msg = new StringBuilder();
        if (temperature > 38) msg.append("Fever Alert! ");
        if (heartRate > 100) msg.append("High Heart Rate Alert! ");
        if (oxygenLevel < 95) msg.append("Low Oxygen level! ");
        return msg.toString().isEmpty() ? "All systems normal" : msg.toString();
    }
}
