package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	public static Connection conn() {
		String url = "jdbc:mysql://aws.connect.psdb.cloud/cloth_ecom?sslMode=VERIFY_IDENTITY";
		String username = "mo7ldcmdqpktdaahy8ex";
		String password = "pscale_pw_n1U1KYrqaDyEoJ2umjMnzLtqWono5YYgzcfsHeQM7Sk";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
