<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<jsp:include page="/views/components/globelHead.jsp" />
<style type="text/css">
.sidebar {
  width: 250px;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #4CAF50;
}

.menu {
  margin-top: 50px;
  padding: 0;
  list-style: none;
}

.menu li {
  margin: 10px 0;
}

.menu li a {
  display: block;
  padding: 10px 20px;
  color: var(--text-color);
  text-decoration: none;
  font-size: 16px;
  font-weight: bold;
  transition: background-color 0.3s;
}

.menu li a:hover {
  background-color: var(--secondary-color);
}

</style>
</head>
<body>
<div class="sidebar">
  <ul class="menu">
    <li><a href="/dashboard?page=view-products">View Products</a></li>
    <li><a href="/dashboard?page=edit-product">Edit Products</a></li>
    <li><a href="/dashboard?page=add-product">Add Product</a></li>
    <li><a href="/dashboard?page=view-order">View Orders</a></li>
  </ul>
</div>

<main style="margin-left: 250px;">
	<jsp:include page="/views/components/navbar.jsp">
	    <jsp:param name="compact" value="true" />
	</jsp:include>
	
  <div style="margin: 0px 30px;"> 
		 <%
	String parameter = request.getParameter("page");
	
	if (parameter != null && parameter.equals("add-product")) {
	    %>
	    <jsp:include page="/views/dashboardComponents/add-product.jsp" />
	    <%
	} else if (parameter != null && parameter.equals("view-products")) {
	    %>
	    <jsp:include page="/views/dashboardComponents/view-product.jsp" />
	    <%
	}else if (parameter != null && parameter.equals("edit-product")) {
	    %>
	    <jsp:include page="/views/dashboardComponents/edit-product.jsp" />
	    <%
	} else if (parameter != null && parameter.equals("view-order")) {
	    %>
	    <jsp:include page="/views/dashboardComponents/view-order.jsp" />
	    <%
	} else {
	    %>
	    <jsp:include page="/views/dashboardComponents/default.jsp" />
	    <%
	}
	%>
  </div>
</main>
</body>
</html>