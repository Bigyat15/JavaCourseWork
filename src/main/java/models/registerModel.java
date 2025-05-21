package models;

import java.time.LocalDateTime;

public class registerModel {
	private String first_name ;
	private String last_name;
	private String DOB;
	private String email;
	private String phoneNumber;
	private boolean isAdmin;
	private String password;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	public registerModel(String first_name, String last_name, String dOB, String email, String phoneNumber,
			boolean isAdmin, LocalDateTime created_at, LocalDateTime updated_at,String password) {
		this.first_name = first_name;
		this.last_name = last_name;
		DOB = dOB;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.isAdmin = false;
		this.created_at = LocalDateTime.now();
		this.updated_at = LocalDateTime.now();
		this.password = password;
	}

	
//	public registerModel(String first_name2, String last_name2, String dOB2, String email2, String phoneNumber2,
//			String password2, String confirmPassword) {
//		// TODO Auto-generated constructor stub
//	}


	public registerModel(String first_name2, String last_name2, String dOB2, String email2, String phoneNumber2,
			String password2, String confirmPassword) {
		// TODO Auto-generated constructor stub
	}


	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
		updateTimestamps();
		
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
		updateTimestamps();
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
		updateTimestamps();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		updateTimestamps();
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
		updateTimestamps();
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
		updateTimestamps();
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
		updateTimestamps();
	}
	public LocalDateTime getCreated_at() {
		return created_at;
	}
	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
		updateTimestamps();
	}
	public LocalDateTime getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(LocalDateTime updated_at) {
		this.updated_at = updated_at;
	}
	
	public void updateTimestamps() {
		this.updated_at = LocalDateTime.now();
	}
	

}
