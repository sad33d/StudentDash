# Student Dashboard Application

A dynamic **Student Dashboard Application** built using **Java Servlets**, **JSP**, and **JDBC**. This project demonstrates CRUD operations (Create, Read, Update, Delete) with seamless integration between the front-end and back-end, providing an efficient dashboard interface for managing student records.

---

## Features
- **Student Management**: Add, update, delete, and view student records.
- **Dynamic Content Rendering**: Uses JSP to render HTML pages with real-time data.
- **Database Connectivity**: Integrates with a MySQL database using JDBC to store and manage student information.
- **Responsive UI**: A simple and user-friendly interface for managing student data.

---

## Technologies Used
- **Backend**: Java Servlets, JDBC
- **Frontend**: JSP, HTML, CSS
- **Database**: MySQL (or any other RDBMS)
- **Server**: Apache Tomcat

---

## Prerequisites
1. **Java Development Kit (JDK)** - Version 8 or later.
2. **Apache Tomcat Server** - Version 9 or later.
3. **MySQL Database** - Ensure you have MySQL installed or access to a database server.
4. **Maven** (Optional) - For dependency management.

---

## Installation and Setup

### 1. Clone the Repository
Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/<your-username>/student-dashboard.git
cd student-dashboard

```

---

### Key Sections:
1. **Database Setup**: 
   - The SQL queries to create the database and table (`student`) are included.
   - Instructions for importing the `student_dashboard.sql` file into MySQL are provided.
  
```
-- Create the database
CREATE DATABASE student_dashboard;

-- Use the created database
USE student_dashboard;

-- Create the student table
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mobile BIGINT NOT NULL,
    branch VARCHAR(50) NOT NULL
);

-- Insert sample data into the student table
INSERT INTO student (name, email, mobile, branch) 
VALUES
('John Doe', 'john.doe@example.com', 9876543210, 'Computer Science'),
('Jane Smith', 'jane.smith@example.com', 9123456789, 'Mechanical Engineering'),
('Alice Brown', 'alice.brown@example.com', 9988776655, 'Electrical Engineering'),
('Bob Johnson', 'bob.johnson@example.com', 9090909090, 'Civil Engineering');

```
   
2. **Database Connection**:
   - You need to update the database connection in `DriverConnection.java` to reflect your database name and credentials.
```
private static final String DB_URL = "jdbc:mysql://localhost:3306/student_dashboard";  // Change 'student_dashboard' to your database name
private static final String DB_USER = "your_username"; // Your MySQL username
private static final String DB_PASSWORD = "your_password"; // Your MySQL password

```
This **README.md** file provides a complete guide to set up and run your **Student Dashboard Application**. Let me know if you need any more modifications!
