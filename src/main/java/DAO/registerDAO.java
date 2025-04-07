package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
		if(con == null) {
			System.out.println("Nothing has been inserted.");
			return hasInserted;
		}
		String query = "";
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, register.getFirst_name());
			ps.setString(2,register.getLast_name());
			ps.setString(3, register.getDOB());
			ps.setString(4,register.getEmail());
			ps.setString(5, register.getPhoneNumber());
			ps.setString(6, register.getPassword());
			
			hasInserted = ps.executeUpdate() > 0;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return hasInserted;
	}
}
