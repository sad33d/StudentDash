<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

	* {
		font-family: "Poppins", serif;
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	body {
		font-family: "Poppins", serif;
		background-color: #28292A;
		color: #D1D0C5;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}

.form-container {
	background-color: #202225;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	width: 350px;
	text-align: center;
}

h1 {
	color: #D1D0C5;
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
	border-radius: 15px;
	font-size: 1rem;
}

input[type="text"] {
	background-color: #28292A;
	color: #D1D0C5;
}

input[type="text"]:focus {
	outline: 1px solid #E2B714;
}

input[type="submit"] {
	background-color: #E2B714;
	color: #1A1C17;
	font-weight: bold;
	cursor: pointer;
	margin-top: 15px;
	padding: 15px;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #5E6163;
	color: #D1D0C5;
}
</style>
</head>
<body>

<div class="form-container">
    <h1>Add Student</h1>
    <form action="AddStudent">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email</label>
        <input type="text" id="email" name="email" required>

        <label for="mobile">Phone</label>
        <input type="text" id="mobile" name="mobile" required>

        <label for="branch">Branch</label>
        <input type="text" id="branch" name="branch" required>

        <input type="submit" value="Add">
    </form>
</div>

</body>
</html>
