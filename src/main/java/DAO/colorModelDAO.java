package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.carColorsModel;
import models.colorModel;

public class colorModelDAO {
	private Connection con;
	public colorModelDAO() {
		try {
			this.con=DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<colorModel> getAllColor() throws SQLException{
		ArrayList<colorModel> colorList = new ArrayList<>();
		String query = "SELECT * FROM colors";
		try(PreparedStatement stmt = con.prepareStatement(query)){
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Integer colorID = rs.getInt("colors_id");
				String colorName = rs.getString("color_name");
				
				colorModel color = new colorModel(colorID,colorName);
				colorList.add(color);
			}
		}
		return colorList;
	}
	
	public ArrayList<colorModel> getColorList(String carName) throws SQLException {
		ArrayList<colorModel> colorList = new ArrayList<>();
		String query = "SELECT col.colors_id, col.color_name, c.car_id, c.car_name " +
	               "FROM car_colors cc " +
	               "JOIN colors col ON cc.colors_id = col.colors_id " +
	               "JOIN car c ON cc.car_id = c.car_id " +
	               "WHERE LOWER(TRIM(c.car_name)) = LOWER(TRIM(?))";



		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, carName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Integer colorId = rs.getInt("colors_id");
				String colorName = rs.getString("color_name");
				int carID = rs.getInt("car_id");
				String carNamee = rs.getString("car_name");
				
				colorModel car = new colorModel(colorId,colorName,carID,carNamee);
				colorList.add(car);
			}
		}
		return colorList;
		
	}
	public void addColor(String colorName) throws SQLException {
	    String query = "INSERT INTO colors (color_name) VALUES (?)";
	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        stmt.setString(1, colorName);
	        stmt.executeUpdate();
	    }
	}
	public boolean deleteColor(String colorName) throws SQLException {
	    String deleteQuery = "DELETE FROM colors WHERE color_name = ?";  
	    try (PreparedStatement stmt = con.prepareStatement(deleteQuery)) {

	        stmt.setString(1, colorName);  
	        int rowsAffected = stmt.executeUpdate();

	        return rowsAffected >0; 
	    }
	}
	public boolean updateColor(int colorId, String newName) throws SQLException {
	    String sql = "UPDATE colors SET color_name = ? WHERE colors_id = ?";
	    try (
	         PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setString(1, newName);
	        pstmt.setInt(2, colorId);
	        return pstmt.executeUpdate() > 0;
	    }
	}
	
	
}
