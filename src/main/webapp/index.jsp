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
		flex-wrap: wrap;
		
	}
	.product-card{
		translate: all;
		width: 300px;
		padding: 1rem;
		border: 1px solid #ccc;
		display: flex;
		flex-direction: column;
		gap: .5rem;
		border-radius: 1rem;
		box-shadow: 0px 1px 14px 5px rgba(0,0,0,0.08);
	}
	.product-card:hover{
		box-shadow: 0px 1px 14px 5px rgba(0,0,0,0.15);
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
	.product-name{
		font-size: 1.2rem;
		font-weight: bold;
	}
	.product-description{
		color: #555;
		flex-grow: 1;
    	overflow: hidden;
    	text-overflow: ellipsis;
    	max-width: 100ch;
	}
	.product-info{
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.product-size{
		border: 1px solid #ccc;
		padding: 5px 10px;
	}
</style>
</head>
<body>
<%@include file="views/components/navbar.jsp" %>
<%
ProductModel productModel = new ProductModel();
	ArrayList <Product> products = productModel.getAllProducts();
%>

<div class="container mx-auto"> 
	<h1 class="heading">Products</h1>
	<div class="product-container">
	  <% for(Product product : products) { %>
	    <div class="product-card">
	      <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
	      <div class="product-name"><%= product.getName() %></div>
			<div class="product-info">
				<div class="product-brand"> <span class="bold">Brand:</span> <%= product.getBrand() %></div>
				<div class="product-size"><%= product.getSize() %></div>
			</div>
	      <div class="product-description" ><%= product.getDescription() %></div>
	      <div class="add-cart"> 
	      	<div class="product-price"><i class="price-icon fa-solid fa-dollar-sign"></i><%= product.getPrice() %></div>
	      	<div class="cart-btn-container">
		      	<a href="/product/add-to-cart?productId=<%= product.getId() %>">
		      		<button class="btn btn-primary card-btn"> <i class="fa-solid fa-cart-shopping"></i> Add</button> 
		      	</a> 
	      	</div>
	      </div>
	    </div>
	  <% } %>
	</div>
</div>
</body>
</html>