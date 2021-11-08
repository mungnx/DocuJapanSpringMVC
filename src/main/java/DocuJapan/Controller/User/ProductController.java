package DocuJapan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dto.PaginatesDto;
import DocuJapan.Service.User.CategoryServiceImp;
import DocuJapan.Service.User.PaginatesServiceImp;
import DocuJapan.Service.User.ProductServiceImp;

@Controller
public class ProductController extends BaseController{
	@Autowired
	ProductServiceImp productService;
	
	@RequestMapping(value= "danh-sach-san-pham")
	public ModelAndView Index() {
		_mvShare.setViewName("user/products/product");
		_mvShare.addObject("product",productService.GetAllProducts());
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		
		return _mvShare;
		
	}

	
	@RequestMapping(value= {"chi-tiet-san-pham/{id}"})
	public ModelAndView Index(@PathVariable int id) {
		_mvShare.setViewName("user/products/product_categories");
		_mvShare.addObject("productById",productService.GetProductById(id));
		
		_mvShare.addObject("productByCategory",productService.GetProductByIdCategory(
				productService.GetProductById(id).getId_category()));
		return _mvShare;
		
	}
	

	@Autowired
	private CategoryServiceImp categoryService;
	
	
	@Autowired
	private PaginatesServiceImp paginateService;
	
	@RequestMapping(value = "/danh-sach-san-pham/{currentPage}")
	public ModelAndView AllProduct(@PathVariable String currentPage) {
		_mvShare.setViewName("user/products/product");
		
		int toltalData=productService.GetAllProducts().size();
		PaginatesDto paginateAll=paginateService.GetInfoPaginates(toltalData, 18, Integer.parseInt(currentPage));
		_mvShare.addObject("paginateAll",paginateAll);
		_mvShare.addObject("allProductsPaginate",categoryService.AllProductsPaginate(18,paginateAll.getStart()));
		return _mvShare;
	}

	
}
