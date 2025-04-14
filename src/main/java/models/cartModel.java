package models;

public class cartModel {
	private Integer user_id;
	private Integer cart_id;
	private Integer car_id;
	private String quantity;
	private String car_name;
	private String car_description;
	private double car_price;
	private String store_image;
	public cartModel(Integer user_id, Integer cart_id, Integer car_id, String quantity, String car_name,
			String car_description, double car_price, String store_image) {
		super();
		this.user_id = user_id;
		this.cart_id = cart_id;
		this.car_id = car_id;
		this.quantity = quantity;
		this.car_name = car_name;
		this.car_description = car_description;
		this.car_price = car_price;
		this.store_image = store_image;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getCart_id() {
		return cart_id;
	}
	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}
	public Integer getCar_id() {
		return car_id;
	}
	public void setCar_id(Integer car_id) {
		this.car_id = car_id;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_description() {
		return car_description;
	}
	public void setCar_description(String car_description) {
		this.car_description = car_description;
	}
	public double getCar_price() {
		return car_price;
	}
	public void setCar_price(double car_price) {
		this.car_price = car_price;
	}
	public String getStore_image() {
		return store_image;
	}
	public void setStore_image(String store_image) {
		this.store_image = store_image;
	}
		
}
