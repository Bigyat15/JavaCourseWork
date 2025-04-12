package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
        String query = "SELECT ci.car_images_path, ci.car_id, c.car_name, c.car_description, c.car_price,c.engine_type,c.performance,c.transmission, cat.category_name " +
                "FROM car_images ci " +
                "JOIN car c ON ci.car_id = c.car_id " +
                "JOIN category cat ON c.category_id = cat.category_id " +
                "WHERE LOWER(TRIM(c.car_name)) = LOWER(TRIM(?))";


        try (PreparedStatement stmt = con.prepareStatement(query)) {
        	stmt.setString(1,carName);
        	ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String carImagesPath = rs.getString("car_images_path");
                Integer carID = rs.getInt("car_id");
                String carNamee = rs.getString("car_name");
                String carDescription = rs.getString("car_description");
                double carPrice = rs.getDouble("car_price");
                String engineType = rs.getString("engine_type");
                String performance = rs.getString("performance");
                String transmission = rs.getString("transmission");
                String categoryName = rs.getString("category_name");
                
                productImageModel image = new productImageModel(carImagesPath, carID,carNamee,carDescription,carPrice,engineType,performance,transmission,categoryName);
                imageList.add(image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageList;
    }
}
