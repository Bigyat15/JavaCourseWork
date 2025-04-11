package models;

public class productModel {
	private String car_name;
	private String car_description;
	private Integer car_quantity;
	private double car_price;
	private String car_brand;
	private Integer car_year;
	private Integer car_model;
	private Integer colors_id;
	private String colors_name;
	private Integer category_id;
	private String category_name;
	private Integer car_images_id;
	private String car_images_path;
	public productModel(String car_name, String car_description, Integer car_quantity, double car_price,
			String car_brand, Integer car_year, Integer car_model, Integer colors_id,String colors_name, Integer category_id,
			String category_name,Integer car_images_id,String car_images_path) {
		
		this.car_name = car_name;
		this.car_description = car_description;
		this.car_quantity = car_quantity;
		this.car_price = car_price;
		this.car_brand = car_brand;
		this.car_year = car_year;
		this.car_model = car_model;
		this.colors_id = colors_id;
		this.colors_name = colors_name;
		this.category_id = category_id;
		this.category_name = category_name;
		this.car_images_id = car_images_id;
		this.car_images_path = car_images_path;
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
	public double isCar_price() {
		return car_price;
	}
	public void setCar_price(double car_price) {
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
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
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

	public double getCar_price() {
		return car_price;
	}

	public String getColors_name() {
		return colors_name;
	}

	public void setColors_name(String colors_name) {
		this.colors_name = colors_name;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
	
}
