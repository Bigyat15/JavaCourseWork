package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.cartModel;

public class cartModelDAO {
	private Connection con;
	
	public cartModelDAO() {
		try {
			this.con = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
	
	public void addToCart(cartModel item) throws SQLException{
	    int cartId = item.getCart_id();
	    int userID = item.getUser_id();
	    if(cartId == -1) {
	        cartId = createNewCartForUser(userID);
	        item.setCart_id(cartId);
	    }
	    
	    String checkQuery = "SELECT * from cart_items WHERE cart_id = ? AND car_id = ?";
	    try(PreparedStatement checkPs = con.prepareStatement(checkQuery)){
	        checkPs.setInt(1, cartId);
	        checkPs.setInt(2, item.getCar_id());
	        ResultSet rs = checkPs.executeQuery();
	        if(rs.next()) {
	            int currentQuantity = Integer.parseInt(rs.getString("quantity"));
	            int newQuantity = currentQuantity + Integer.parseInt(item.getQuantity());
	            double currentTotal = rs.getDouble("total");
	            double itemPrice = currentTotal / currentQuantity; // Calculate price per unit
	            double newTotal = itemPrice * newQuantity;
	            String updateQuery = "UPDATE cart_items SET quantity = ?, total = ? WHERE cart_id = ? AND car_id = ?";
	            try (PreparedStatement updatePs = con.prepareStatement(updateQuery)) {
	                updatePs.setInt(1, newQuantity);
	                updatePs.setDouble(2, newTotal);
	                updatePs.setInt(3, cartId);
	                updatePs.setInt(4, item.getCar_id());
	                updatePs.executeUpdate();
	            }
	        } else {
	            String insertQuery = "INSERT INTO cart_items (cart_id, car_id, quantity,total) VALUES (?, ?, ?,?)";
	            try(PreparedStatement insertPs = con.prepareStatement(insertQuery)){
	                insertPs.setInt(1, cartId);

	                insertPs.setInt(2, item.getCar_id());
	                insertPs.setString(3, item.getQuantity());
	                insertPs.setDouble(4, item.getTotalPrice());
	                int rowsAffected = insertPs.executeUpdate();
	                if (rowsAffected > 0) {
	                    System.out.println("Item added to cart_items successfully: Car ID = " + item.getCar_id());
	                } else {
	                    System.out.println("Failed to add item to cart_items");
	                }
	            }
	        }
	    }
	}

	
	
	public ArrayList<cartModel> getCartItem(int userID) throws SQLException {
		ArrayList<cartModel> cartList = new ArrayList<>();
		String cartQuery = "SELECT * FROM cart WHERE user_id = ?";
		int cartID = -1;
		try (PreparedStatement cartPs = con.prepareStatement(cartQuery)) {
			cartPs.setInt(1, userID);
			ResultSet cartRs = cartPs.executeQuery();
			if (cartRs.next()) {
				cartID = cartRs.getInt("cart_id");
			}
		}

		
		if (cartID != -1) {
			String query = "SELECT  ci.cart_id, ci.car_id, ci.quantity,ci.total, c.car_name, c.car_description, c.car_price, c.store_image " +
						   "FROM cart_items ci JOIN car c ON ci.car_id = c.car_id WHERE ci.cart_id = ?";
			try (PreparedStatement ps = con.prepareStatement(query)) {
				ps.setInt(1, cartID);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					
					int cartIDFromDb = rs.getInt("cart_id");
					int carID = rs.getInt("car_id");
					String quantity = rs.getString("quantity");
					double totalPrice = rs.getDouble("total");
					String carName = rs.getString("car_name");
					String carDescription = rs.getString("car_description");
					double carPrice = rs.getDouble("car_price");
					String storePath = rs.getString("store_image");

					cartModel cart = new cartModel(userID, cartIDFromDb, carID, quantity,totalPrice, carName, carDescription, carPrice, storePath);
					cartList.add(cart);
				}
			}
		}
		return cartList;
	}

	
	public int createNewCartForUser(int userId) throws SQLException {
	    String existingCartQuery = "SELECT cart_id FROM cart WHERE user_id = ?";
	    try (PreparedStatement existingCartPs = con.prepareStatement(existingCartQuery)) {
	        existingCartPs.setInt(1, userId);
	        ResultSet rs = existingCartPs.executeQuery();
	        if (rs.next()) {
	            int existingCartId = rs.getInt("cart_id");
	            System.out.println("Existing cart found for user " + userId + " with cart_id: " + existingCartId);
	            return existingCartId;
	        }
	    }
	    String query = "INSERT INTO cart (user_id) VALUES (?)";
	    try (PreparedStatement ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
	        ps.setInt(1, userId);
	        ps.executeUpdate();
	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            int newCartId = rs.getInt(1);
	            System.out.println("New cart created for user " + userId + " with cart_id: " + newCartId);
	            return newCartId;
	        }
	    }
	    throw new SQLException("Failed to create new cart for user_id " + userId);
	}
	
