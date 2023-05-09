<%@ page isErrorPage="true" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success Page</title>
<jsp:include page="/views/components/globelHead.jsp" />
	<style>
		.main{
			margin: 0px auto;
			margin-top: 20vh;
			text-align: center;
			width: 600px;
			padding: 40px;
			border: 1px solid #ddd;
			box-shadow: var(--shadow-sm);
		}
	</style>
</head>
<body>
	<div class="main">
	<h2>
		<%= request.getParameter("type") %>
	</h2>
	<p> <%= request.getParameter("message") %></p>
	<div class="btn-group">
		
	</div>
	</div>
</body>
</html>