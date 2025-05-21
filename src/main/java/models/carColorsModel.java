package models;

public class carColorsModel {
	private Integer carColorsID;
	private Integer colorsID;
	private String colorsName;
	private Integer carID;
	private String carName;
	public carColorsModel(Integer carColorsID, Integer colorsID, String colorsName, Integer carID, String carName) {
		super();
		this.carColorsID = carColorsID;
		this.colorsID = colorsID;
		this.colorsName = colorsName;
		this.carID = carID;
		this.carName = carName;
	}
	public Integer getCarColorsID() {
		return carColorsID;
	}
	public void setCarColorsID(Integer carColorsID) {
		this.carColorsID = carColorsID;
	}
	public Integer getColorsID() {
		return colorsID;
	}
	public void setColorsID(Integer colorsID) {
		this.colorsID = colorsID;
	}
	public String getColorsName() {
		return colorsName;
	}
	public void setColorsName(String colorsName) {
		this.colorsName = colorsName;
	}
	public Integer getCarID() {
		return carID;
	}
	public void setCarID(Integer carID) {
		this.carID = carID;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	
	
	
}
