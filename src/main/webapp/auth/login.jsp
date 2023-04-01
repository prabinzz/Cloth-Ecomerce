<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Login</title>
		<link rel="stylesheet" href="../css/reset.css" />
		<link rel="stylesheet" href="../css/style.css" />
		<link rel="stylesheet" href="login.css" />
	</head>
	<body>
		<div>
			<form action="login" method="post">
				<div class="form-control">
					<label for="username">Username:</label>
					<input class="form-input" type="text" name="username" />
				</div>
				<div class="form-control">
					<label for="password">Password:</label>
					<input class="form-input" type="password" name="password" />
				</div>
				<div class="form-control form-buttons">
					<input class="btn btn-primary" type="submit" value="Login" />
				</div>
			</form>
		</div>
		<script src="./login.js"></script>
	</body>
</html>
