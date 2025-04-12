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
		 String query = "SELECT c.car_name, c.car_description, c.car_quantity, c.car_price, c.car_brand, c.car_year, c.store_image, " +
                 "c.car_model,c.category_id, cat.category_name " +
                 "FROM car AS c " +
                 "JOIN category AS cat ON c.category_id = cat.category_id";
		 try(Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)){
			 while(rs.next()) {
				
				String carName = rs.getString("car_name");
				String carDescription = rs.getString("car_description");
				Integer carQuantity = rs.getInt("car_quantity");
				double carPrice = rs.getDouble("car_price");
				String carBrand = rs.getString("car_brand");
				Integer carYear = rs.getInt("car_year");
				Integer carModel = rs.getInt("car_model");
				Integer categoryID = rs.getInt("category_id");
				String categoryName = rs.getString("category_name");
				String storeImages = rs.getString("store_image");
				productModel product = new productModel(carName,carDescription,carQuantity,carPrice,carBrand,carYear,carModel,categoryID,categoryName,storeImages);
				productList.add(product);				
			 }
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return productList;
	}
}
