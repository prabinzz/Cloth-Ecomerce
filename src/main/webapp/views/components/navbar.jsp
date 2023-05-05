<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="database.Auth"%>
<%@page import="model.User"%>
<div class="bg-white w-full">
	<nav class="nav container mx-auto">
		<ul class="nav_navigation">
			<li class="nav_navitem"><a href="/">Home</a></li>
			<li class="nav_navitem"><a href="/login">Login</a></li>
			<li class="nav_navitem"><a href="/register">Register</a></li>
		</ul>
		<c:choose>
			<c:when test="${sessionScope.loggedInUserName == null}">
				<a href="/login"
					><input class="btn btn-primary" type="button" value="Login"
				/></a>
			</c:when>
			<c:otherwise>
						<%  
					Auth authModel = new Auth();
					User loggedInUser = authModel.getUserWithUserName((String)session.getAttribute("loggedInUserName"));
						%>
				<div class="nav_userdetails">
					<div class="nav_userprofile">
					<img
						onclick="toggle('userdetail_toggle')"
						src="${sessionScope.loggedInUserImage}"
						class="nav_userdetails_iamge"
					/>
					</div>
					<div id="userdetail_toggle" class="nav_userdetails_expanded">
						<p><span class="bold">User Name:</span><%= loggedInUser.getUserName() %></p>
						<p><span class="bold">Email:</span><%= loggedInUser.getEmail() %></p>
						<p><span class="bold">Name:</span><%= loggedInUser.getFullName() %></p>
						<p><span class="bold">Account Type:</span><%= loggedInUser.getAccountType() %></p>
						<div class="action">
							<a href="update-user?user=${sessionScope.loggedInUserName}">
							<svg class="action_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg>
								<p>Update User</p>
							</a>
						</div>
						<% if(loggedInUser.getAccountType().equals("admin")){ %>
							<div class="action">
								<a href="/dashboard">
									<svg  class="action_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/></svg>
									<p>Dashboard</p>
								</a>
							</div>
						<% }%>
						<div class="action">
							<a href="/logout">
								<svg  class="action_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/></svg>
								<p>Log Out</p>
							</a>
						</div>
						
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<script>
			var toggle = (target) => {
				let targetDiv = document
					.getElementById(target)
					.classList.toggle("show");
			};
		</script>
	</nav>
</div>
