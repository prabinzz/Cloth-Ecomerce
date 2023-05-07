package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class Auth extends Database {
	public int register(User user) {
		String query = "insert into user values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = conn().prepareStatement(query);
			pst.setString(1, user.getUserName());
			pst.setString(2, user.getAccountType());
			pst.setString(3, user.getFirstName());
			pst.setString(4, user.getLastName());
			pst.setString(5, user.getEmail());
			pst.setString(6, user.getPassword());
			pst.setString(7, user.getAddress());
			pst.setString(8, user.getPhone());
			pst.setString(9, user.getImageUrl());

			int row = pst.executeUpdate();
			return row;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public User getUserWithUserName(String userName) {
		String query = "select * from user where user_name=?";
		ResultSet user = null;
		try {
			PreparedStatement pst = conn().prepareStatement(query);
			pst.setString(1, userName);
			user = pst.executeQuery();
			if (user.next()) {
				User newUser = new User(user.getString(1), user.getString(2), user.getString(3), user.getString(4),
						user.getString(5), user.getString(6), user.getString(7), user.getString(8), user.getString(9));
				return newUser;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public boolean checkAvailableUser(String userName) {
		String query = "select * from user where user_name=?";
		try {
			PreparedStatement pst = conn().prepareStatement(query);
			pst.setString(1, userName);
			return pst.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public int updateUser(User user) {
		String query = "update user set ";
		List<Object> values = new ArrayList<Object>();

		// Build the SET clause dynamically based on which fields are not null
		if (user.getAccountType() != null) {
			query += "account_type=?, ";
			values.add(user.getAccountType());
		}
		if (user.getFirstName() != null) {
			query += "first_name=?, ";
			values.add(user.getFirstName());
		}
		if (user.getLastName() != null) {
			query += "last_name=?, ";
			values.add(user.getLastName());
		}
		if (user.getEmail() != null) {
			query += "email=?, ";
			values.add(user.getEmail());
		}
		if (user.getPassword() != null) {
			query += "password=?, ";
			values.add(user.getPassword());
		}
		if (user.getAddress() != null) {
			query += "address=?, ";
			values.add(user.getAddress());
		}
		if (user.getPhone() != null) {
			query += "phone=?, ";
			values.add(user.getPhone());
		}
		if (user.getImageUrl() != null) {
			query += "image=?, ";
			values.add(user.getImageUrl());
		}

		// Remove the trailing comma and space from the SET clause
		query = query.substring(0, query.length() - 2);

		// Add the WHERE clause to update only the specified user
		query += " where user_name=?";

		try {
			PreparedStatement pst = conn().prepareStatement(query);

			// Set the parameter values for the UPDATE statement
			for (int i = 0; i < values.size(); i++) {
				pst.setObject(i + 1, values.get(i));
			}
			pst.setString(values.size() + 1, user.getUserName());

			int row = pst.executeUpdate();
			return row;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<User> getAllUsers() {
		ArrayList<User> userList = new ArrayList<>();
		String query = "SELECT * FROM user";

		try (Statement stmt = conn().createStatement(); ResultSet rs = stmt.executeQuery(query)) {

			while (rs.next()) {
				User user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));

				userList.add(user);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return userList;
	}

}
