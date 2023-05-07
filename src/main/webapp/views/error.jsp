<%@ page isErrorPage="true" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>
	<h1>
		<%= request.getParameter("type") %>
	</h1>
	<p> <%= request.getParameter("message") %></p>
	<div class="btn-group">
		
	</div>
</body>
</html>