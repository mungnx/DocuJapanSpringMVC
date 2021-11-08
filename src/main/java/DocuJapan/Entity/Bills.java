package DocuJapan.Entity;

public class Bills {
	private int id;
	private String username;
	private String phone;
	private String address;
	private String email;
	private double total;
	private int quanty;
	private String note;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getQuanty() {
		return quanty;
	}
	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Bills(int id, String username, String phone, String address, String email, double total,
			int quanty, String note) {
		super();
		this.id = id;
		this.username = username;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.total = total;
		this.quanty = quanty;
		this.note = note;
	}
	public Bills() {
		super();
	}
	
	
	

}
