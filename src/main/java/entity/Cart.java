package entity;

public class Cart {
	private String maCart;
	private Account account;
	private Product product;
	private int amount;
	public Cart(String maCart, Account account, Product product, int amount) {
		super();
		this.maCart = maCart;
		this.account = account;
		this.product = product;
		this.amount = amount;
	}
	public Cart() {
		super();
	}
	public String getMaCart() {
		return maCart;
	}
	public void setMaCart(String maCart) {
		this.maCart = maCart;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Cart [maCart=" + maCart + ", account=" + account + ", product=" + product + ", amount=" + amount + "]";
	}
	
	
	
}
