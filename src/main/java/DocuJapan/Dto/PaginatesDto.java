package DocuJapan.Dto;

public class PaginatesDto {

	private int currentPage;
	private int limit;
	private int start, end,toltalPage;
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getLimit() {
		return limit;
	}
	
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	public int getStart() {
		return start;
	}
	
	public void setStart(int start) {
		this.start = start;
	}
	
	public int getEnd() {
		return end;
	}
	
	public void setEnd(int end) {
		this.end = end;
	}
	
	public int getToltalPage() {
		return toltalPage;
	}
	public void setToltalPage(int totalPage) {
		this.toltalPage = totalPage;
	}
	public PaginatesDto() {
		super();
	}
	public PaginatesDto(int currentPage, int limit, int start, int end, int toltalPage) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
		this.start = start;
		this.end = end;
		this.toltalPage = toltalPage;
	}
}

