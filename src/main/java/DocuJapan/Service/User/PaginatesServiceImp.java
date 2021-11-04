package DocuJapan.Service.User;
import org.springframework.stereotype.Service;

import DocuJapan.Dto.PaginatesDto;
@Service
public class PaginatesServiceImp {

	public PaginatesDto GetInfoPaginates(int toltalData, int limit, int currentPage) {

		PaginatesDto paginate=new PaginatesDto();
		
		paginate.setLimit(limit);
		paginate.setToltalPage(SetInfoTotalPage(toltalData, limit));
		paginate.setCurrentPage(CheckCurrentPage(currentPage,paginate.getToltalPage()));
		
		int start =FindStart(paginate.getCurrentPage(), limit);
		paginate.setStart(start); 
		
		int end=FindEnd(paginate.getStart(),limit,toltalData);
		paginate.setEnd(end);
		
		return  paginate;
	}
	private int FindEnd(int start, int limit,int toltalData) {
		return start+limit> toltalData ? toltalData :(start+limit)-1 ;
	}
	private int FindStart(int currentPage, int limit) {

		return ((currentPage-1)*limit)+1;
	}
	private int SetInfoTotalPage(int toltalData, int limit) {
		int totalPage=0;
		totalPage=toltalData/limit;
		totalPage=totalPage*limit< toltalData ? totalPage + 1 : totalPage;
		return totalPage;
		
	}
	
	
	public int CheckCurrentPage(int currentPage, int totalPage) {
		if(currentPage<1) {
			return 1;
		}
		if(currentPage>totalPage) {
			return totalPage;
		}
		return currentPage;
	}
}
