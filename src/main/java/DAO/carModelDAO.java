package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DatabaseConnection;
import models.carModel;

public class carModelDAO {
	private Connection con;
	public carModelDAO() {
		try {
			this.con = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<carModel> getAllCars() throws SQLException{
		ArrayList<carModel> carsList = new ArrayList<>();
		if(con==null) {
			System.out.println("Database Connection successfully failed!!!");
			return null;
		}
		String sql = "Select * from car";
		PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				carModel cm = new carModel(
						rs.getString("car_name"),
						rs.getString("car_description"),
						rs.getInt("car_quantity"),
						rs.getDouble("car_price"),
						rs.getString("car_brand"),
						rs.getInt("car_year"),
						rs.getInt("car_model")
						);
				carsList.add(cm);
			}
			
			
		
		return carsList;
		
		
	}
}
