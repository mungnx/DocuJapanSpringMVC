package DocuJapan.Entity;

public class Categories {

	private int id;
	private String name;
	private String caption;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the caption
	 */
	public String getCaption() {
		return caption;
	}
	/**
	 * @param caption the caption to set
	 */
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public Categories() {
		super();
	}
	public Categories(int id, String name, String caption) {
		super();
		this.id = id;
		this.name = name;
		this.caption = caption;
	}
	 
}
