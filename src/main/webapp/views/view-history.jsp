<%@page import="model.OrderItem"%>
<%@page import="database.Auth"%>
<%@page import="model.User"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.OrderModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/formStyle.css" />
<%@include file="/views/components/globelHead.jsp" %>
<style>
	.form-control{
		margin-bottom: 1rem;
	}
	.user_display{
		background: #ccc;
		padding: 10px 20px;
		display: flex;
		gap: 2rem;
		align-items: center;
	}
	.order-card_row{
		margin-bottom: 10px;
	}
	
	.user_display img{
		width: 100px;
		height: 100px;
		border-radius: 9999px;
	}
	.order_user-details>div{
		margin-bottom: 5px;
	}
	.order-card{
		padding: 20px;
		border: 1px solid #ddd;
		box-shadow: var(--shadow-sm);
	}
	.order-container{
		display: flex;
		flex-direction: column;
		gap: 2rem;
	}
</style>
</head>
<body>
 <%@include file="/views/components/navbar.jsp" %>
 <div class="container mx-auto">
 <h1>Order History</h1>
 	<% if(session.getAttribute("loggedInUserName") != null) {%>
 		<jsp:include page="/views/components/product-view.jsp">
	    	<jsp:param name="user" value='<%= session.getAttribute("loggedInUserName") %>' />
		</jsp:include>
 	<%}%>
 </div>
</body>
</html>