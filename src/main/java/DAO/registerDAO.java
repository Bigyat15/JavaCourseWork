package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.EncryptDecrypt;
import database.DatabaseConnection;
import models.loginModel;
import models.registerModel;

public class registerDAO {
	private Connection con;
	
	public registerDAO() {
		try {
			this.con = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public loginModel getUserById(int userId) throws SQLException {
	    String query = "SELECT * FROM user WHERE user_id = ?";
	    try (
	         PreparedStatement stmt = con.prepareStatement(query)) {
	        stmt.setInt(1, userId);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return new loginModel(
	                rs.getInt("user_id"),
	                rs.getString("first_name"),
	                rs.getString("last_name"),
	                rs.getString("dob"),
	                rs.getString("email"),
	                rs.getString("phone_number"),
	                null, // Don't return password
	                rs.getBoolean("is_admin"),
	                rs.getTimestamp("created_at").toLocalDateTime(),
	                rs.getTimestamp("updated_at").toLocalDateTime()
	            );
	        }
	    }
	    return null;
	}

	public boolean updateUserProfile(int userId, String firstName, String lastName, String email, String phoneNumber) throws SQLException {
	    // Correct the query to include first_name and last_name assignments
	    String query = "UPDATE user SET first_name = ?, last_name = ?, email = ?, phone_number = ?, updated_at = NOW() WHERE user_id = ?";
	    
	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        // Set the values for the placeholders in the query
	        stmt.setString(1, firstName);  // first_name
	        stmt.setString(2, lastName);   // last_name
	        stmt.setString(3, email);      // email
	        stmt.setString(4, phoneNumber); // phone_number
	        stmt.setInt(5, userId);        // user_id (for the WHERE clause)

	        // Execute the update and return whether the update was successful
	        return stmt.executeUpdate() > 0;
	    }
	}



}
