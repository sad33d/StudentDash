<%@page import="com.project.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<style>
    @import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700");
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: "Poppins", sans-serif;
        background-color: #2f465c;
        color: #ffffff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background-color: #162e44;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        width: 350px;
        text-align: center;
    }

    h1 {
        color: #ffffff;
        font-size: 2rem;
        margin-bottom: 20px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        color: #bcccdc;
        font-size: 1rem;
        text-align: left;
        margin-bottom: 5px;
    }

    input[type="text"], input[type="submit"] {
        padding: 10px;
        margin-bottom: 15px;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
    }

    input[type="text"] {
        background-color: #f0f4f8;
        color: #2f465c;
    }

    input[type="text"]:focus {
        outline: 2px solid #06f70e;
    }

    input[type="submit"] {
        background-color: #1aad1f;
        color: white;
        font-weight: bold;
        cursor: pointer;
        margin-top: 15px;
        padding: 15px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #198b1f;
    }
</style>
</head>
<body>

<div class="form-container">
    <h1>Edit Student</h1>
    <% 
        Student student = (Student) session.getAttribute("student"); 
        if (student == null) { 
    %>
        <p>No student found!</p>
    <% } else { %>
    <form action="UpdateStudent" method="post">
        <label for="id">Id:</label>
        <input type="text" id="id" name="id" value="<%= student.getId() %>" readonly>

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= student.getName() %>" required>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= student.getEmail() %>" readonly>

        <label for="mobile">Phone:</label>
        <input type="text" id="mobile" name="mobile" value="<%= student.getMobile() %>" required>

        <label for="branch">Branch:</label>
        <input type="text" id="branch" name="branch" value="<%= student.getBranch() %>" required>

        <input type="submit" value="Update Student">
    </form>
    <% } %>
</div>

</body>
</html>
