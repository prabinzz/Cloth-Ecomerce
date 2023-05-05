package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		if (!session.getAttribute("loggedInUserName").equals(null)) {
			request.getParameter("ProductId");
			ArrayList<Integer> cart;
			if (session.getAttribute("cart").equals(null)) {
				cart = new ArrayList<Integer>();
			} else {
				cart = (ArrayList<Integer>) session.getAttribute("cart");
			}
			cart.add(Integer.parseInt(request.getParameter("productId")));
		}
		response.sendRedirect("/");
	}

}
