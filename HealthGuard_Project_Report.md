# Health Monitoring & Early Warning System (HealthGuard)
**Professional Engineering Project Report**

---

## 1. Project Overview
The **Health Monitoring & Early Warning System** (HealthGuard) is a modern web-based platform designed to track vital health metrics and provide automated, real-time alerts when a user's health data exceeds standard medical thresholds.

### 🎯 Objectives:
*   To enable users to record and monitor their Temperature, Heart Rate, and Oxygen levels.
*   To implement a rule-based "Early Warning" system for medical triage (Normal, Warning, Critical).
*   To provide a high-performance, lightweight UI built with core web technologies.
*   To ensure secure data management using a robust Java-based backend.

---

## 2. Technical Stack
The system is built using a modern, standards-compliant stack to ensure scalability and reliability.

| Category | Technology |
| :--- | :--- |
| **Backend** | Spring Boot 3.2.3, Java 21 (JDK) |
| **Database** | MySQL with Hibernate (JPA) |
| **Frontend** | Vanilla HTML5, CSS3, ES6 JavaScript |
| **API** | RESTful Architecture (JSON) |
| **Security** | Spring Security (Persistence via LocalStorage) |
| **Tools** | Apache Maven, Lombok, Jackson |

---

## 3. Core Features
### 🔐 User Authentication
A secure login and signup system allows users to create private profiles. Sessions are managed using **LocalStorage** on the client side and validated via **Spring Security** on the server.

### 📊 Health Dashboard
A central hub where users can see their overall health stats, including:
*   Total number of medical records.
*   Total active alerts (Fever, Heart Rate, Oxygen).
*   Growth trends over time.

### ⚠️ Early Warning System (The Logic)
The core of the system is the automated medical triage. The backend logic categorizes data based on these thresholds:
*   **Critical**: Temperature > 39.0°C OR Heart Rate > 120 bpm OR Oxygen < 90%.
*   **Warning**: Temperature > 38.0°C OR Heart Rate > 100 bpm OR Oxygen < 95%.
*   **Normal**: All values within safe ranges.

### 📜 Digital Health Records
A historical log of all entries, allowing users or doctors to review past performance and identify patterns.

---

## 4. Architectural Highlights
### ✅ The "Vanilla" Frontend approach
Unlike many modern projects that rely on heavy frameworks, this project uses **Pure JavaScript (ES6)**. This demonstrates:
*   Lower bundle sizes and faster performance.
*   Direct interaction with the **DOM (Document Object Model)**.
*   Asynchronous data fetching using the **Fetch API**.

### ✅ Robust Backend (Spring Boot)
The backend uses **Spring Data JPA** to interact with the MySQL database. This ensures:
*   No manual SQL injection risks.
*   Automatic database schema synchronization.
*   Clean, Object-Oriented data management.

---

## 5. Setup and Execution
To run this project locally, ensure you have **Java 21** and **Maven** installed:

1.  **Start MySQL**: Ensure your local database server is running.
2.  **Configure Database**: Update `src/main/resources/application.properties` with your MySQL credentials.
3.  **Run Server**: Execute the following command in the terminal:
    ```bash
    mvn clean spring-boot:run
    ```
4.  **Access App**: Open `http://localhost:8081` in your browser.

---

## 6. Database Schema
| Table | Columns | Purpose |
| :--- | :--- | :--- |
| **`users`** | `id`, `name`, `email`, `password` | Stores patient credentials. |
| **`health_data`** | `id`, `user_id`, `temperature`, `heart_rate`, `oxygen_level`, `date` | Logs the specific vitals. |

---

## 7. Future Scope
1.  **IoT Integration**: Direct feed from medical sensors (Pulse Oximeters).
2.  **Mobile Support**: Responsive Progressive Web App (PWA) features.
3.  **Doctor Module**: Direct dashboard for medical professionals.

---

## 8. Conclusion
The **HealthGuard** system successfully integrates modern backend architecture with a lightweight, high-performance frontend. It solves the critical problem of delayed medical attention by providing an automated triage system that works 24/7.
