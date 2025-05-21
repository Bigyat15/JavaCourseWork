package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.carColorsModel;

public class carColorModelDAO {
	private Connection con;
	public carColorModelDAO() {
		try {
			this.con=DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<carColorsModel> getCarColorList() throws SQLException {
	    ArrayList<carColorsModel> carColorList = new ArrayList<>();
	    String sql = "SELECT cc.car_colors_id, cc.colors_id, cc.car_id, c.car_name, col.color_name " +
	                 "FROM car_colors cc " +
	                 "JOIN car c ON cc.car_id = c.car_id " +
	                 "JOIN colors col ON cc.colors_id = col.colors_id";

	    try (PreparedStatement stmt = con.prepareStatement(sql)) {
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	        	Integer carColorID = rs.getInt("car_colors_id");
	            Integer colorID = rs.getInt("colors_id");
	            Integer carID = rs.getInt("car_id");
	            String carName = rs.getString("car_name");
	            String colorName = rs.getString("color_name");

	            carColorsModel color = new carColorsModel(carColorID,colorID,colorName,carID, carName);
	            carColorList.add(color);
	        }
	    }

	    return carColorList;
	}

	
	public boolean deleteCarColor(String colorID) throws SQLException {
	    String deleteQuery = "DELETE FROM car_colors WHERE colors_id = ?";  
	    try (PreparedStatement stmt = con.prepareStatement(deleteQuery)) {

	        stmt.setString(1, colorID);  
	        int rowsAffected = stmt.executeUpdate();

	        return rowsAffected >0; 
	    }
	}
	public boolean addCarColor(int carId, int colorId) throws SQLException {
	    String sql = "INSERT INTO car_colors (car_id, colors_id) VALUES (?, ?)";
	    
	    try (PreparedStatement stmt = con.prepareStatement(sql)) {
	        stmt.setInt(1, carId);
	        stmt.setInt(2, colorId);
	        
	        int rowsAffected = stmt.executeUpdate();
	        return rowsAffected > 0;
	    }
	}

	public boolean updateCarColor(int carColorId, int newCarId, int newColorId) throws SQLException {
	    String sql = "UPDATE car_colors SET car_id = ?, colors_id = ? WHERE car_colors_id = ?";
	    
	    try (PreparedStatement stmt = con.prepareStatement(sql)) {
	        stmt.setInt(1, newCarId);
	        stmt.setInt(2, newColorId);
	        stmt.setInt(3, carColorId);
	        
	        int rowsAffected = stmt.executeUpdate();
	        return rowsAffected > 0;
	    }
	}

	public carColorsModel getCarColorById(int carColorId) throws SQLException {
	    String sql = "SELECT cc.id, cc.car_id, c.car_name, cc.colors_id, col.color_name " +
	                 "FROM car_colors cc " +
	                 "JOIN car c ON cc.car_id = c.car_id " +
	                 "JOIN colors col ON cc.colors_id = col.colors_id " +
	                 "WHERE cc.id = ?";
	    
	    try (PreparedStatement stmt = con.prepareStatement(sql)) {
	        stmt.setInt(1, carColorId);
	        
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return new carColorsModel(
	            	rs.getInt("carColorId"),
	                rs.getInt("colors_id"),
	                rs.getString("color_name"),
	                rs.getInt("car_id"),
	                rs.getString("car_name")
	            );
	        }
	        return null;
	    }
	}
}
