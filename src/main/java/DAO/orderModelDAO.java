package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.Statement;
import database.DatabaseConnection;
import models.orderModel;

public class orderModelDAO {
	private Connection con;
	public orderModelDAO() {
		try {
			this.con=DatabaseConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<orderModel> getAllOrder() throws SQLException{
		ArrayList<orderModel> orderList = new ArrayList<>();
		String query = "SELECT oi.order_id, oi.car_id, oi.cart_id, oi.user_id, o.total, " +
	               "c.car_name, c.car_brand, u.first_name, u.last_name " +  
	               "FROM order_items oi " +
	               "JOIN car c ON oi.car_id = c.car_id " + 
	               "JOIN cart ca ON oi.cart_id = ca.cart_id " + 
	               "JOIN user u ON oi.user_id = u.user_id " +
	               "JOIN orders o ON oi.order_id = o.order_id";

		try(Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)){
			while(rs.next()) {
				int orderId = rs.getInt("order_id");
				double total = rs.getDouble("total");
				int carId = rs.getInt("car_id");
				String carName = rs.getString("car_name");
				int cartId = rs.getInt("cart_id");
				int userId = rs.getInt("user_id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				
				
				orderModel order = new orderModel(orderId,total,carId,carName,cartId,userId,firstName,lastName);
				orderList.add(order);
			}
			
		}
		return orderList;
	}
}
