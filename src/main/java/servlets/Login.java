package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Auth;
import helper.Encryption;


@SuppressWarnings("serial")
@WebServlet("/auth/login")
public class Login extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Auth authModel = new Auth();
		HttpSession session = request.getSession(true);
		String base_url = request.getContextPath();
		String login_url = base_url+"/auth/login.jsp";
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		ResultSet user = authModel.getUserWithUserName(user_name);
		try {
			if(user.next()) {
				String saved_password = user.getString("password");
				
				// match password with hassed passwrod
				if(Encryption.matches(password, saved_password)) {
					session.setAttribute("loggedInUser", user.getString("user_name"));
					response.sendRedirect(base_url);
				}else {
					session.setAttribute("errorMessage", "Password Didn't match");
					response.sendRedirect(login_url);
				}
			}else {
				// user not found
				session.setAttribute("errorMessage", "User Not Found");
				response.sendRedirect(login_url);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}


