package models;

public class colorModel {
	private Integer color_id;
	private String color_name;
	private Integer car_id;
	private String car_name;
	public colorModel(Integer color_id, String color_name, Integer car_id, String car_name) {
		super();
		this.color_id = color_id;
		this.color_name = color_name;
		this.car_id = car_id;
		this.car_name = car_name;
	}
	public colorModel(Integer color_id, String color_name) {
		this.color_id = color_id;
		this.color_name = color_name;
		// TODO Auto-generated constructor stub
	}
	
	public Integer getColor_id() {
		return color_id;
	}
	public void setColor_id(Integer color_id) {
		this.color_id = color_id;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
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
	
	
	

}
