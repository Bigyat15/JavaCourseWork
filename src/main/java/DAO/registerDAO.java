package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.EncryptDecrypt;
import database.DatabaseConnection;
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
}
