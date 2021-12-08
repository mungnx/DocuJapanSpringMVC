package DocuJapan.Entity;

public class Images {

	private int id;
	private String img;
	private int id_product;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public Images(int id, String img, int id_product) {
		super();
		this.id = id;
		this.img = img;
		this.id_product = id_product;
	}
	public Images() {
		super();
	}
	public Images(int id_product) {
		super();
		this.id_product = id_product;
	}
	
	
}
