package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.EncryptDecrypt;
import database.DatabaseConnection;
import models.loginModel;

public class loginModelDAO {
	private Connection con;
	public loginModelDAO() {
		try {
			this.con = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public loginModel loginAttempt(loginModel login) throws SQLException {
		
		if(con==null) {
			System.out.println("Connection failed successfully....");
			return null;
		}
		String query = "Select password,is_admin FROM User WHERE email=?";
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setNString(1, login.getEmail());
			
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String encryptedPassword = rs.getString("password");
				boolean is_admin = rs.getBoolean("is_admin");
				EncryptDecrypt ed = new EncryptDecrypt();
				String decryptedPassword = ed.encrypt(login.getPassword());
				
				if(decryptedPassword != null && decryptedPassword.equals(encryptedPassword)) {
					return new loginModel(login.getEmail(), login.getPassword(), is_admin);
				}
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
}
