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
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
*{

	font-family:  "Poppins", serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family:  "Poppins", serif;
	background-color: #28292A;
	padding: 20px;
}

.container {
	max-width: 1100px;
	margin: 0 auto;
}

.page-title {
	text-align: center;
	color: #D1D0C5;
	margin-bottom: 30px;
	font-size: 3.5rem;
	font-weight: 700;
}

.add-student-btn {
	position: fixed;
	top: 50px;
	right: 50px;
	padding: 12px 20px;
	background-color: #E2B714;
	color: #1A1C17;
	border: none;
	border-radius: 15px;
	font-size: 1rem;
	font-weight: bold;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition:transform 0.3s ease;
	z-index: 1000;
}

.add-student-btn:hover {
	background-color: #5E6163;
	color:#D1D0C5;
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
	background: #202225;
	border-radius: 15px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	overflow: hidden;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.card-header {
	background: #1A1C17;
	color: #D1D0C5;
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
	color: #858685;
	font-size: 0.9em;
	margin-bottom: 5px;
}

.info-value {
	color: #D1D0C5;
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
	border-radius: 15px;
	cursor: pointer;
	font-weight: bold;
	transition: background-color 0.3s ease;
}

.btn-edit {
	background-color: rgba(12, 18, 138, 0.9);
	color: #D1D0C5;
}

.btn-edit:hover {
	background-color: rgba(0, 0, 256, 0.71);
}

.btn-delete {
	background-color:rgba(138, 18, 12, 0.9);
	color: white;
}

.btn-delete:hover {
	background-color: rgba(256, 0, 0, 0.71);
}

/* Style for the search container */
.search-container {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

/* Style the search form */
.search-form {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    max-width: 500px; /* Limit the maximum width of the search form */
}

/* Style the input field */
.search-input {
    padding: 12px 20px;
    font-size: 1rem;
    border: 1px solid #202225;
    border-radius: 15px;
    width: 100%;
    margin-right: 10px;
    background-color: #202225;
    transition: border 0.3s ease;
}

::placeholder {
  color: #858685;
  opacity: 1;
}

.search-input:focus {
    border: 1px solid #E2B714;
    outline: none;
}


.search-btn {
	font-weight: bold;
    padding: 12px 20px;
    font-size: 1rem;
    background-color: #E2B714;
    color: #1A1C17;
    border: 1px solid #E2B714;
    border-radius: 15px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.search-btn:hover {
    background-color: #5E6163;
    border-color:#5E6163;
    color: #D1D0C5;
}



.notfound {
    border-radius: 15px;
    border: 2px solid rgba(241, 51, 34, 0.71);
    background: rgba(138, 18, 12, 0.9); 
    color: #fff;
    box-shadow: 0px 8px 24px 0px rgba(0, 0, 0, 0.08);
    
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    
    padding: 15px;
    text-align: center;
    font-size: 1.2rem;
    max-width: 500px;
    z-index: 1000;
}




@media ( max-width : 1024px) {
	.cards-container {
		grid-template-columns: repeat(2, 1fr);
	}
	 .add-student-btn {
        bottom: 15px;
        right: 15px;
        top: auto;
    }
    .page-title {
        font-size: 2.5rem;
    }
}

@media ( max-width : 768px) {
	.cards-container {
		grid-template-columns: 1fr;
	}
	body{
	font-size: smaller;
	}
}

/* Toast container style */
#toast {
    visibility: hidden;
    width: 320px;
    color: #fff;
    text-align: left;
    padding: 16px;
    border-radius: 15px;
    position: fixed;
    left: 20px;
    top: 30px;
    z-index: 1000;
    font-size: 16px;
    box-shadow: 0px 8px 24px 0px rgba(0, 0, 0, 0.08);
    opacity: 0;
    transition: opacity 0.5s ease, transform 0.5s ease;
    transform: translateY(-20px);
}

#toast.show {
    visibility: visible;
    opacity: 1;
    transform: translateY(0);
}

.success-toast {
    background-color: rgba(0, 148, 0, 0.9);
    border: 2px solid rgba(100, 206, 100, 0.71);
}

.failure-toast {
    background-color: rgba(138, 18, 12, 0.9);
    border: 2px solid rgba(241, 51, 34, 0.71);
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

        <!-- Search Form -->
		<div class="search-container">
			<form method="get" action="SearchServlet" class="search-form">
				<input type="text" name="query" placeholder="Search by Name"
					class="search-input" />
				<button type="submit" class="search-btn">Search</button>
			</form>
		</div>

		<div id="toast" class="success-toast">
			<span class="toast-message">This is a success message!</span> <span
				class="toast-close" onclick="closeToast()">✕</span>
		</div>

		<div class="cards-container">
			<%
                // Retrieve the search term and student list from request attributes
                String searchTerm = request.getParameter("query");
                ArrayList<Student> sList = (ArrayList<Student>) session.getAttribute("studentList");

                // Check if the search term is not empty and if students are available
                if (searchTerm == null || searchTerm.trim().isEmpty()) {
                    // No search term, show all students
                    if (sList != null && !sList.isEmpty()) {
                        for (Student stu : sList) {
            %>
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
                                        <button class="btn btn-edit" onclick="location.href='FetchOne?id=<%= stu.getId() %>'">Edit</button>
                                        <button class="btn btn-delete" onclick="location.href='Delete?id=<%= stu.getId() %>'">Delete</button>
                                    </div>
                                </div>
                            </div>
            <%
                        }
                    } else {
            %>
                        <p class="notfound">No students found.</p>
            <%
                    }
                } else {
                    // Filtered by search term, show matching students
                    boolean foundAny = false;
                    if (sList != null && !sList.isEmpty()) {
                        for (Student stu : sList) {
                            if (stu.getName().toLowerCase().contains(searchTerm.toLowerCase())) {
                                foundAny = true;
            %>
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
                                            <button class="btn btn-edit" onclick="location.href='FetchOne?id=<%= stu.getId() %>'">Edit</button>
                                            <button class="btn btn-delete" onclick="location.href='Delete?id=<%= stu.getId() %>'">Delete</button>
                                        </div>
                                    </div>
                                </div>
            <%
                            }
                        }
                    }

                    if (!foundAny) {
            %>
                        <p class="notfound">No students found for the searched name "<%= searchTerm %>."</p>
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