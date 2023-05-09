<%@page import="model.Product"%>
<%@page import="database.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/formStyle.css" />
<style>
	.form-control{
		margin-bottom: .6rem;
	}
</style>

</head>
<body>
 <div class=" w-500">
 <h1>Edit Product</h1>
 <% 
 	String id = request.getParameter("id");
 	if(id == null){
 %>
 	<h2>Product ID not provided. </h2>
 	<p >Please go to view pooduct page and click on edit </p>
 	<h3 >Or</h3>
 	<p>Provide Valid Product ID in the input box below</p>
 <% } else{ 
	 ProductModel productModel = new ProductModel();
	 Product product = productModel.getProductById(id);
 %>
 <form action="/product/add-product" method="POST" enctype="multipart/form-data">
	<div class="form-control">
		<label for="name">Name:</label>
		<input class="form-input" type="text" name="name" value="<%=product.getName()%>"/>
	</div>
	<div class="form-control">
		<label for="brand">Brand:</label>
		<input class="form-input" type="text" name="brand" value="<%=product.getBrand() %>"  required />
	</div>
	<div class="form-control">
		<label for="description">Description:</label>
		<textarea class="form-input" rows="5" name="description" required><%=product.getDescription() %></textarea>
	</div>
	<div class="form-control">
		<label for="size">Size:</label>
		<input class="form-input" type="text" name="size" value="<%=product.getSize() %>" required />
	</div>
	<div class="form-control">
		<label for="quantity">Quantity:</label>
		<input class="form-input" type="number" name="quantity" min="0" value="<%=product.getQuantity() %>" required />
	</div>
	<div class="form-control">
		<label for="price">Price:</label>
		<input class="form-input" type="number" name="price" min="0" step="0.01" value="<%=product.getPrice() %>" required />
	</div>
	<div class="form-control">
		<label for="category">Category:</label>
		<select class="form-input" name="category" required>
		  	<option value="">Select Category</option>
		  	<option value="Clothing" <%= product.getGender().equals("Clothing") ? "selected" : "" %>>Clothing</option>
			<option value="Footwear" <%= product.getGender().equals("Footwear") ? "selected" : "" %>>Footwear</option>
			<option value="Accessories" <%= product.getGender().equals("Accessories") ? "selected" : "" %>>Accessories</option>
			<option value="Others" <%= product.getGender().equals("Others") ? "selected" : "" %>>Others</option>
		</select>
	</div>
	<div class="form-control">
		<label for="gender">Gender:</label>
		<select class="form-input" name="gender" required>
			<option value="">Select Gender</option>
			<option value="men" <%= product.getGender().equals("men") ? "selected" : "" %>>Men</option>
			<option value="women" <%= product.getGender().equals("women") ? "selected" : "" %>>Women</option>
			<option value="unisex" <%= product.getGender().equals("unisex") ? "selected" : "" %>>Unisex</option>
		</select>
	</div>
	<div class="form-control">
	    <label for="image">Image:</label>
	    <input class="form-input" type="file" name="image" accept="image/*" required onchange="previewImage(event)" />
	    <img id="preview" src="<%=product.getImage() %>" alt="Preview Image" style="display:none; max-width:100px; max-height:100px;" />
	</div>
	<div class="form-control">
		<input class="form-input btn btn-primary" type="submit" value="Edit Product" />
	</div>
</form>
	<%} %>
 </div>
 
 <script>
	function previewImage(event) {
	    var preview = document.getElementById('preview');
	    preview.style.display = "block";
	    preview.src = URL.createObjectURL(event.target.files[0]);
	}
</script>
</body>
</html>