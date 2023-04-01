package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Auth extends Database {
	public Auth() {
		super();
	}
	
	public int register(String user_name, String first_name, String last_name, String address, 
			String email, String password , String phone, String image ) {
		String query = "insert into user values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, user_name);
			pst.setString(2, first_name);
			pst.setString(3, last_name);
			pst.setString(4, address);
			pst.setString(5, email);
			pst.setString(6, password);
			pst.setString(7, phone);
			pst.setString(8, image);
			
			int row = pst.executeUpdate();
			return row;
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;
	}
}
