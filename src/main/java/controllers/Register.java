package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import database.Auth;
import helper.Encryption;
import model.User;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
@WebServlet("/register")
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
		newUser.setEmail(request.getParameter("email"));
		newUser.setPassword(password);
		newUser.setAddress(request.getParameter("address"));
		newUser.setUserName(request.getParameter("user_name"));

		try {
			// Extract file extension from filename
			Part image = request.getPart("image");
			String profileImagePath = getServletContext().getInitParameter("profileImagePath"); // profile images path
			String fileName = image.getSubmittedFileName(); // uploaded file name

			// get file extenction
			String fileExtension = "";
			int i = fileName.lastIndexOf('.');
			if (i > 0) {
				fileExtension = fileName.substring(i + 1);
			}
			String destinationPath = String.format("%s%s.%s", profileImagePath, newUser.getUserName(), fileExtension);
			newUser.setImageUrl(String.format("/img/profile/%s.%s", newUser.getUserName(), fileExtension));
			image.write(destinationPath);
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			error = "Error while uploading image";
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
