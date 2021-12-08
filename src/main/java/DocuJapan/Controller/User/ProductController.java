package DocuJapan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dto.PaginatesDto;
import DocuJapan.Service.User.CategoryServiceImp;
import DocuJapan.Service.User.ImageService;
import DocuJapan.Service.User.PaginatesServiceImp;
import DocuJapan.Service.User.ProductServiceImp;

@Controller
public class ProductController extends BaseController{
	@Autowired
	ProductServiceImp productService;

	@Autowired
	private CategoryServiceImp categoryService;
	
	@Autowired
	private ImageService imageService;
	
	
	@Autowired
	private PaginatesServiceImp paginateService;
	
	@RequestMapping(value = "/danh-sach-san-pham/{currentPage}")
	public ModelAndView AllProduct(@PathVariable String currentPage) {
		_mvShare.setViewName("user/products/product");
		_mvShare.addObject("categories",_homeService.HomeCategories());
		int toltalData=productService.GetAllProducts().size();
		PaginatesDto paginateAll=paginateService.GetInfoPaginates(toltalData, 18, Integer.parseInt(currentPage));
		_mvShare.addObject("paginateAll",paginateAll);
		_mvShare.addObject("allProductsPaginate",categoryService.AllProductsPaginate(18,paginateAll.getStart()));
		return _mvShare;
	}
	//Sale product Page
	@RequestMapping(value="/product-sale",method=RequestMethod.GET)
	public ModelAndView GetProductSale() {
		return ProductSale(1);
	}
		
	
	@RequestMapping(value = "/product-sale/{currentPage}")
	public ModelAndView ProductSale(@PathVariable int currentPage) {
		_mvShare.setViewName("user/products/product_sale");
		_mvShare.addObject("categories",_homeService.HomeCategories());
		int toltalData=productService.GetProductBySale().size();
		PaginatesDto paginateAll=paginateService.GetInfoPaginates(toltalData, 18,currentPage);
		_mvShare.addObject("paginateSale",paginateAll);
		_mvShare.addObject("ProductsPaginate",categoryService.AllProductsSalePaginate(18,paginateAll.getStart()));
		return _mvShare;
	}

	@RequestMapping(value= {"chi-tiet-san-pham/{id}"})
	public ModelAndView Index(@PathVariable int id) {
		_mvShare.setViewName("user/products/product_detail");
		_mvShare.addObject("productById",productService.GetProductById(id));
		_mvShare.addObject("images", imageService.GetImagesById(id));
		_mvShare.addObject("productByCategory",productService.GetProductByIdCategory(
				productService.GetProductById(id).getId_category()));
		return _mvShare;
		
	}
	


	
}
