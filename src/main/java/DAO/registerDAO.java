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
	public boolean addRegistrationDetail(registerModel register) throws SQLException {
		boolean hasInserted = false;
		EncryptDecrypt ed = new EncryptDecrypt();
		String encryptedPassword = ed.encrypt(register.getPassword());
		if(con == null) {
			System.out.println("Nothing has been inserted.");
			return hasInserted;
		}
		String query = "Insert INTO User(first_name,last_name,dob,email,phone_number,password,created_at,updated_at) VALUES (?,?,?,?,?,?,?,?)";
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, register.getFirst_name());
			ps.setString(2,register.getLast_name());
			ps.setString(3, register.getDOB());
			ps.setString(4,register.getEmail());
			ps.setString(5, register.getPhoneNumber());
			ps.setString(6, encryptedPassword);
			ps.setObject(7,register.getCreated_at());
			ps.setObject(8, register.getUpdated_at());
			
			hasInserted = ps.executeUpdate() > 0;
		}catch(SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
		}
		return hasInserted;
	}
	
	
	public boolean addUser(registerModel register) {
		boolean hasCreated = false;
		EncryptDecrypt ed = new EncryptDecrypt();
		String encryptedPassword = ed.encrypt(register.getPassword());
		if(con == null) {
			System.out.println("Nothing has been inserted.");
			return hasCreated;
		}
		String query = "Insert INTO User(first_name,last_name,dob,email,phone_number,password,created_at,updated_at) VALUES (?,?,?,?,?,?,?,?)";
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, register.getFirst_name());
			ps.setString(2,register.getLast_name());
			ps.setString(3, register.getDOB());
			ps.setString(4,register.getEmail());
			ps.setString(5, register.getPhoneNumber());
			ps.setString(6, encryptedPassword);
			ps.setObject(7,register.getCreated_at());
			ps.setObject(8, register.getUpdated_at());
			
			hasCreated = ps.executeUpdate() > 0;
		}catch(SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
		}
		return hasCreated;
		
	}
	
	public boolean deleteUser(int userID) throws SQLException {
		boolean hasDeleted = false;
		if(con==null) {
			System.out.println("No database connection found.");
			return hasDeleted;
		}
		String query = "DELETE FROM User WHERE user_id = ?";
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setInt(1, userID);
			hasDeleted = ps.executeUpdate() > 0;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return hasDeleted;
	}
	
	public boolean updateUser(int userID, String firstName, String lastName,String dob, String email,String phoneNumber) throws SQLException {
		boolean hasUpdated = false;
		String sql = "UPDATE user SET first_name = ?,last_name = ?,dob=?,email=?,phone_number=? WHERE user_id = ?";
		try(PreparedStatement stmt = con.prepareStatement(sql)){
			stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, dob);
            stmt.setString(4, email);
            stmt.setString(5, phoneNumber);
            stmt.setInt(6, userID);
            
            int dataAffected = stmt.executeUpdate();
            if(dataAffected > 0) {
            	hasUpdated = true;
            }
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return hasUpdated;
		
	}
	
	public boolean emailExist(String email) throws SQLException {
		boolean found = false;
		String query = "Select COUNT(*) FROM user WHERE email = ?";
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				found = rs.getInt(1) > 0;
			}
		}catch(SQLException e) {
			System.out.println("SQL Error in emailExists: " + e.getMessage());
			e.printStackTrace();
		}
		return found;
		
	}
	
	public boolean isSameUserEmail(int userId, String email) throws SQLException {
	    String query = "SELECT 1 FROM user WHERE user_id = ? AND email = ?";
	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        stmt.setInt(1, userId);
	        stmt.setString(2, email);
	        try (ResultSet rs = stmt.executeQuery()) {
	            return rs.next(); // true if same user's email
	        }
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
