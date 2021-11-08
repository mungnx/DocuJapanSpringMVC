package DocuJapan.Entity;

public class BillDetails {

	private int id;
	private int id_product;
	private int id_bill;
	private int quanty;
	private double total;
	
	
	public BillDetails(int id, int id_product, int id_bill, int quanty, double total) {
		super();
		this.id = id;
		this.id_product = id_product;
		this.id_bill = id_bill;
		this.quanty = quanty;
		this.total = total;
	}
	public int getId_bill() {
		return id_bill;
	}
	public void setId_bill(int id_bill) {
		this.id_bill = id_bill;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
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
	public BillDetails() {
		super();
	}
	
}
