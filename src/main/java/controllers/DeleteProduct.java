package controllers;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProductModel;

public class DeleteProduct extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ProductModel productModel = new ProductModel();
		String id = request.getParameter("id");
		if (!id.equals(null)) {
			productModel.deleteById(Integer.parseInt(id));
			response.sendRedirect("/dashboard?page=view-products");
		}
	}

}
