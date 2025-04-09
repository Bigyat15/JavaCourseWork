package DAO;

import java.sql.Connection;
import java.sql.SQLException;

import database.DatabaseConnection;

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
	
	public ArrayList<category>

}
