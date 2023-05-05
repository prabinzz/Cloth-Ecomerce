package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Auth;
import helper.Encryption;
import model.User;

@SuppressWarnings("serial")
@WebServlet("/login")
public class Login extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.getRequestDispatcher("views/login.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Auth authModel = new Auth();
		HttpSession session = request.getSession(true);
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		User user = authModel.getUserWithUserName(user_name);
		if (user != null) {
			String saved_password = user.getPassword();
			// match password with hassed passwrod
			if (Encryption.matches(password, saved_password)) {
				session.setAttribute("loggedInUserName", user.getUserName());
				session.setAttribute("loggedInUserImage", user.getImageUrl());
				response.sendRedirect("/");
			} else {
				session.setAttribute("errorMessage", "Password Didn't match");
				response.sendRedirect("/login");
			}
		} else {
			// user not found
			session.setAttribute("errorMessage", "User Not Found");
			response.sendRedirect("/login");
		}

	}

}
