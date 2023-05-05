<%@page import="database.ProductModel"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
<style>
	table {
		border-collapse: collapse;
		width: 100%;
	}

	th, td {
		text-align: left;
		padding: 8px;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	th {
		background-color: #4CAF50;
		color: white;
	}
	.control-icon{
		width:30px;
		height: 30px;
		border-radius: 999px;
		padding: .4rem;
		border: 1px solid var(--accent-color);
	}
	.controls{
		display: flex;
		gap: .5rem
	}
	.control-icon:hover{
		fill: var(--accent-color);
	}
	.product-image{
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
<% 
ProductModel productModel = new ProductModel();
ArrayList<Product> products = productModel.getAllProducts(); %>
<h1>View Products</h1>
<table style="width: 100%;">
	<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Brand</th>
			<th>Description</th>
			<th>Size</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Category</th>
			<th>Gender</th>
			<th>Controls</th>
			<th>Image</th>
		</tr>
	</thead>
	<tbody>
		<%
			for(Product product: products){
		%>
			<tr>
				<td><%=product.getId()%></td>
				<td><%=product.getName()%></td>
				<td><%=product.getBrand()%></td>
				<td><%=product.getDescription()%></td>
				<td><%=product.getSize()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=product.getPrice()%></td>
				<td><%=product.getCategory()%></td>
				<td><%=product.getGender()%></td>
				<td><div class="controls"> 
						<div>
							<a href="/dashboard?page=edit-product&id=<%=product.getId()   %>">
							<svg  class="control-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/></svg>
							</a>
						</div>
						<div>
							<a href="/product/delete?id=<%=product.getId() %>">
							<svg  class="control-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg>
							</a>
						</div>
					</div>
				</td>
				<td><img class="product-image" src="<%=product.getImage()%>" height="100" width="100" /></td>
			</tr>
		<% 
			}
		%>
	</tbody>
</table>
</body>
</html>