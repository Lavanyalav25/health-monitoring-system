package com.health.dao;

import com.health.model.HealthData;
import com.health.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HealthDataDAO {
    public boolean addHealthData(HealthData data) {
        String query = "INSERT INTO health_data (user_id, temperature, heart_rate, oxygen_level) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, data.getUserId());
            ps.setDouble(2, data.getTemperature());
            ps.setInt(3, data.getHeartRate());
            ps.setInt(4, data.getOxygenLevel());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<HealthData> getHealthRecordsByUserId(int userId) {
        List<HealthData> list = new ArrayList<>();
        String query = "SELECT * FROM health_data WHERE user_id = ? ORDER BY date DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HealthData data = new HealthData();
                data.setId(rs.getInt("id"));
                data.setUserId(rs.getInt("user_id"));
                data.setTemperature(rs.getDouble("temperature"));
                data.setHeartRate(rs.getInt("heart_rate"));
                data.setOxygenLevel(rs.getInt("oxygen_level"));
                data.setDate(rs.getTimestamp("date"));
                list.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalAlerts(int userId) {
        String query = "SELECT COUNT(*) FROM health_data WHERE (temperature > 38 OR heart_rate > 100 OR oxygen_level < 95) AND user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
                return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalUsers() {
        String query = "SELECT COUNT(*) FROM users";
        try (Connection conn = DBConnection.getConnection();
                Statement st = conn.createStatement()) {
            ResultSet rs = st.executeQuery(query);
            if (rs.next())
                return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
