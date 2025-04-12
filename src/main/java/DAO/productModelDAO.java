package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.productModel;

public class productModelDAO {
	private Connection con;
	
	public productModelDAO() {
		try {
			this.con=DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<productModel> getAllProductDetail(){
		 ArrayList<productModel> productList = new ArrayList<>();
		 String query = "SELECT c.car_name, c.car_description, c.car_quantity, c.car_price, c.car_brand, c.car_year, " +
                 "c.car_model, c.colors_id, col.color_name, c.category_id, cat.category_name " +
                 "FROM car c " +
                 "JOIN colors col ON c.colors_id = col.colors_id " +
                 "JOIN category cat ON c.category_id = cat.category_id";
		 try(Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)){
			 while(rs.next()) {
				
				String carName = rs.getString("car_name");
				String carDescription = rs.getString("car_description");
				Integer carQuantity = rs.getInt("car_quantity");
				double carPrice = rs.getDouble("car_price");
				String carBrand = rs.getString("car_brand");
				Integer carYear = rs.getInt("car_year");
				Integer carModel = rs.getInt("car_model");
				Integer colorID = rs.getInt("colors_id");
				String colorName = rs.getString("color_name");
				Integer categoryID = rs.getInt("category_id");
				String categoryName = rs.getString("category_name");
				
				productModel product = new productModel(carName,carDescription,carQuantity,carPrice,carBrand,carYear,carModel,colorID,colorName,categoryID,categoryName);
				productList.add(product);				
			 }
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return productList;
	}
}
