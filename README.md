# Car-Pool Management System - Java Micro Project

A concurrency-safe web platform developed using Java Enterprise technologies (Servlets, JSP) and MySQL. The system enables verified drivers to publish travel itineraries and passengers to reserve available seating with real-time capacity updates.

---

## 📌 Project Overview

* **Student Name:** Sadaf Sayyad Isak
* **Roll Number:** 550
* **Class / Branch:** T. Y. EXTC (A Division)
* **Academic Year:** 2026–27
* **Institution:** Pillai College of Engineering

---

## 🛠️ Technology Stack

* **Backend Core:** Java JDK 11+, Java Servlets (MVC Architecture)
* **Data Access Layer:** JDBC, Data Access Objects (DAO)
* **Transaction Control:** SQL ACID-compliant Transactions
* **Frontend:** JavaServer Pages (JSP), HTML5, CSS3
* **Database:** MySQL Server (managed via XAMPP / phpMyAdmin)
* **Web Container:** Apache Tomcat 9

---

## ✨ Key Features & Technical Highlights

1. **ACID-Compliant Seat Reservations:** Utilizes SQL transaction controls (`setAutoCommit(false)`, `commit()`, and `rollback()`) in `ReservationDAO.java` to prevent overbooking and ghost bookings.
2. **Dual-Role Access Control:** Differentiates capabilities for vehicle owners broadcasting journeys and commuters reserving seats.
3. **Session Verification:** Restricts seat reservation endpoints to logged-in users, redirecting unauthorized traffic to the login gateway.
4. **Interactive Commuter Dashboard:** Displays real-time available routes, fare costs, seat capacities, and dynamic booking controls.

---

## 📂 Project Directory Structure

```text
CarPool_Management_System/
├── schema.sql                               # Database setup script (members, journeys, vehicles, reservations)
├── src/
│   └── com/
│       └── carpool/
│           ├── util/
│           │   └── DatabaseConfig.java      # JDBC Connection Manager
│           ├── dao/
│           │   └── ReservationDAO.java      # Transactional SQL Seat-Booking Logic
│           └── servlet/
│               └── ReserveSeatServlet.java  # HTTP Controller & Session Authenticator
├── web/
│   └── commuter-feed.jsp                    # Active Routes Frontend Dashboard
└── README.md                                # Project Documentation
