package entity;

import java.time.LocalDateTime;

public class TokenForgetPassword {
	private int id;
	private String token;
	private LocalDateTime expiryTime;
	private boolean isUsed;
	private Account account;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public LocalDateTime getExpiryTime() {
		return expiryTime;
	}
	public void setExpiryTime(LocalDateTime expiryTime) {
		this.expiryTime = expiryTime;
	}
	public boolean isUsed() {
		return isUsed;
	}
	public void setUsed(boolean isUsed) {
		this.isUsed = isUsed;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public TokenForgetPassword(int id, String token, LocalDateTime expiryTime, boolean isUsed, Account account) {
		super();
		this.id = id;
		this.token = token;
		this.expiryTime = expiryTime;
		this.isUsed = isUsed;
		this.account = account;
	}
	public TokenForgetPassword( String token, LocalDateTime expiryTime, boolean isUsed, Account account) {
		super();
	
		this.token = token;
		this.expiryTime = expiryTime;
		this.isUsed = isUsed;
		this.account = account;
	}
	public TokenForgetPassword() {
		super();
	}
	@Override
	public String toString() {
		return "TokenForgetPassword [id=" + id + ", token=" + token + ", expiryTime=" + expiryTime + ", isUsed="
				+ isUsed + ", account=" + account + "]";
	}
	
	
}
