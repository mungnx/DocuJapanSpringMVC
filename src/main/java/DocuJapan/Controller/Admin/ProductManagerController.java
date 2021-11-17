package DocuJapan.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dao.ProductsDao;
import DocuJapan.Dto.PaginatesDto;
import DocuJapan.Dto.ProductsDto;
import DocuJapan.Service.User.CategoryServiceImp;
import DocuJapan.Service.User.PaginatesServiceImp;
import DocuJapan.Service.User.ProductServiceImp;
@Controller
public class ProductManagerController extends AdminController {
	@Autowired
	ProductServiceImp productService=new ProductServiceImp();
	
	@Autowired
	ProductsDao productDao=new ProductsDao();
	

	@RequestMapping(value="/admin/product-manager",method=RequestMethod.GET)
	public ModelAndView GetProduct() {
		return AllProductPagination(1);
	}
	
	@Autowired
	private CategoryServiceImp categoryService;
	
	
	@Autowired
	private PaginatesServiceImp paginateService;
	
	@RequestMapping(value = "/admin/product-manager/{currentPage}")
	public ModelAndView AllProductPagination(@PathVariable int currentPage) {
		_mvShare.setViewName("admin/product_manager/product_form");
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		int toltalData=productService.GetAllProducts().size();
		PaginatesDto paginateAll=paginateService.GetInfoPaginates(toltalData, 15,currentPage);
		_mvShare.addObject("paginateAll",paginateAll);
		_mvShare.addObject("toltalData",toltalData);
		_mvShare.addObject("allProductsPaginate",categoryService.AllProductsPaginate(15,paginateAll.getStart()));
		return _mvShare;
	}
	
	
	@RequestMapping(value="/admin/del-product/{id}",method=RequestMethod.GET)
	public String DeleteCategory(@PathVariable int id) { 
		
		try {
			int result = productService.DeleteProduct(id);
			if (result != 0) {
				_mvShare.addObject("delstatus", "Da xoa san pham!");
			}
		} catch (Exception e) {
			_mvShare.addObject("delstatus", "Khong the xoa san pham!");
		}
		return "redirect:/admin/product-manager";	
	}
	
	
	@RequestMapping(value="/admin/product-detail",method=RequestMethod.GET)
	public ModelAndView AddProduct(@ModelAttribute("product")ProductsDto product) { 
		_mvShare.setViewName("/admin/product_manager/product_detail");
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		_mvShare.addObject("product",new ProductsDto());
		 return _mvShare;
	}

	@RequestMapping(value="/admin/product-detail/{id}",method=RequestMethod.GET)
	public ModelAndView EditProduct(@PathVariable int id,@ModelAttribute("product")ProductsDto product) { 
		product=productDao.GetProductById(id).get(0);
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		_mvShare.setViewName("/admin/product_manager/product_detail");
		_mvShare.addObject("product",product);
		 return _mvShare;
			
	}
	
	@RequestMapping(value = "/admin/product-save", method = RequestMethod.POST)
	public String SaveProduct(ProductsDto product) {
		if (product.getId_product()==0) {
			
				productService.AddProduct(product);
		} else {
		productService.UpdateProduct(product);
		}
	return "redirect:/admin/product-manager";
	}
	
}
