package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Order;
import model.OrderItem;

public class OrderModel extends Database {

	public int addOrder(Order order) {
		String query = "INSERT INTO orders (user_name,total_amount,shipping_address,payment_type) VALUES (?,?,?,?)";
		try {
			PreparedStatement pst = conn().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			int orderId = getNextId();
			double total = 0;
			// calculate total price
			if (!order.getOrderItems().isEmpty()) {
				for (OrderItem orderItem : order.getOrderItems()) {
					total += orderItem.getPrice();
				}
			}
			pst.setString(1, order.getUserId());
			pst.setDouble(2, total);
			pst.setString(3, order.getShippingAddress());
			pst.setString(4, order.getPaymentType());
			int rowsAffected = pst.executeUpdate();
			if (rowsAffected == 0) {
				throw new SQLException("Failed to add order, no rows affected.");
			}

			try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					if (!order.getOrderItems().isEmpty()) {
						for (OrderItem orderItem : order.getOrderItems()) {
							orderItem.setOrderId(orderId);
							addOrderItem(orderItem);
						}
					}
					return generatedKeys.getInt(1);
				} else {
					throw new SQLException("Failed to add order, no ID obtained.");
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return 0;
	}

	public int addOrderItem(OrderItem orderItem) {
		String query = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?,?,?,?)";
		try {
			PreparedStatement pst = conn().prepareStatement(query);
			pst.setInt(1, orderItem.getOrderId());
			pst.setInt(2, orderItem.getProductId());
			pst.setInt(3, orderItem.getQuantity());
			pst.setDouble(4, orderItem.getPrice());

			int rowsAffected = pst.executeUpdate();
			if (rowsAffected == 0) {
				throw new SQLException("Failed to add order item, no rows affected.");
			}
			return rowsAffected;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return 0;
	}

	public int getNextId() {
		String query = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'cloth_ecom' AND TABLE_NAME = 'orders';";

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

//	public ArrayList<Order> getOrdersByUserId(int userId) {
//		ArrayList<Order> orderList = new ArrayList<>();
//		String query = "SELECT * FROM orders WHERE user_id = ?";
//
//		try (PreparedStatement pst = conn().prepareStatement(query)) {
//			pst.setInt(1, userId);
//			ResultSet rs = pst.executeQuery();
//
//			while (rs.next()) {
//				Order order = new Order();
//				order.setOrderId(rs.getInt("id"));
//				order.setUserId(String.valueOf(rs.getInt("user_id")));
//				order.setTotalAmount(rs.getDouble("total_price"));
//				order.setPaymentType(rs.getString("payment_type"));
//				order.setCreatedAt(rs.getTimestamp("created_at"));
//
//				orderList.add(order);
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//		}
//
//		return orderList;
//	}
//
//	public ArrayList<OrderItem> getOrderItemsByOrderId(int orderId) {
//		ArrayList<OrderItem> orderItemList = new ArrayList<>();
//		String query = "SELECT * FROM order_items WHERE order_id = ?";
//
//		try (PreparedStatement pst = conn().prepareStatement(query)) {
//			pst.setInt(1, orderId);
//			ResultSet rs = pst.executeQuery();
//
//			while (rs.next()) {
//				OrderItem orderItem = new OrderItem();
//				orderItem.setOrderItemId(rs.getString("order_item_id"));
//				orderItem.setOrderId(rs.getString("order_id"));
//				orderItem.setProductId(rs.getString("product_id"));
//				orderItem.setProductName(rs.getString("product_name"));
//				orderItem.setQuantity(rs.getInt("quantity"));
//				orderItem.setPrice(rs.getDouble("price"));
//
//				orderItemList.add(orderItem);
//			}
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//		}
//
//		return orderItemList;
//	}
}
