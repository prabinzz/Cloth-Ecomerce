package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Product;

public class ProductModel extends Database {
	public int addProduct(Product product) {
		String query = "insert into products values(?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = conn().prepareStatement(query);
			pst.setString(1, String.valueOf(getNextId()));
			pst.setString(2, product.getName());
			pst.setString(3, product.getBrand());
			pst.setString(4, product.getDescription());
			pst.setString(5, product.getSize());
			pst.setString(6, String.valueOf(product.getQuantity()));
			pst.setString(7, String.valueOf(product.getPrice()));
			pst.setString(8, product.getCategory());
			pst.setString(9, product.getGender());
			pst.setString(10, product.getImage());

			int row = pst.executeUpdate();
			return row;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getNextId() {
		String query = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'cloth_ecom' AND TABLE_NAME = 'products';";

		try (Statement stmt = conn().createStatement(); ResultSet rs = stmt.executeQuery(query)) {

			if (rs.next()) {
				return rs.getInt("AUTO_INCREMENT");
				// Use nextId for your insert statement
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Product> getAllProducts() {
		ArrayList<Product> productList = new ArrayList<>();
		String query = "SELECT * FROM products";

		try (Statement stmt = conn().createStatement(); ResultSet rs = stmt.executeQuery(query)) {

			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setBrand(rs.getString("brand"));
				product.setDescription(rs.getString("description"));
				product.setSize(rs.getString("size"));
				product.setQuantity(rs.getInt("quantity"));
				product.setPrice(rs.getDouble("price"));
				product.setCategory(rs.getString("category"));
				product.setGender(rs.getString("gender"));
				product.setImage(rs.getString("image"));

				productList.add(product);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return productList;
	}

	public int deleteById(int id) {
		PreparedStatement stmt = null;
		try {
			// Prepare a SQL statement to delete the product with the given ID
			stmt = conn().prepareStatement("DELETE FROM products WHERE id = ?");
			stmt.setInt(1, id);

			// Execute the SQL statement to delete the product
			stmt.executeUpdate();
			return 1;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Product getProductById(String id) {
		String query = "select * from products where id=?";
		ResultSet product = null;
		try {
			PreparedStatement pst = conn().prepareStatement(query);
			pst.setInt(1, Integer.parseInt(id));
			product = pst.executeQuery();
			if (product.next()) {
				Product newProduct = new Product(product.getInt(1), product.getString(2), product.getString(3),
						product.getString(4), product.getString(5), product.getInt(6), product.getDouble(7),
						product.getString(8), product.getString(9), product.getString(10));
				return newProduct;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public ArrayList<Product> searchProduct(String searchText) {
		ArrayList<Product> productList = new ArrayList<>();
		String query = "SELECT * FROM products WHERE name LIKE '%" + searchText + "%' OR brand LIKE '%" + searchText
				+ "%'";

		try (Statement stmt = conn().createStatement(); ResultSet rs = stmt.executeQuery(query)) {
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setBrand(rs.getString("brand"));
				product.setDescription(rs.getString("description"));
				product.setSize(rs.getString("size"));
				product.setQuantity(rs.getInt("quantity"));
				product.setPrice(rs.getDouble("price"));
				product.setCategory(rs.getString("category"));
				product.setGender(rs.getString("gender"));
				product.setImage(rs.getString("image"));

				productList.add(product);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return productList;
	}

}
