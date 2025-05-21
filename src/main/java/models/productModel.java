package models;

public class productModel {
	private int car_id;
	private String car_name;
	private String car_description;
	private Integer car_quantity;
	private double car_price;
	private String car_brand;
	private Integer car_year;
	private Integer car_model;

	private Integer category_id;
	private String category_name;
	private String store_images;
	private String engine_type;
	private String performance;
	private String transmission;
	public productModel(int car_id, String car_name, String car_description, Integer car_quantity, double car_price,
			String car_brand, Integer car_year, Integer car_model, Integer category_id, String category_name,
			String store_images, String engine_type, String performance, String transmission) {
		super();
		this.car_id = car_id;
		this.car_name = car_name;
		this.car_description = car_description;
		this.car_quantity = car_quantity;
		this.car_price = car_price;
		this.car_brand = car_brand;
		this.car_year = car_year;
		this.car_model = car_model;
		this.category_id = category_id;
		this.category_name = category_name;
		this.store_images = store_images;
		this.engine_type = engine_type;
		this.performance = performance;
		this.transmission = transmission;
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
	public double getCar_price() {
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
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getStore_images() {
		return store_images;
	}
	public void setStore_images(String store_images) {
		this.store_images = store_images;
	}
	public String getEngine_type() {
		return engine_type;
	}
	public void setEngine_type(String engine_type) {
		this.engine_type = engine_type;
	}
	public String getPerformance() {
		return performance;
	}
	public void setPerformance(String performance) {
		this.performance = performance;
	}
	public String getTransmission() {
		return transmission;
	}
	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}
	
}
