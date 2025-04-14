package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	            String updateQuery = "UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND car_id = ?";
	            try(PreparedStatement updatePs = con.prepareStatement(updateQuery)){
	                updatePs.setInt(1, newQuantity);
	                updatePs.setInt(2, cartId);
	                updatePs.setInt(3, item.getCar_id());
	                updatePs.executeUpdate();
	            }
	        } else {
	            String insertQuery = "INSERT INTO cart_items (cart_id, user_id, car_id, quantity) VALUES (?, ?, ?, ?)";
	            try(PreparedStatement insertPs = con.prepareStatement(insertQuery)){
	                insertPs.setInt(1, cartId);
	                insertPs.setInt(2, userID);
	                insertPs.setInt(3, item.getCar_id());
	                insertPs.setString(4, item.getQuantity());
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
			String query = "SELECT ci.user_id, ci.cart_id, ci.car_id, ci.quantity, c.car_name, c.car_description, c.car_price, c.store_image " +
						   "FROM cart_items ci JOIN car c ON ci.car_id = c.car_id WHERE ci.cart_id = ?";
			try (PreparedStatement ps = con.prepareStatement(query)) {
				ps.setInt(1, cartID);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					int userIDD = rs.getInt("user_id");
					int cartIDFromDb = rs.getInt("cart_id");
					int carID = rs.getInt("car_id");
					String quantity = rs.getString("quantity");
					String carName = rs.getString("car_name");
					String carDescription = rs.getString("car_description");
					double carPrice = rs.getDouble("car_price");
					String storePath = rs.getString("store_image");

					cartModel cart = new cartModel(userIDD, cartIDFromDb, carID, quantity, carName, carDescription, carPrice, storePath);
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


}
