package models;

public class loginModel {
	private String email;
	private String password;
	private boolean is_admin;
	public loginModel(String email, String password,boolean is_admin) {
		super();
		this.email = email;
		this.password = password;
		this.is_admin= is_admin;
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
