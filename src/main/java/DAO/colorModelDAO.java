package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;
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
	public ArrayList<colorModel> getColorList(String carName) throws SQLException {
		ArrayList<colorModel> colorList = new ArrayList<>();
		String query = "SELECT col.color_name, c.car_id, c.car_name " +
	               "FROM colors col " +
	               "JOIN car c ON col.car_id = c.car_id " +
	               "WHERE LOWER(TRIM(c.car_name)) = LOWER(TRIM(?))";

		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, carName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String colorName = rs.getString("color_name");
				int carID = rs.getInt("car_id");
				String carNamee = rs.getString("car_name");
				
				colorModel car = new colorModel(colorName,carID,carNamee);
				colorList.add(car);
			}
		}
		return colorList;
		
	}
}