	public void incrementItemQuantity(int cartID,int carID) throws SQLException {
		String updateQuery = "UPDATE cart_items SET quantity = quantity + 1 where cart_id = ? AND car_id = ?";
		try(PreparedStatement ps = con.prepareStatement(updateQuery)){
			ps.setInt(1, cartID);
			ps.setInt(2, carID);
			ps.executeUpdate();
		}
	}
	
	public void decreaseItemQuantity(int cartID,int carID) throws SQLException {
		String updateQuery = "UPDATE cart_items SET quantity = quantity - 1 where cart_id = ? AND car_id = ?";
		try(PreparedStatement ps = con.prepareStatement(updateQuery)){
			ps.setInt(1, cartID);
			ps.setInt(2, carID);
			ps.executeUpdate();
		}
	}
	
	public void deleteCartItem(int cartID,int carID) throws SQLException {
		String deleteQuery = "DELETE FROM cart_items WHERE cart_id = ? AND car_id = ?";
		try(PreparedStatement ps = con.prepareStatement(deleteQuery)){
			ps.setInt(1, cartID);
			ps.setInt(2, carID);
			ps.executeUpdate();
			System.out.println("Cart item deleted: cartID=" + cartID + ", carID=" + carID);
		}
	}
	public void updateCartTotalPrice(int cartID,double totalPrice) throws SQLException {
		String query = "UPDATE cart_items SET total = ? WHERE cart_id = ?";
		try(PreparedStatement pst = con.prepareStatement(query)){
			pst.setDouble(1, totalPrice);
			pst.setInt(2, cartID);
			pst.executeUpdate();
		}
	}
	
	public int createOrder(double total) throws SQLException {
	    String query = "INSERT INTO `orders` (total) VALUES (?)";
	    try (PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	        stmt.setDouble(1, total);

	        int affectedRows = stmt.executeUpdate();
	        if (affectedRows == 0) {
	            throw new SQLException("Creating order failed, no rows affected.");
	        }

	        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                return generatedKeys.getInt(1); // Return the auto-generated order_id
	            } else {
	                throw new SQLException("Creating order failed, no ID obtained.");
	            }
	        }
	    }
	}


	
	public void addOrderItem(int orderId, int carId, int cartId, int userId) throws SQLException {
	    // Query with the correct column names (including order_id)
	    String query = "INSERT INTO order_items (order_id, car_id, cart_id, user_id) VALUES (?, ?, ?, ?)";
	    
	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        stmt.setInt(1, orderId);  // Binding the order_id
	        stmt.setInt(2, carId);    // Binding the car_id
	        stmt.setInt(3, cartId);   // Binding the cart_id
	        stmt.setInt(4, userId);   // Binding the user_id
	        stmt.executeUpdate();
	    }
	}



}
