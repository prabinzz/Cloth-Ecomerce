package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@SuppressWarnings("serial")
@WebServlet("/auth/register")
@MultipartConfig(fileSizeThreshold=1024*1024*10,  // 10 MB 
maxFileSize=1024*1024*50,       // 50 MB
maxRequestSize=1024*1024*100)    // 100 MB
public class Register extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String id = "1";
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
			String destinationPath = String.format("%s%s.%s", profileImagePath,id,fileExtension);			
			image.write(destinationPath);
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}


