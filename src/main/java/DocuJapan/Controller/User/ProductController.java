package DocuJapan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

	
}
