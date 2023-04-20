<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Register</title>
		<link rel="stylesheet" href="/css/reset.css" />
		<link rel="stylesheet" href="/css/style.css" />
		<link rel="stylesheet" href="/css/register.css" />
	</head>
	<body>
		<div class="container">
			<form action="register" enctype="multipart/form-data" method="post">
				<div class="form-control">
					<label for="user_name">User Name:</label>
					<input class="form-input" type="text" name="user_name" required />
				</div>
				<div class="form-control">
					<label for="first_name">First Name:</label>
					<input class="form-input" type="text" name="first_name" required/>
				</div>
				<div class="form-control">
					<label for="last_name">Last Name:</label>
					<input class="form-input" type="text" name="last_name" required />
				</div>
				<div class="form-control">
					<label for="image">Profile Image</label>
					<input
						id="image"
						class=""
						type="file"
						name="image"
						accept="image/png, image/jpeg"
						required
					/>
				</div>
				<div class="form-control">
					<label for="email">Email:</label>
					<input class="form-input" type="email" name="email" required />
				</div>
				<div class="form-control">
					<label for="address">Address:</label>
					<input class="form-input" type="text" name="address" required />
				</div>
				<div class="form-control">
					<label for="phone">Phone:</label>
					<input class="form-input" type="text" name="phone"  required />
				</div>
				<div class="form-control">
					<label for="password">Password:</label>
					<input class="form-input" type="password" name="password" required />
				</div>
				<div class="form-control">
				<div class="error-message">
				<c:if test="${ sessionScope.errorMessage != null }">
					${sessionScope.errorMessage}
					<c:remove var="errorMessage" scope="session"/>
				</c:if>
				</div>
				</div>
				<div class="from-control form-buttons">
					<input class="btn btn-primary" type="submit" />
				</div>
			</form>
		</div>
		<script src="./register.js"></script>
	</body>
</html>
