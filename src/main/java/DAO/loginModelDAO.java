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
	public boolean loginAttempt(loginModel login) throws SQLException {
		boolean checked = false;
		if(con==null) {
			System.out.println("Connection failed successfully....");
			return checked;
		}
		String query = "Select password FROM users WHERE email=?";
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setNString(1, login.getEmail());
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String encryptedPassword = rs.getString("password");
				EncryptDecrypt ed = new EncryptDecrypt();
				String decryptedPassword = ed.decrypt(encryptedPassword);
				
				if(decryptedPassword != null && decryptedPassword.equals(login.getPassword())) {
					checked = true;
				}
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return checked;
		
	}
	
}
