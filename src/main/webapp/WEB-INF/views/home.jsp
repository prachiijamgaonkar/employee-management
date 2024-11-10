<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.edu.employeeregistration.dto.UserDTO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: "Times New Roman", Times, serif;
	background-image:
		url("https://plus.unsplash.com/premium_photo-1668708034279-ab8fa3a9e19b?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHVycGxlJTIwYWVzdGhldGljfGVufDB8fDB8fHww");
	background-size: cover;
	background-position: center;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
	height: 100vh;
	color: white;
	text-align: center;
	padding-bottom: 40px;
}

.greeting-container {
	margin-top: 20px;
	text-align: center;
	font-size: 1.2em;
	color: white;
}

.container {
	background-color: rgba(0, 0, 0, 0.7);
	padding: 30px;
	border-radius: 8px;
	width: 80%;
	max-width: 400px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
	margin-top: 20px;
	text-align: left;
}

.users-list {
	margin-top: 10px;
	font-size: 18px;
	color: #ffcc00;
}

.logout-button {
	padding: 10px 15px;
	background-color: #ffdd57;
	color: black;
	text-decoration: none;
	border-radius: 5px;
	font-weight: bold;
	margin-left: 20px;
	padding-bottom: 20px;
	margin-top: auto;
}

.logout-button:hover {
	background-color: #ffcc00;
}
</style>
</head>
<body>
	<div class="greeting-container">
		
		<h1>
			Hello,
			<%=((UserDTO) session.getAttribute("user")).getName()%>!
		</h1>
		<p>You are successfully logged in.</p>
	</div>

	<div class="container">
		<p>List of All Registered Users:</p>
		<%
		@SuppressWarnings("unchecked")
		List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");

		for (UserDTO u : users) {
		%>
		<div class="users-list">
			<p><%=u.getName()%></p>
		</div>
		<%
		}

		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<p><%=message%></p>
		<%
		}
		%>
	</div>
	<a href="logout" class="logout-button">Logout</a>
</body>
</html>
