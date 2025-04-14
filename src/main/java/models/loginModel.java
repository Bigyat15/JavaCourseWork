package models;

public class loginModel {
	private Integer user_id;
	private String email;
	private String password;
	private boolean is_admin;
	public loginModel(Integer user_id, String email, String password, boolean is_admin) {
		super();
		this.user_id = user_id;
		this.email = email;
		this.password = password;
		this.is_admin = is_admin;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isIs_admin() {
		return is_admin;
	}
	public void setIs_admin(boolean is_admin) {
		this.is_admin = is_admin;
	}
	
}
