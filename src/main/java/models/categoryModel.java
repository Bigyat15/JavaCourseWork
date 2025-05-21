package models;

public class categoryModel {
	private Integer caregory_id;
	private String category_name;
	private String category_image_path;
	private String category_description;
	public categoryModel(Integer caregory_id, String category_name, String category_image_path,String category_description) {
		super();
		this.caregory_id = caregory_id;
		this.category_name = category_name;
		this.category_image_path = category_image_path;
		this.category_description=category_description;
	}
	public Integer getCaregory_id() {
		return caregory_id;
	}
	public void setCaregory_id(Integer caregory_id) {
		this.caregory_id = caregory_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_image_path() {
		return category_image_path;
	}
	public void setCategory_image_path(String category_image_path) {
		this.category_image_path = category_image_path;
	}
	public String getCategory_description() {
		return category_description;
	}
	public void setCategory_description(String category_description) {
		this.category_description = category_description;
	}
	
	

}
