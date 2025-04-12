package models;

public class productImageModel {
	private String car_images_path;
	private Integer car_id;
	private String car_name;
	private String car_description;
	private double car_price;
	private String category_name;
	private String engine_type;
	private String performance;
	private String transmission;
	
	
	public productImageModel(String car_images_path, Integer car_id, String car_name, String car_description,
			double car_price, String category_name, String engine_type, String performance, String transmission) {
		super();
		this.car_images_path = car_images_path;
		this.car_id = car_id;
		this.car_name = car_name;
		this.car_description = car_description;
		this.car_price = car_price;
		this.category_name = category_name;
		this.engine_type = engine_type;
		this.performance = performance;
		this.transmission = transmission;
	}
	public String getCar_images_path() {
		return car_images_path;
	}
	public void setCar_images_path(String car_images_path) {
		this.car_images_path = car_images_path;
	}
	public Integer getCar_id() {
		return car_id;
	}
	public void setCar_id(Integer car_id) {
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
	public double getCar_price() {
		return car_price;
	}
	public void setCar_price(double car_price) {
		this.car_price = car_price;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
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
