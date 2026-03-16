CREATE DATABASE IF NOT EXISTS health_monitoring;
USE health_monitoring;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS health_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    temperature DECIMAL(5,2) NOT NULL,
    heart_rate INT NOT NULL,
    oxygen_level INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Sample Data
INSERT INTO users (name, email, password) VALUES ('John Doe', 'john@example.com', 'password123');
INSERT INTO health_data (user_id, temperature, heart_rate, oxygen_level) VALUES (1, 37.0, 72, 98);
INSERT INTO health_data (user_id, temperature, heart_rate, oxygen_level) VALUES (1, 38.5, 105, 94);
