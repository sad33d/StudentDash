<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.project.model.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700");

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: "Poppins", sans-serif;
	background-color: #2f465c;
	padding: 20px;
}

.container {
	max-width: 1100px;
	margin: 0 auto;
}

.page-title {
	text-align: center;
	color: #ffffff;
	margin-bottom: 30px;
	font-size: 3rem;
}

.add-student-btn {
	position: fixed;
	top: 50px;
	right: 50px;
	padding: 12px 20px;
	background-color: #1aad1f;
	color: #ffffff;
	border: none;
	border-radius: 50px;
	font-size: 1rem;
	font-weight: bold;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s ease, transform 0.3s ease;
	z-index: 1000;
}

.add-student-btn:hover {
	background-color: #43a047;
	transform: scale(1.05);
}

.add-student-btn .plus-icon {
	font-size: 1.5rem;
	margin-top: -1px;
}

.cards-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 40px;
	padding: 20px 0;
}

.card {
	background: #162e44;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	overflow: hidden;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.card-header {
	background: #00182e;
	color: white;
	padding: 15px;
	font-size: 1.3em;
	font-weight: 500;
}

.card-body {
	padding: 20px;
}

.student-info {
	margin-bottom: 15px;
}

.info-label {
	color: #bcccdc;
	font-size: 0.9em;
	margin-bottom: 5px;
}

.info-value {
	color: #f0f4f8;
	font-size: 1.1em;
	margin-bottom: 10px;
}

.card-actions {
	display: flex;
	gap: 10px;
	margin-top: 15px;
}

.btn {
	padding: 8px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
	transition: background-color 0.3s ease;
}

.btn-edit {
	background-color: #0a79d4;
	color: white;
}

.btn-edit:hover {
	background-color: #125aa1;
}

.btn-delete {
	background-color: #f44336;
	color: white;
}

.btn-delete:hover {
	background-color: #d32f2f;
}

@media ( max-width : 1024px) {
	.cards-container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 768px) {
	.cards-container {
		grid-template-columns: 1fr;
	}
}

/* Toast container style */
#toast {
    visibility: hidden;
    max-width: 300px;
    color: #fff;
    text-align: left;
    padding: 16px;
    border-radius: 8px;
    position: fixed;
    left: 20px;
    bottom: 30px;
    z-index: 1000;
    font-size: 16px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    opacity: 0;
    transition: opacity 0.5s ease, transform 0.5s ease;
    transform: translateY(-20px);
}

/* Show the toast */
#toast.show {
    visibility: visible;
    opacity: 1;
    transform: translateY(0);
}

/* Success and failure styles */
.success-toast {
    background-color: #008000; /* Green */
    border-left: 5px solid #218838;
}

.failure-toast {
    background-color: #FF0000; /* Red */
    border-left: 5px solid #c82333;
}

/* Optional: style the message text */
.toast-message {
    font-weight: bold;
}

.toast-close {
    position: absolute;
    top: 0px;
    right: 5px;
    color: #fff;
    cursor: pointer;
    font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="page-title">Student Dashboard</h1>

		<a href="addStudent.jsp"><button class="add-student-btn"
				onclick="addStudent()">
				<span class="plus-icon">+</span> Add Student
			</button></a>

		<div class="cards-container">
			<%
            ArrayList<Student> sList = (ArrayList<Student>) session.getAttribute("studentList");
            if(sList != null) {
                for(Student stu : sList) {
            %>

			<div id="toast" class="success-toast">
				<span class="toast-message">Your action was successful!</span> <span
					class="toast-close" onclick="closeToast()">×</span>
			</div>
			<div class="card">
				<div class="card-header">
					<%= stu.getName() %>
				</div>


				<div class="card-body">
					<div class="student-info">
						<div class="info-label">Student ID :</div>
						<div class="info-value"><%= stu.getId() %></div>

						<div class="info-label">Email :</div>
						<div class="info-value"><%= stu.getEmail() %></div>

						<div class="info-label">Phone :</div>
						<div class="info-value"><%= stu.getMobile() %></div>

						<div class="info-label">Branch :</div>
						<div class="info-value"><%= stu.getBranch() %></div>
					</div>

					<div class="card-actions">
						<button class="btn btn-edit"
							onclick="location.href='FetchOne?id=<%= stu.getId() %>'">Edit</button>
						<button class="btn btn-delete"
							onclick="location.href='Delete?id=<%= stu.getId() %>'">Delete</button>
					</div>

				</div>
			</div>
			<%
                }
            }
            %>
		</div>
	</div>

	<script>
      
	function showToast(message, type) {
	    const toast = document.getElementById("toast");
	    const toastMessage = toast.querySelector(".toast-message");
	    
	    // Set message and type
	    toastMessage.textContent = message;
	    toast.className = "show " + (type === "success" ? "success-toast" : "failure-toast");
	    
	    // Automatically hide after 3 seconds
	    setTimeout(() => { closeToast(); }, 3000);
	}

	function closeToast() {
	    const toast = document.getElementById("toast");
	    toast.className = toast.className.replace("show", "");
	}

        <% String statusMessage = (String) request.getAttribute("statusMessage"); %>
        <% if (statusMessage != null) { %>
            <% String messageType = statusMessage.contains("successfully") ? "success" : "failure"; %>
            showToast("<%= statusMessage %>", "<%= messageType %>");
        <% } %>
    </script>
</body>
</html>