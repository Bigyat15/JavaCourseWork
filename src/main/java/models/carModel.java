package models;

public class carModel {
	private String car_name;
	private String car_description;
	private Integer car_quantity;
	private Double car_price;
	private String car_brand;
	private Integer car_year;
	private Integer car_model;
	public carModel(String car_name, String car_description, Integer car_quantity, Double car_price, String car_brand,
			Integer car_year, Integer car_model) {
		super();
		this.car_name = car_name;
		this.car_description = car_description;
		this.car_quantity = car_quantity;
		this.car_price = car_price;
		this.car_brand = car_brand;
		this.car_year = car_year;
		this.car_model = car_model;
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
	public Integer getCar_quantity() {
		return car_quantity;
	}
	public void setCar_quantity(Integer car_quantity) {
		this.car_quantity = car_quantity;
	}
	public Double getCar_price() {
		return car_price;
	}
	public void setCar_price(Double car_price) {
		this.car_price = car_price;
	}
	public String getCar_brand() {
		return car_brand;
	}
	public void setCar_brand(String car_brand) {
		this.car_brand = car_brand;
	}
	public Integer getCar_year() {
		return car_year;
	}
	public void setCar_year(Integer car_year) {
		this.car_year = car_year;
	}
	public Integer getCar_model() {
		return car_model;
	}
	public void setCar_model(Integer car_model) {
		this.car_model = car_model;
	}
	
	
	
}
