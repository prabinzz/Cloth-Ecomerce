package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
						user.getString(5), user.getString(6), user.getString(7), user.getString(8), user.getString(8));
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
}
