package entity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


public class Order {
	private int orderID;
	private Account account;
	private String firstName;
	private String lastName;
	private String address;
	private String phone;
	private String email;
	private LocalDate  orderDate;
	private double totalAmount;
	public Order() {
		super();
	}
	public Order(Account account, String firstName, String lastName, String address, String phone, String email, LocalDate orderDate, double totalAmount) {
        this.account = account;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
    }
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDate getOrderDate() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return LocalDate.parse(orderDate.format(formatter), formatter);
	}
	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	@Override
	public String toString() {
		return "Order [orderID=" + orderID + ", account=" + account + ", firstName=" + firstName + ", lastName="
				+ lastName + ", address=" + address + ", phone=" + phone + ", email=" + email + ", orderDate="
				+ orderDate + ", totalAmount=" + totalAmount + "]";
	}

	
	
}
