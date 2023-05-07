package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Auth;
import database.OrderModel;
import database.ProductModel;
import model.Order;
import model.OrderItem;
import model.Product;

public class Checkout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		OrderModel orderModel = new OrderModel();
		ProductModel productModel = new ProductModel();
		Auth authModel = new Auth();
		HttpSession session = request.getSession();
		Order order = new Order();
		if (session.getAttribute("loggedInUserName") != null) {
			order.setUserId((String) session.getAttribute("loggedInUserName"));
			order.setPaymentType(request.getParameter("payment-type"));
			order.setShippingAddress(request.getParameter("payment-address"));

			ArrayList<Integer> cart = (ArrayList<Integer>) session.getAttribute("cart");
			for (Integer productId : cart) {
				Product product = productModel.getProductById(String.valueOf(productId));
				OrderItem orderItem = new OrderItem();
				orderItem.setProductId(product.getId());
				orderItem.setPrice(product.getPrice());
				orderItem.setQuantity(1);
				order.addOrderItem(orderItem);
			}
			orderModel.addOrder(order);
		}
	}

}
