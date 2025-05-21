package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
		 String query = "SELECT c.car_id, c.car_name, c.car_description, c.car_quantity, c.car_price, c.car_brand, c.car_year, c.store_image, " +
	               "c.car_model, c.category_id, cat.category_name, c.engine_type, c.performance, c.transmission " +
	               "FROM car AS c " +
	               "JOIN category AS cat ON c.category_id = cat.category_id";
		 try(Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)){
			 while(rs.next()) {
				int carID = rs.getInt("car_id");
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
				String engineTypes = rs.getString("engine_type");
	            String performance = rs.getString("performance");
	            String transmission = rs.getString("transmission");

	            productModel product = new productModel(carID,carName, carDescription, carQuantity, carPrice, carBrand, carYear, carModel, categoryID, categoryName, storeImages,engineTypes,performance,transmission);
				productList.add(product);				
			 }
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return productList;
	}
	
	public ArrayList<productModel> searchCars(String query) {
	    ArrayList<productModel> searchList = new ArrayList<>();
	    String sql = "SELECT c.car_id, c.car_name, c.car_description, c.car_quantity, c.car_price, " +
	             "c.car_brand, c.car_year, c.store_image, c.car_model, c.category_id, " +
	             "cat.category_name, c.engine_type, c.performance, c.transmission " +
	             "FROM car AS c " +
	             "JOIN category AS cat ON c.category_id = cat.category_id " +
	             "WHERE c.car_name LIKE ?";

	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, "%" + query + "%");  // Adding wildcards around the search query
	        ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	        	int carID = rs.getInt("car_id");
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
	            String engineTypes = rs.getString("engine_type");
	            String performance = rs.getString("performance");
	            String transmission = rs.getString("transmission");

	            productModel product = new productModel(carID,carName, carDescription, carQuantity, carPrice, carBrand, carYear, carModel, categoryID, categoryName, storeImages,engineTypes,performance,transmission);
	            searchList.add(product);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return searchList;
	}
	
	
	public ArrayList<productModel> getProductsByCategoryName(String categoryName) {
	    ArrayList<productModel> productList = new ArrayList<>();
	    String query = "SELECT c.car_id, c.car_name, c.car_description, c.car_quantity, c.car_price, c.car_brand, c.car_year, c.store_image, c.engine_type, c.performance, c.transmission, " +
	               "c.car_model, c.category_id, cat.category_name " +
	               "FROM car AS c " +
	               "JOIN category AS cat ON c.category_id = cat.category_id " +
	               "WHERE cat.category_name = ?";


	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        stmt.setString(1, categoryName);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	        	int carID = rs.getInt("car_id");
	            String carName = rs.getString("car_name");
	            String carDescription = rs.getString("car_description");
	            Integer carQuantity = rs.getInt("car_quantity");
	            double carPrice = rs.getDouble("car_price");
	            String carBrand = rs.getString("car_brand");
	            Integer carYear = rs.getInt("car_year");
	            Integer carModel = rs.getInt("car_model");
	            Integer categoryID = rs.getInt("category_id");
	            String categoryNameDb = rs.getString("category_name");
	            String storeImages = rs.getString("store_image");
	            String engineTypes = rs.getString("engine_type");
	            String performance = rs.getString("performance");
	            String transmission = rs.getString("transmission");

	            productModel product = new productModel(carID,carName, carDescription, carQuantity, carPrice, carBrand, carYear, carModel, categoryID, categoryNameDb, storeImages,engineTypes,performance,transmission);
	            productList.add(product);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return productList;
	}
	
	public void addProduct(String carName, String carDescription, Integer carQuantity, double carPrice,
            String carBrand, Integer carYear, Integer carModel, Integer categoryID,
            String categoryNameDb, String storeImages, String engine_type,
            String performance, String transmission) throws SQLException {

		String query = "INSERT INTO car (car_name, car_description, car_quantity, car_price, car_brand, " +
		        "car_year, car_model, category_id, store_image, engine_type, performance, transmission) " +
		        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement stmt = con.prepareStatement(query)) {
			stmt.setString(1, carName);
			stmt.setString(2, carDescription);
			stmt.setInt(3, carQuantity);
			stmt.setDouble(4, carPrice);
			stmt.setString(5, carBrand);
			stmt.setInt(6, carYear);
			stmt.setInt(7, carModel);
			stmt.setInt(8, categoryID);
			stmt.setString(9, storeImages);
			stmt.setString(10, engine_type);
			stmt.setString(11, performance);
			stmt.setString(12, transmission);

			stmt.executeUpdate();
		}
	}
	
	public boolean deleteProduct(String carName) throws SQLException {
		String deleteQuery = "DELETE FROM car WHERE car_name = ?";
		try(PreparedStatement stmt = con.prepareStatement(deleteQuery)){
			stmt.setString(1, carName);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		}
	}
	public void updateProduct(int carID, String carName, String carDescription, Integer carQuantity, double carPrice,
	        String carBrand, Integer carYear, Integer carModel, Integer categoryID,
	        String storeImages, String engine_type, String performance, String transmission) throws SQLException {

		String query = "UPDATE car SET car_name = ?, car_description = ?, car_quantity = ?, car_price = ?, car_brand = ?, " +
	               "car_year = ?, car_model = ?, category_id = ?, store_image = ?, engine_type = ?, performance = ?, transmission = ? " +
	               "WHERE car_id = ?";

		try (PreparedStatement stmt = con.prepareStatement(query)) {
		    stmt.setString(1, carName);
		    stmt.setString(2, carDescription);
		    stmt.setInt(3, carQuantity);
		    stmt.setDouble(4, carPrice);
		    stmt.setString(5, carBrand);
		    stmt.setInt(6, carYear);
		    stmt.setInt(7, carModel);
		    stmt.setInt(8, categoryID);
		    stmt.setString(9, storeImages);
		    stmt.setString(10, engine_type);
		    stmt.setString(11, performance);
		    stmt.setString(12, transmission);
		    stmt.setInt(13, carID);

		    stmt.executeUpdate();
		}

	}
	public String getImagePathByCarId(int carID) {
	    String imagePath = null;
	    try (PreparedStatement stmt = con.prepareStatement("SELECT store_image FROM car WHERE car_id = ?")) {
	        stmt.setInt(1, carID);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            imagePath = rs.getString("store_image");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return imagePath;
	}




}
