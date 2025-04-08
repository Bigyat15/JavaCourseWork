package DAO;


import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.carModel;

public class carDAO {
	private Connection con;
	public carDAO() {
		try {
			this.con = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<carModel> getAllCars() {
        ArrayList<carModel> carList = new ArrayList<>();

        String query = "SELECT * FROM car";

        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                String carName = rs.getString("car_name");
                String carDescription = rs.getString("car_description");
                int carQuantity = rs.getInt("car_quantity");
                double carPrice = rs.getDouble("car_price");
                String carBrand = rs.getString("car_brand");
                int carYear = rs.getInt("car_year");
                int carModelNumber = rs.getInt("car_model");

                carModel car = new carModel(
                    carName, carDescription, carQuantity, carPrice, carBrand, carYear, carModelNumber
                );

                carList.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carList;
    }
}
