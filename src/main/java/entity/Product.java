package entity;

public class Product {
	private String maSP;
	private String tenSP;
	private double giaBan;
	private String donViTinh;
	private String tinhTrang;
	private DanhMuc danhMuc;
	private String hinh1;
	private String moTa;
	private int khoiLuong;
	private int soLuong;
    private String hinh2;
    private String hinh3;
    private String hinh4;
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public double getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(double giaBan) {
		this.giaBan = giaBan;
	}
	public String getDonViTinh() {
		return donViTinh;
	}
	public void setDonViTinh(String donViTinh) {
		this.donViTinh = donViTinh;
	}
	public String getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public DanhMuc getDanhMuc() {
		return danhMuc;
	}
	public void setDanhMuc(DanhMuc danhMuc) {
		this.danhMuc = danhMuc;
	}
	public String getHinh1() {
		return hinh1;
	}
	public void setHinh1(String hinh1) {
		this.hinh1 = hinh1;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public int getKhoiLuong() {
		return khoiLuong;
	}
	public void setKhoiLuong(int khoiLuong) {
		this.khoiLuong = khoiLuong;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getHinh2() {
		return hinh2;
	}
	public void setHinh2(String hinh2) {
		this.hinh2 = hinh2;
	}
	public String getHinh3() {
		return hinh3;
	}
	public void setHinh3(String hinh3) {
		this.hinh3 = hinh3;
	}
	public String getHinh4() {
		return hinh4;
	}
	public void setHinh4(String hinh4) {
		this.hinh4 = hinh4;
	}
	public Product(String maSP, String tenSP, double giaBan, String donViTinh, String tinhTrang, DanhMuc danhMuc,
			String hinh1, String moTa, int khoiLuong, int soLuong, String hinh2, String hinh3, String hinh4) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.giaBan = giaBan;
		this.donViTinh = donViTinh;
		this.tinhTrang = tinhTrang;
		this.danhMuc = danhMuc;
		this.hinh1 = hinh1;
		this.moTa = moTa;
		this.khoiLuong = khoiLuong;
		this.soLuong = soLuong;
		this.hinh2 = hinh2;
		this.hinh3 = hinh3;
		this.hinh4 = hinh4;
	}
	public Product() {
		super();
	}
	@Override
	public String toString() {
		return "Product [maSP=" + maSP + ", tenSP=" + tenSP + ", giaBan=" + giaBan + ", donViTinh=" + donViTinh
				+ ", tinhTrang=" + tinhTrang + ", danhMuc=" + danhMuc + ", hinh1=" + hinh1 + ", moTa=" + moTa
				+ ", khoiLuong=" + khoiLuong + ", soLuong=" + soLuong + ", hinh2=" + hinh2 + ", hinh3=" + hinh3
				+ ", hinh4=" + hinh4 + "]";
	}
    
    
}
