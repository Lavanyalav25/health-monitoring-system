# Health Monitoring System (HealthGuard)

HealthGuard is a modern, web-based platform designed to track vital health metrics (Temperature, Heart Rate, and Oxygen Level) and provide automated, real-time alerts when health data exceeds standard medical thresholds.

---

## 🎯 Features

- Digital Health Records
- Real-Time Health Monitoring
- Automated Health Alerts
- Secure User Authentication
- Health Dashboard
- Medical History Tracking

---

## 🛠️ Technology Stack

- Backend: Spring Boot 3.2.3, Java 21
- Database: MySQL
- Frontend: HTML5, CSS3, JavaScript
- API: RESTful API
- Tools: Maven, Lombok

---

## 🚀 Setup & Installation

### Prerequisites

- Java 21
- Apache Maven
- MySQL Server

### Database

Create a database:

```sql
CREATE DATABASE healthguard;
```

Update `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/healthguard
spring.datasource.username=YOUR_USERNAME
spring.datasource.password=YOUR_PASSWORD
```

### Run the Application

```bash
mvn clean spring-boot:run
```

Open your browser and visit:

```
http://localhost:8081
```

---

## 📁 Documentation

- HealthGuard_Project_Report.md
- HealthGuard_Presentation_Guide.md
