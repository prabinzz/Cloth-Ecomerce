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
		<div>
			<form action="register" enctype="multipart/form-data" method="post">
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
						class="form-input"
						type="file"
						name="image"
						accept="image/png, image/jpeg"
					/>
				</div>
				<div class="form-control">
					<label for="password">Password</label>
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
