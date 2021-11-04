package DocuJapan.Entity;

public class Slides {

	private int id;
		private String img;
		private String caption;
		private String content;
		public Slides(int id, String img, String caption, String content) {
			super();
			this.id = id;
			this.img = img;
			this.caption = caption;
			this.content = content;
		}
		public Slides() {
			super();
		}
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
		 * @return the img
		 */
		public String getImg() {
			return img;
		}
		/**
		 * @param img the img to set
		 */
		public void setImg(String img) {
			this.img = img;
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
		/**
		 * @return the content
		 */
		public String getContent() {
			return content;
		}
		/**
		 * @param content the content to set
		 */
		public void setContent(String content) {
			this.content = content;
		}
		
	
}
