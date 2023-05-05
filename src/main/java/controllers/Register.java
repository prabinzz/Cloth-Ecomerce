package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Auth;
import helper.Encryption;
import helper.HandleImage;
import model.User;

@SuppressWarnings("serial")
@WebServlet("/register")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
public class Register extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.getRequestDispatcher("views/register.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Auth authModel = new Auth();
		User newUser = new User();
		HttpSession session = request.getSession(true);
		String error = "";
		String password = request.getParameter("password");
		password = Encryption.encrypt(password);

		newUser.setUserName(request.getParameter("user_name"));
		newUser.setFirstName(request.getParameter("first_name"));
		newUser.setLastName(request.getParameter("last_name"));
		newUser.setAccountType("user");
		newUser.setEmail(request.getParameter("email"));
		newUser.setPassword(password);
		newUser.setAddress(request.getParameter("address"));
		newUser.setPhone(request.getParameter("phone"));
		try {
			newUser.setImageUrl(HandleImage.HandleImageUpload(request.getPart("image"),
					getServletContext().getInitParameter("imagePath"), "profile/" + newUser.getUserName()));

			System.out.println(newUser.getImageUrl());
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (authModel.checkAvailableUser(newUser.getUserName())) {
			error = "User Already Exist";
		}

		if (error != "") {
			session.setAttribute("errorMessage", error);
			response.sendRedirect(request.getContextPath() + "/register");
		}
		authModel.register(newUser);

	}

}
