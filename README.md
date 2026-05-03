# Health Monitoring & Early Warning System (HealthGuard)

![Java](https://img.shields.io/badge/Java-21-orange.svg)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.3-brightgreen.svg)
![MySQL](https://img.shields.io/badge/MySQL-Database-blue.svg)

**HealthGuard** is a modern, web-based platform designed to track vital health metrics (Temperature, Heart Rate, and Oxygen levels) and provide automated, real-time alerts when a user's health data exceeds standard medical thresholds.

## 🎯 Features
* **Digital Health Records:** Securely log and monitor vital signs over time.
* **Early Warning Triage:** Rule-based logic automatically categorizes health data into Normal, Warning, or Critical states.
* **Secure User Authentication:** Private patient profiles with robust login/signup via Spring Security and LocalStorage.
* **Health Dashboard:** A central hub to review overall health stats, active alerts, and medical history.

## 🛠️ Technology Stack
* **Backend:** Spring Boot 3.2.3, Java 21
* **Database:** MySQL with Hibernate (JPA)
* **Frontend:** Vanilla HTML5, CSS3, ES6 JavaScript
* **API:** RESTful Architecture (JSON)
* **Tools:** Apache Maven, Lombok

## 🚀 Setup & Installation

### Prerequisites
* **Java 17 or 21** installed.
* **Apache Maven** installed.
* **MySQL Server** running locally on port `3306`.

### Running the Application

1. **Configure the Database:**
   Ensure your local MySQL server is running. By default, the application connects using:
   * Username: `root`
   * Password: `root25`
   
   *(You can modify these credentials in `src/main/resources/application.properties` if needed).*

2. **Start the Server:**
   Open a terminal in the project directory and run:
   ```bash
   mvn clean spring-boot:run
   ```
   *Alternatively, if you are on Windows, you can simply double-click the `run_project.bat` script.*

3. **Access the App:**
   Once the server starts, open your web browser and navigate to:
   [http://localhost:8081](http://localhost:8081)

## 📁 Documentation
For more in-depth information about the project's architecture, database schema, and future scope, please refer to:
* [`HealthGuard_Project_Report.md`](HealthGuard_Project_Report.md)
* [`HealthGuard_Presentation_Guide.md`](HealthGuard_Presentation_Guide.md)
