package DocuJapan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dto.PaginatesDto;
import DocuJapan.Service.User.CategoryServiceImp;
import DocuJapan.Service.User.PaginatesServiceImp;

@Controller
public class CategoryController extends BaseController {

	@Autowired
	private CategoryServiceImp categoryService;
	
	
	@Autowired
	private PaginatesServiceImp paginateService;
	
	private int totalProductPage=9;
	
	@RequestMapping(value = "/san-pham/{id}")
	public ModelAndView ProductById(@PathVariable int id) {
		_mvShare.setViewName("user/products/category");
		
		_mvShare.addObject("idCategory",id);
		_mvShare.addObject("categoryById",_homeService.GetCategoriesById(id));
		int toltalData=categoryService.GetAllProductsById(id).size();
		PaginatesDto paginateInfo=paginateService.GetInfoPaginates(toltalData, totalProductPage, 0);
		_mvShare.addObject("paginateInfo",paginateInfo);
	_mvShare.addObject("productsByPaginate",categoryService.GetDataProductsPaginate(id,totalProductPage,paginateInfo.getStart()));
		return _mvShare;
	
			
		}
	
	@RequestMapping(value = "/san-pham/{id}/{currentPage}")
	public ModelAndView Product(@PathVariable int id,@PathVariable String currentPage) {
		_mvShare.setViewName("user/products/category");
		
		_mvShare.addObject("idCategory",id);
		_mvShare.addObject("categoryById",_homeService.GetCategoriesById(id));
		int toltalData=categoryService.GetAllProductsById(id).size();
		PaginatesDto paginateInfo=paginateService.GetInfoPaginates(toltalData, totalProductPage, Integer.parseInt(currentPage));
		_mvShare.addObject("paginateInfo",paginateInfo);
		_mvShare.addObject("productsByPaginate",categoryService.GetDataProductsPaginate(id,totalProductPage,paginateInfo.getStart()));
		return _mvShare;
	}

	
}
