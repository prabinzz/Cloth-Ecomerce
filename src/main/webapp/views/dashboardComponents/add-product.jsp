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
		margin-bottom: 1rem;
	}
</style>
</head>
<body>
 <div class="w-500">
 <h1>Add Product</h1>
 <form action="/product/add-product" method="POST" enctype="multipart/form-data">
	<div class="form-control">
		<label for="name">Name:</label>
		<input class="form-input" type="text" name="name" required />
	</div>
	<div class="form-control">
		<label for="brand">Brand:</label>
		<input class="form-input" type="text" name="brand" required />
	</div>
	<div class="form-control">
		<label for="description">Description:</label>
		<textarea class="form-input" name="description" required></textarea>
	</div>
	<div class="form-control">
		<label for="size">Size:</label>
		<input class="form-input" type="text" name="size" required />
	</div>
	<div class="form-control">
		<label for="quantity">Quantity:</label>
		<input class="form-input" type="number" name="quantity" min="0" required />
	</div>
	<div class="form-control">
		<label for="price">Price:</label>
		<input class="form-input" type="number" name="price" min="0" step="0.01" required />
	</div>
	<div class="form-control">
		<label for="category">Category:</label>
		<select class="form-input" name="category" required>
			<option value="">Select Category</option>
			<option value="Clothing">Clothing</option>
			 <option value="Footware">Footwear</option>
			 <option value="Accessories">Accessories</option>
			 <option value="Others">Others</option>
		</select>
	</div>
	<div class="form-control">
		<label for="gender">Gender:</label>
		<select class="form-input" name="gender" required>
			<option value="">Select Gender</option>
			<option value="men">Men</option>
			 <option value="women">Women</option>
			 <option value="unisex">Unisex</option>
		</select>
	</div>
	<div class="form-control">
		<label for="image">Image:</label>
		<input class="form-input" type="file" name="image" accept="image/*" required />
	</div>
	<div class="form-control">
		<input class="form-input btn btn-primary" type="submit" value="Add Product" />
	</div>
</form>
 </div>
</body>
</html>