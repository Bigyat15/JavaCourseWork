package DAO;

import java.sql.Statement;
import java.sql.Connection;
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

}
