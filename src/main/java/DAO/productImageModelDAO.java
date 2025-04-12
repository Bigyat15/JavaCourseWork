package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.productImageModel;

public class productImageModelDAO {
	private Connection con;
	public productImageModelDAO() {
		try {
			this.con = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<productImageModel> getProductImage(String carName) {
        ArrayList<productImageModel> imageList = new ArrayList<>();
        String query = "SELECT ci.car_images_path, ci.car_id, c.car_name " +
                "FROM car_images ci " +
                "JOIN car c ON ci.car_id = c.car_id " +
                "WHERE c.car_name = '" + carName + "'";

        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                String carImagesPath = rs.getString("car_images_path");
                Integer carID = rs.getInt("car_id");
                productImageModel image = new productImageModel(carImagesPath, carID);
                imageList.add(image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageList;
    }
}
