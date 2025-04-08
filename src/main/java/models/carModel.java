package models;

public class carModel {
	private String car_name;
	private String car_description;
	private Integer car_quantity;
	private Double car_price;
	private String car_brand;
	private Integer car_year;
	private Integer car_model;
	private Integer colors_id;
	private String color_name;
	private Integer car_images_id;
	private String car_images_path;
	public carModel(String car_name, String car_description, Integer car_quantity, Double car_price, String car_brand,
			Integer car_year, Integer car_model,Integer colors_id,String color_name,Integer car_images_id,String car_images_path) {
		super();
		this.car_name = car_name;
		this.car_description = car_description;
		this.car_quantity = car_quantity;
		this.car_price = car_price;
		this.car_brand = car_brand;
		this.car_year = car_year;
		this.car_model = car_model;
		this.colors_id = colors_id;
		this.color_name=color_name;
		this.car_images_id = car_images_id;
		this.car_images_path=car_images_path;
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
	public Integer getColors_id() {
		return colors_id;
	}
	public void setColors_id(Integer colors_id) {
		this.colors_id = colors_id;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}
	public Integer getCar_images_id() {
		return car_images_id;
	}
	public void setCar_images_id(Integer car_images_id) {
		this.car_images_id = car_images_id;
	}
	public String getCar_images_path() {
		return car_images_path;
	}
	public void setCar_images_path(String car_images_path) {
		this.car_images_path = car_images_path;
	}
	
	
	
}
