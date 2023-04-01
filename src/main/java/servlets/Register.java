package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.Auth;


@SuppressWarnings("serial")
@WebServlet("/auth/register")
@MultipartConfig(fileSizeThreshold=1024*1024*10,  // 10 MB 
maxFileSize=1024*1024*50,       // 50 MB
maxRequestSize=1024*1024*100)    // 100 MB
public class Register extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Auth authModel = new Auth();
		String user_name = request.getParameter("user_name");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String image_url = "";
		try {
			// Extract file extension from filename
			Part image = request.getPart("image");
			String profileImagePath = getServletContext()
					.getInitParameter("profileImagePath"); // profile images path
			String fileName = image.getSubmittedFileName(); // uploaded file name
		    
			// get file extenction
			String fileExtension = "";
		    int i = fileName.lastIndexOf('.');
		    if (i > 0) {
		        fileExtension = fileName.substring(i + 1);
		    }
			String destinationPath = String.format("%s%s.%s", profileImagePath,user_name,fileExtension);	
			image_url = String.format("/img/profile/%s.%s", user_name, fileExtension);
			image.write(destinationPath);
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		authModel.register(user_name, first_name, last_name, address, email, password, phone,image_url);
		
	}

}


