<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
	<%@include file="/views/components/globelHead.jsp" %>
	<style type="text/css">
		.card-optional{
			background: white;
			box-shadow: var(--shadow-sm);
			padding: 10px;
			border-radius: 10px;
		}
		.cart-flex{
			display: flex;
			gap: 1rem;
			flex-wrap: wrap;
			justify-content: space-around;
		}
		
		.form-control {
			margin-bottom: 15px;
		}
		
		.form-control label {
			display: block;
			font-size: 16px;
			font-weight: bold;
			margin-bottom: 5px;
		}
		
		.form-input {
			width: 100%;
			padding: 10px;
			font-size: 16px;
			border-radius: 5px;
			border: 1px solid #ddd;
			box-sizing: border-box;
		}
		form{
			margin-top: 50 px;
		}
	</style>
</head>
<body>
	<%@include file="/views/components/navbar.jsp" %>
	<%  
		Auth authModel = new Auth();
		ProductModel productModel = new ProductModel();
		User loggedInUser = authModel.getUserWithUserName((String)session.getAttribute("loggedInUserName"));
		ArrayList<Integer> cart = (ArrayList<Integer>) session.getAttribute("cart");
	%>
						
	<div class="container mx-auto">
		<h1 class="heading">Checkout</h1>
		
		<div>
			<% if(cart != null) {%>
				<h2>Purchasing items</h2>
				<div class="cart-flex">
			<% 	for(Integer item : cart){
					Product cartProduct = productModel.getProductById(String.valueOf(item));
			%>
				<div style="width: 400px;" class="cart-card card-optional">
					<div class="cart-image"> <img alt="<%= cartProduct.getName() %>" src="<%= cartProduct.getImage() %>"></div>
						<div>
							<div>Id: <%= cartProduct.getId() %></div>
							<div><%= cartProduct.getName() %></div>
							<div><i class="price-icon fa-solid fa-dollar-sign"></i> <%= cartProduct.getPrice() %></div>
						</div>
					</div>
							
			<% }%>
				</div>
				<div style="margin-top: 50px;">
					<form action="/checkout" method="post">
						<div class="form-control">
							<label for="payment-address">Payment Address:</label>
							<input class="form-input" type="text" name="payment-address" 
								value="<%= loggedInUser.getAddress() %>" />
						</div>
						<div class="form-control">
							<label for="payment-type">Payment Type:</label>
							<select class="form-input" name="payment-type" required>
								<option value="">Select Payment Type</option>
								<option value="Cash On Delevary" >Cash On Delevary</option>
								<option value="Bank Tranfer"> Bank Transfer</option>
								<option value="Online Payment" >Online Payment</option>
							</select>
						</div>
						<div class="purchase"> <input type="submit" class="btn btn-primary" value="Purchase"/></div>
					</form>
				</div>
			<%}else{ %>
				<div> Your Cart is empty.</div>
				<%} %>
		</div>
	</div>
</body>
</html>