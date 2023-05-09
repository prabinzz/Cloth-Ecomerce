package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.ProductModel;
import helper.HandleImage;
import model.Product;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
public class AddProduct extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.getRequestDispatcher("/views/register.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ProductModel productModel = new ProductModel();
		Product NewProduct = new Product();
		HttpSession session = request.getSession(true);
		String error = "";

		NewProduct.setName(request.getParameter("name"));
		NewProduct.setDescription(request.getParameter("description"));
		NewProduct.setBrand(request.getParameter("brand"));
		NewProduct.setSize(request.getParameter("size"));
		NewProduct.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		NewProduct.setPrice(Double.parseDouble(request.getParameter("price")));
		NewProduct.setCategory(request.getParameter("category"));
		NewProduct.setGender(request.getParameter("gender"));

		try {
			NewProduct.setImage(HandleImage.handleImageUpload(request.getPart("image"),
					getServletContext().getInitParameter("imagePath"), "products/" + NewProduct.getName()));

			System.out.println(NewProduct.getImage());
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		productModel.addProduct(NewProduct);
		response.sendRedirect("/dashboard?page=add-product");

	}

}
