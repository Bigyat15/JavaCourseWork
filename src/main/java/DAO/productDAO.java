package DAO;

import java.sql.Connection;
import java.sql.SQLException;

import database.DatabaseConnection;

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
	
}
