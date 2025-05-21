package DAO;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;
import models.categoryModel;

public class categoryDAO {
	private Connection con;
	
	public categoryDAO() {
		try {
			this.con = DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<categoryModel> getAllCategory(){
	ArrayList<categoryModel> categoryList = new ArrayList<>();
	String query = "Select * from category";
	try(Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)){
		while(rs.next()) {
			int categoryID = rs.getInt("category_id");
			String categoryName = rs.getString("category_name");
			String categoryImagePath = rs.getString("category_image_path");
			String categoryDescription = rs.getString("category_description");
			System.out.println(categoryDescription);
			
			categoryModel cat = new categoryModel(categoryID,categoryName,categoryImagePath,categoryDescription);
			categoryList.add(cat);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return categoryList;
	}
	
	public ArrayList<categoryModel> getCategoryByName(String categoryName){
		ArrayList<categoryModel> categoryNameList = new ArrayList<>();
		String query = "SELECT * FROM  category WHERE category_name = ?";
		
		try(PreparedStatement stmt = con.prepareStatement(query)){
			stmt.setString(1, categoryName);
			try(ResultSet rs = stmt.executeQuery()){
				while(rs.next()) {
					int categoryID = rs.getInt("category_id");
					String categoryNamee = rs.getString("category_name");
					String categoryImagePath = rs.getString("category_image_path");
					String categoryDescription = rs.getString("category_description");
					categoryModel cat = new categoryModel(categoryID,categoryNamee,categoryImagePath,categoryDescription);
					categoryNameList.add(cat);
				}
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return categoryNameList;
	}
	public boolean addCategory(String categoryName, String categoryImage, String categoryDescription) throws SQLException {
	    String query = "INSERT INTO category (category_name, category_image_path, category_description) VALUES (?,?,?)";
	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        stmt.setString(1, categoryName);
	        stmt.setString(2, categoryImage);
	        stmt.setString(3, categoryDescription);
	        stmt.executeUpdate();
	        return true;
	    }
	}

	public boolean deleteCategory(String categoryName) throws SQLException {
		String sql = "DELETE FROM category WHERE category_name = ?";
		try(PreparedStatement stmt = con.prepareStatement(sql)){
			stmt.setString(1, categoryName);
			int affectedRows = stmt.executeUpdate();
			return affectedRows >0;
		}
	}
	public boolean updateCategory(int categoryId, String categoryName, String categoryImagePath, String categoryDescription) throws SQLException {
	    String sql = "UPDATE category SET category_name = ?, category_image_path = ?, category_description = ? WHERE category_id = ?";
	    try(PreparedStatement stmt = con.prepareStatement(sql)){
	        stmt.setString(1, categoryName);
	        stmt.setString(2, categoryImagePath);
	        stmt.setString(3, categoryDescription);
	        stmt.setInt(4, categoryId);
	        return stmt.executeUpdate() > 0;
	    }
	}
	public ArrayList<categoryModel> getCategoryById(int categoryId) {
	    ArrayList<categoryModel> categoryList = new ArrayList<>();
	    String query = "SELECT * FROM category WHERE category_id = ?";
	    
	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        stmt.setInt(1, categoryId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                int id = rs.getInt("category_id");
	                String name = rs.getString("category_name");
	                String imagePath = rs.getString("category_image_path");
	                String desc = rs.getString("category_description");
	                categoryList.add(new categoryModel(id, name, imagePath, desc));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return categoryList;
	}

}
