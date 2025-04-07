package models;

public class carModel {
	private String carName;
	private String carDescription;
	private Integer carQuantity;
	private Double carPrice;
	private String carBrand;
	private Integer carYear;
	private Integer carModel;
	
	public carModel(String carName, String carDescription, Integer carQuantity, Double carPrice, String carBrand,
			Integer carYear, Integer carModel) {
		super();
		this.carName = carName;
		this.carDescription = carDescription;
		this.carQuantity = carQuantity;
		this.carPrice = carPrice;
		this.carBrand = carBrand;
		this.carYear = carYear;
		this.carModel = carModel;
		
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarDescription() {
		return carDescription;
	}
	public void setCarDescription(String carDescription) {
		this.carDescription = carDescription;
	}
	public Integer getCarQuantity() {
		return carQuantity;
	}
	public void setCarQuantity(Integer carQuantity) {
		this.carQuantity = carQuantity;
	}
	public Double getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(Double carPrice) {
		this.carPrice = carPrice;
	}
	public String getCarBrand() {
		return carBrand;
	}
	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}
	public Integer getCarYear() {
		return carYear;
	}
	public void setCarYear(Integer carYear) {
		this.carYear = carYear;
	}
	public Integer getCarModel() {
		return carModel;
	}
	public void setCarModel(Integer carModel) {
		this.carModel = carModel;
	}
		
}
