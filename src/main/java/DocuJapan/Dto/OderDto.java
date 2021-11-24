package DocuJapan.Dto;

import java.util.Date;

public class OderDto {
	
	private int id;
	private String username;
	private String phone;
	private String address;
	private String productName;
	private String size;
	private float price;
	private int sale;
	private int quanty;
	private double total;
	private String note;
	private Date created_at;
	private Date close_at;
	
	public int getId() {
		return id;
	}
	public void setId(int id_bill) {
		this.id = id_bill;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getQuanty() {
		return quanty;
	}
	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getClose_at() {
		return close_at;
	}
	public void setClose_at(Date close_at) {
		this.close_at = close_at;
	}
	public OderDto(int id_bill, String username, String phone, String address, String productName, String size,
			float price, int sale, int quanty, double total, String note, Date created_at, Date close_at) {
		super();
		this.id = id_bill;
		this.username = username;
		this.phone = phone;
		this.address = address;
		this.productName = productName;
		this.size = size;
		this.price = price;
		this.sale = sale;
		this.quanty = quanty;
		this.total = total;
		this.note = note;
		this.created_at = created_at;
		this.close_at = close_at;
	}
	public OderDto() {
		super();
	}

}
