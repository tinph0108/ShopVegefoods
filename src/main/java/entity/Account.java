package entity;

public class Account {
	private String uID; // mã tài khoản
	private String email; // tên tài khoản
	private String password; // mật khẩu
	private boolean isSell; // có quyền bán hàng hay không
	private boolean isAdmin; // có quyền quản trị hay không
	public Account() {
		super();
	}
	public Account(String uID, String email, String password, boolean isSell, boolean isAdmin) {
		super();
		this.uID = uID;
		this.email = email;
		this.password = password;
		this.isSell = isSell;
		this.isAdmin = isAdmin;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
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

	public boolean isSell() {
		return isSell;
	}
	public void setSell(boolean isSell) {
		this.isSell = isSell;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "Account [uID=" + uID + ", email=" + email + ", password=" + password + ", isSell=" + isSell
				+ ", isAdmin=" + isAdmin + "]";
	}
	
	
}
