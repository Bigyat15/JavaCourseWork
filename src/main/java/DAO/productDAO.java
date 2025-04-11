package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.productModel;

public class productDAO {
	private Connection con;
	public productDAO() {
		try {
			this.con=DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<productModel> getAllCars(){
		ArrayList <productModel> productList = new ArrayList<>();
		String query = "SELECT c.*, co.color_name, cat.category_name, img.car_images_path \n"
				+ "FROM car c\n"
				+ "JOIN colors co ON c.colors_id = co.colors_id\n"
				+ "JOIN category cat ON c.category_id = cat.category_id\n"
				+ "JOIN car_images img ON c.car_images_id = img.car_images_id\n"; 
		try(Statement stmt=con.createStatement(); ResultSet rs =stmt.executeQuery(query)){
			while(rs.next()) {
				String carName = rs.getString("car_name");
				String carDescription = rs.getString("car_description");
				int carQuantity = rs.getInt("car_quantity");
				double carPrice = rs.getDouble("car_price");
				String carBrand = rs.getString("car_brand");
				int carYear = rs.getInt("car_year");
				int carModel = rs.getInt("car_model");
				int colorsID = rs.getInt("colors_id");
				String colorsName = rs.getString("color_name");
				int categoryID = rs.getInt("category_id");
				String categoryName = rs.getString("category_name");
				int carImagesID = rs.getInt("car_images_id");
				String carImagePath = rs.getString("car_images_path");
				productModel product = new productModel(carName,carDescription,carQuantity,carPrice,carBrand,carYear,carModel,colorsID,colorsName,categoryID,categoryName,carImagesID,carImagePath);
				productList.add(product);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
}
