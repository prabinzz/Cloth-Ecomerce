<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cloth ecommerse website</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="https://kit.fontawesome.com/066c6c8fe9.js" crossorigin="anonymous"></script>
<style>
	.product-container{
		display:flex;
		flex-direction: row;
		gap: 2rem;
		
	}
	.product-card{
		width: 300px;
		padding: 1rem;
		border: 1px solid #ccc;
		display: flex;
		flex-direction: column;
		gap: .5rem;
		border-radius: 1rem;
	}
	.product-card > img{
		width: 290px;
		aspect-ratio: 1 / 1;
	}
	.card-btn{
		font-size: 1rem;
		padding: .5rem 1rem;
	}

	.product-price{
		padding: .5rem 1rem;
		font-style: bold;
	}
	.add-cart{
		display: flex;
		gap: 1rem;
		justify-content: space-between;
	}
	.price-icon{
		font-size: 1.4 rem;
	}
</style>
</head>
<body>
<%@include file="views/components/navbar.jsp" %>
<%
ProductModel productModel = new ProductModel();
	ArrayList <Product> products = productModel.getAllProducts();
%>

<h1>Products</h1>
<div class="container mx-auto"> 
	<div class="product-container">
	  <% for(Product product : products) { %>
	    <div class="product-card">
	      <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
	      <div class="product-name"><%= product.getName() %></div>
	      <div class="product-description" ><%= product.getDescription() %></div>
	      <div class="add-cart"> 
	      	<div class="product-price"><i class="price-icon fa-solid fa-dollar-sign"></i><%= product.getPrice() %></div>
	      	<div class="cart-btn-container">
		      	<a href="/product/add-to-cart?productId=<%= product.getId() %>">
		      		<button class="btn btn-primary card-btn">Add to Cart</button> 
		      	</a> 
	      	</div>
	      </div>
	    </div>
	  <% } %>
	</div>
</div>
</body>
</html>