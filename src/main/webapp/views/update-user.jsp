<%@page import="database.Auth"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Update Profile</title>
		<%@include file="/views/components/globelHead.jsp" %>
		<link rel="stylesheet" href="/css/register.css" />
	</head>
	<body>
		<%  
			Auth authModel = new Auth();
			User updateUser = authModel.getUserWithUserName(request.getParameter("user"));
			System.out.print(updateUser.getFirstName());
		%>
		<div class="pattern">
			<div class="container mx-auto">
				<form action="update-user" enctype="multipart/form-data" method="post">
					<h2>Update Profile</h2>
					<div class="form-control">
							<label for="first_name">User Name:</label>
							<input
								class="form-input"
								type="text"
								name="user_name"
								value="<%= updateUser.getUserName() %>"
								required
							/>
						</div>
					<div class="form-group">
						<div class="form-control">
							<label for="first_name">First Name:</label>
							<input
								class="form-input"
								type="text"
								name="first_name"
								value="<%= updateUser.getFirstName() %>"
								required
							/>
						</div>
						<div class="form-control">
							<label for="last_name">Last Name:</label>
							<input class="form-input" type="text" name="last_name" required value="<%= updateUser.getLastName() %>" />
						</div>
					</div>
					<div class="form-control">
						<img id="profile-image" style="width: 200px" src="<%= updateUser.getImageUrl() %>" /> 
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
						<input class="form-input" type="email" name="email" required value="<%= updateUser.getEmail() %>" />
					</div>
					<div class="form-control">
						<label for="address">Address:</label>
						<input class="form-input" type="text" name="address" required value="<%= updateUser.getAddress() %>"/>
					</div>
					<div class="form-control">
						<label for="phone">Phone:</label>
						<input class="form-input" type="text" name="phone" required value="<%= updateUser.getPhone() %>" />
					</div>
					<div class="form-control">
						<label for="password">New Password:</label>
						<input
							class="form-input"
							type="password"
							name="password"
						/>
					</div>
					<div class="form-control">
						<div class="error-message">
							<c:if test="${ sessionScope.errorMessage != null }">
								${sessionScope.errorMessage}
								<c:remove var="errorMessage" scope="session" />
							</c:if>
						</div>
					</div>
					<div class="from-control form-buttons">
						<input class="btn btn-primary" type="submit" value="Update" />
					</div>
				</form>
			</div>
		</div>
		<script>
    // Get the input and image elements
    const imageInput = document.getElementById('image');
    const profileImage = document.getElementById('profile-image');

    // Listen for changes on the input element
    imageInput.addEventListener('change', (event) => {
        const file = event.target.files[0];
        const reader = new FileReader();
        
        // When the reader has loaded the file, update the image element's src attribute
        reader.addEventListener('load', (event) => {
            profileImage.src = event.target.result;
        });

        // Read the file as a data URL
        reader.readAsDataURL(file);
    });
</script>
		<script src="./register.js"></script>
	</body>
</html>
