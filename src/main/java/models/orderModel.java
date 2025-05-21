package models;

public class orderModel {
	private int order_id;
	private double total;
	private int car_id;
	private String car_name;
	private int cart_id;
	private int user_id;
	private String first_name;
	private String last_name;
	public orderModel(int order_id, double total, int car_id, String car_name, int cart_id, int user_id,
			String first_name, String last_name) {
		super();
		this.order_id = order_id;
		this.total = total;
		this.car_id = car_id;
		this.car_name = car_name;
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.first_name = first_name;
		this.last_name = last_name;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getCar_id() {
		return car_id;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	

}
