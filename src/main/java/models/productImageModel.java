package models;

public class productImageModel {
	private String car_images_path;
	private Integer car_id;

	public productImageModel(String car_images_path, Integer car_id) {
		super();
		this.car_images_path = car_images_path;
		this.car_id = car_id;

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

	
	
	
}
