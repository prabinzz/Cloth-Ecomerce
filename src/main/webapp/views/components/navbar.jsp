<%@page import="model.Product"%>
<%@page import="database.ProductModel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="database.Auth"%>
<%@page import="model.User"%>
<style>
	.nav_userprofile{
		display: flex;
		gap: 1rem;
		align-items: center;
	}
	.cart{
		position: relative;
		width: 50px;
		height: 50px;
		border-radius: 9999px;
		border: 1px solid var(--accent-color);
	}
	
	.cart-img{
		padding: 10px;
		padding-top: 8px;
		padding-left: 8px;
		font-size: 30px;
		line-height: 30px;
	}
	.cart-count{
		position: absolute;
		background-color: var(--accent-color);
		padding: 5px;
		width: 25px;
		height: 25px;
		text-align: center;
		border-radius: 999px;
		top: -10px;
		right: -10px;
	}
	.cart-card{
		display: flex;
		gap: 1rem
	}
	.cart-image > img{
		width: 80px;
	}
	#cart_toggle{
		width: 400px;
	}
	.search{
		border: 1px solid gray;
		border-radius: 999px;
		overflow: hidden;
		box-shadow: var(--shadow-sm);
	}
	.search>input{
		padding: 10px 15px;
		font-size: 1rem;
		border: none;
	}
	.search>input:focus{
		outline: none;
		
	}
	.purchase{
		margin-top: 1rem;
		width: 100%;
	}
	.purchase input{
		width: 100%;
	}
	.nav_userdetails_expanded{
		margin-bottom: 5px;
	}
	.compact{
		padding-left: 30px;
		padding-right: 30px;
	}
	.nav-main{
		background: #ddd;
	}
	.action{
		padding: 8px 0px;
		padding-left: 10px;
		margin: 5px 0px;
		border-left: 4px solid var(--accent-color);
	}
	.action:hover{
		color: var(--accent-color) !important;
	}
</style>
<div class="nav-main w-full">
	<nav class='nav <%= // if compact parameter provided is true add compact class else add container class 
						request.getParameter("compact") != null && 
						request.getParameter("compact").equals("true") ? 
						"compact": "container" %> mx-auto'>
		<ul class="nav_navigation">
			<li class="nav_navitem"><a href="/">Home</a></li>
			<li class="nav_navitem"><a href="/login">Login</a></li>
			<li class="nav_navitem"><a href="/register">Register</a></li>
		</ul>
		<div class="search">
			<input id="search-input" type="text" placeholder="search">
		</div>
		<c:choose>
			<c:when test="${sessionScope.loggedInUserName == null}">
				<a href="/login"
					><input class="btn btn-primary" type="button" value="Login"
				/></a>
			</c:when>
			<c:otherwise>
				<%  
					Auth authModel = new Auth();
					ProductModel productModel = new ProductModel();
					User loggedInUser = authModel.getUserWithUserName((String)session.getAttribute("loggedInUserName"));
					ArrayList<Integer> cart = (ArrayList<Integer>) session.getAttribute("cart");
				%>
						
				<div class="nav_userdetails">
					<div class="nav_userprofile">
					<div class="cart" onclick="toggle('cart_toggle')">
						<div class="cart-count"><%= cart != null ? cart.size() : 0%></div>
						<i class="cart-img fa-solid fa-cart-shopping"></i>
					</div>
					<img
						onclick="toggle('userdetail_toggle')"
						src="${sessionScope.loggedInUserImage}"
						class="nav_userdetails_iamge"
					/>
					</div>
					<div id="cart_toggle" class="nav_userdetails_expanded">
						<% if(cart != null) {
							for(Integer item : cart){
								Product cartProduct = productModel.getProductById(String.valueOf(item));
						%>
							<div class="cart-card">
								<div class="cart-image"> <img alt="<%= cartProduct.getName() %>" src="<%= cartProduct.getImage() %>"></div>
								<div>
									<div>Id: <%= cartProduct.getId() %></div>
									<div><%= cartProduct.getName() %></div>
									<div><i class="price-icon fa-solid fa-dollar-sign"></i> <%= cartProduct.getPrice() %></div>
								</div>
							</div>
							
						<% }%>
						<a href="/checkout">
							<div class="purchase"> <input type="button" class="btn btn-primary" value="Purchase"/></div>
						</a>
						<%}else{ %>
							<div> Your Cart is empty.</div>
							<%} %>
					</div>
					<div id="userdetail_toggle" class="nav_userdetails_expanded">
						<p><span class="bold">User Name:</span><%= loggedInUser.getUserName() %></p>
						<p><span class="bold">Email:</span><%= loggedInUser.getEmail() %></p>
						<p><span class="bold">Name:</span><%= loggedInUser.getFullName() %></p>
						<p><span class="bold">Account Type:</span><%= loggedInUser.getAccountType() %></p>
						<div class="action">
							<a href="update-user?user=${sessionScope.loggedInUserName}">
								<i class="fa-solid fa-pen action_icon"></i>
								<p>Update User</p>
							</a>
						</div>
						<% if(loggedInUser.getAccountType().equals("admin")){ %>
							<div class="action">
								<a href="/dashboard">
									<i class="fa-solid fa-chart-line action_icon"></i>
									<p>Dashboard</p>
								</a>
							</div>
						<% }%>
						<div class="action">
							<a href="/history">
								<i class="fa-solid fa-timeline"></i>
								<p>View Orders History</p>
							</a>
						</div>
						<div class="action">
							<a href="/logout">
								<i class="fa-solid fa-arrow-right-from-bracket action_icon"></i>
								<p>Log Out</p>
							</a>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<script>
			const searchInput = document.getElementById("search-input");
			
			// focusout if enter is pressed
			searchInput.addEventListener("keydown", (event) => {
				  if (event.key === "Enter") {
				    searchInput.blur();
				  }
				});
			// change url to search url if searchbox looses focus
			searchInput.addEventListener("focusout", function() {
			  const searchValue = searchInput.value;
			  if(searchValue != ""){
				  
				  var newUrl = "/?search="+searchValue;
				  // replace the current URL with the new URL
				  window.location.href = newUrl;
			  }
			});

			var toggle = (target) => {
				let targetDiv = document
					.getElementById(target)
					.classList.toggle("show");
			};
		</script>
	</nav>
</div>
