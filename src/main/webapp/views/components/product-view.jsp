<%@page import="database.ProductModel"%>
<%@page import="model.OrderItem"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.Product"%>
<%@page import="model.User"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.OrderModel"%>
<%@page import="database.Auth"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div>
	<%
		String user = (String) request.getParameter("user");
		Auth authModel = new Auth();
		User orderUser = authModel.getUserWithUserName(user);
		ProductModel productModel = new ProductModel();
		OrderModel orderModel = new OrderModel();
		ArrayList<Order> orders = orderModel.getOrdersByUserId(user);
	%>
	<div style="margin: 20px 0px;" class="user_display">
		<div>
			<img alt="" src="<%=orderUser.getImageUrl() %>">
		</div>
		<div class=order_user-details>
			<div><span class="bold">User Name: </span> <%= orderUser.getUserName() %></div>
			<div><span class="bold">Full Name: </span><%= orderUser.getFullName() %></div>
		</div>
	</div>
	<div class="order-container">
	<%for(Order order: orders){ 
	%>
		<div class="order-card">
			<div class="order-card_row">
				<span class="bold"> Order Id: </span> <%= order.getOrderId() %>
			</div>
			<div class="order-card_row">
				<span class="bold"> Order Date: </span> <%= order.getOrderDate() %>
			</div>
			<div class="order-card_row">
				<span class="bold"> <i class="fa-solid fa-sack-dollar"></i> </span> <%= order.getTotalAmount() %>
			</div>
			<h3 style="margin: 20px 0px;">Purchased Product:</h3>
			<div class="flex">
			<%if(order.getOrderItems() != null){
				System.out.print("Test");
				for(OrderItem item : order.getOrderItems()){
					Product orderProduct = productModel.getProductById(String.valueOf(item.getProductId()));
				%>
				<div style="width: 400px; border: 1px solid #ccc; margin: 10px 20px; padding: 10px;" class="cart-card card-optional">
					<div class="cart-image"> <img alt="<%= orderProduct.getName() %>" src="<%= orderProduct.getImage() %>"></div>
						<div>
							<div>Id: <%= orderProduct.getId() %></div>
							<div><%= orderProduct.getName() %></div>
							<div><i class="price-icon fa-solid fa-dollar-sign"></i> <%= orderProduct.getPrice() %></div>
						</div>
					</div>
			<%}} %>
			</div>
		</div>
	<% }%>
	 </div>
</div>