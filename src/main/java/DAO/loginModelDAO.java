package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Statement;

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
		String query = "Select user_id,password,is_admin FROM User WHERE  email=?";
		try(PreparedStatement ps = con.prepareStatement(query)){

			ps.setNString(1, login.getEmail());
			
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String encryptedPassword = rs.getString("password");
				boolean is_admin = rs.getBoolean("is_admin");
				int user_id = rs.getInt("user_id");
				EncryptDecrypt ed = new EncryptDecrypt();
				String decryptedPassword = ed.encrypt(login.getPassword());
				
				if(decryptedPassword != null && decryptedPassword.equals(encryptedPassword)) {
					return new loginModel(user_id,login.getFirst_name(),login.getLast_name(),login.getDob(),login.getEmail(),login.getPhone_number(), login.getPassword(), is_admin,login.getCreated_at(),login.getUpdated_at());
				}
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public ArrayList<loginModel> getAllUserInfo() throws SQLException{
		ArrayList<loginModel> loginList = new ArrayList<>();
		String query = "Select * from user";
		try(PreparedStatement ps=con.prepareStatement(query)){
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			int userID = rs.getInt("user_id");
			String firstName = rs.getString("first_name");
			String lastName = rs.getString("last_name");
			String dob = rs.getString("dob");
			String email = rs.getString("email");
			String phoneNumber = rs.getString("phone_number");
			String password = rs.getString("password");
			boolean isAdmin = rs.getBoolean("is_admin");
			LocalDateTime createdAt = rs.getTimestamp("created_at").toLocalDateTime();
			LocalDateTime updatedAt = rs.getTimestamp("updated_at").toLocalDateTime();

			loginModel user = new loginModel(userID,firstName,lastName,dob,email,phoneNumber,password,isAdmin,createdAt,updatedAt);
			loginList.add(user);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return loginList;
	}
	
}
