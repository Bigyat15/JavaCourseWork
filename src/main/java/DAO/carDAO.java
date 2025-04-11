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
//	public ArrayList<carModel> getAllCars() {
//        ArrayList<carModel> carList = new ArrayList<>();
//
//        String query = "SELECT c.*, co.color_name FROM car c " +
//                "JOIN colors co ON c.colors_id = co.colors_id"; 
//
//        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
//            while (rs.next()) {
//                String carName = rs.getString("car_name");
//                String carDescription = rs.getString("car_description");
//                int carQuantity = rs.getInt("car_quantity");
//                double carPrice = rs.getDouble("car_price");
//                String carBrand = rs.getString("car_brand");
//                int carYear = rs.getInt("car_year");
//                int carModelNumber = rs.getInt("car_model");
//                int colorsID = rs.getInt("colors_id");
//                String colorName = rs.getString("color_name");
//                int carImagesID = rs.getInt("car_images_id");
//                String carImagesPath = rs.getString("car_images_path");
//                int categoryID = rs.getInt("category_id");
//                String categoryName = rs.getString("category_name");
//                String categoryImagePath = rs.getString("category_image_path");
//
//                carModel car = new carModel(
//                    carName, carDescription, carQuantity, carPrice, carBrand, carYear, carModelNumber,colorsID,colorName,carImagesID,carImagesPath,categoryID,categoryName,categoryImagePath
//                 );
//
//                carList.add(car);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return carList;
//    }
//	public ArrayList<carModel> getAllCategory(){
//		ArrayList<carModel> categoryList = new ArrayList<>();
//		String query = "Select * from category";
//		try(Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)){
//			while(rs.next()) {
//				int categoryID = rs.getInt("category_id");
//				String categoryName = rs.getString("category_name");
//				String categoryImagePath = rs.getString("category_image_path");
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
