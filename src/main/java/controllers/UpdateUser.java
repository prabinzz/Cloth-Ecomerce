package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import database.Auth;
import helper.Encryption;
import helper.HandleImage;
import model.User;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
public class UpdateUser extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			// prevent image load from cache
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");

			request.getRequestDispatcher("views/update-user.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Auth authModel = new Auth();
		User updateUser = new User();
		HttpSession session = request.getSession(true);
		String error = "";
		if (!request.getParameter("password").equals("")) {
			String password = request.getParameter("password");
			password = Encryption.encrypt(password);
			updateUser.setPassword(password);
		} else {
			updateUser.setPassword(null);
		}

		updateUser.setUserName(request.getParameter("user_name"));
		updateUser.setFirstName(request.getParameter("first_name"));
		updateUser.setLastName(request.getParameter("last_name"));
		updateUser.setAccountType("user");
		updateUser.setEmail(request.getParameter("email"));
		updateUser.setAddress(request.getParameter("address"));
		updateUser.setPhone(request.getParameter("phone"));
		try {
			Part filePart = request.getPart("image");
			if (filePart != null) {
				updateUser.setImageUrl(HandleImage.handleImageUpload(request.getPart("image"),
						getServletContext().getInitParameter("imagePath"), "profile/" + updateUser.getUserName()));

				System.out.println(updateUser.getImageUrl());
			} else {
				updateUser.setImageUrl(null);
				System.out.println("null image");
			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (error != "") {
			session.setAttribute("errorMessage", error);
			response.sendRedirect(request.getContextPath() + "/register");
		}
		authModel.updateUser(updateUser);

	}

}
