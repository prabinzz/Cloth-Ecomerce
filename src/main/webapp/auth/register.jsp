<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Register</title>
		<link rel="stylesheet" href="../css/reset.css" />
		<link rel="stylesheet" href="../css/style.css" />
		<link rel="stylesheet" href="register.css" />
	</head>
	<body>
		<div class="container">
			<form action="register" enctype="multipart/form-data" method="post">
				<div class="form-control">
					<label for="user_name">User Name:</label>
					<input class="form-input" type="text" name="user_name" />
				</div>
				<div class="form-control">
					<label for="first_name">First Name:</label>
					<input class="form-input" type="text" name="first_name" />
				</div>
				<div class="form-control">
					<label for="last_name">Last Name:</label>
					<input class="form-input" type="text" name="last_name" />
				</div>
				<div class="form-control">
					<label for="image">Profile Image</label>
					<input
						id="image"
						class=""
						type="file"
						name="image"
						accept="image/png, image/jpeg"
					/>
				</div>
				<div class="form-control">
					<label for="email">Email:</label>
					<input class="form-input" type="email" name="email" />
				</div>
				<div class="form-control">
					<label for="address">Address:</label>
					<input class="form-input" type="text" name="address" />
				</div>
				<div class="form-control">
					<label for="phone">Phone:</label>
					<input class="form-input" type="text" name="phone" />
				</div>
				<div class="form-control">
					<label for="password">Password:</label>
					<input class="form-input" type="password" name="password" />
				</div>
				<div class="from-control form-buttons">
					<input class="btn btn-primary" type="submit" />
				</div>
			</form>
		</div>
		<script src="./register.js"></script>
	</body>
</html>
