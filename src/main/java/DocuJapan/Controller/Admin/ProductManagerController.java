package DocuJapan.Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dto.PaginatesDto;
import DocuJapan.Dto.ProductsDto;
import DocuJapan.Entity.Account;
import DocuJapan.Service.User.CategoryServiceImp;
import DocuJapan.Service.User.ImageService;
import DocuJapan.Service.User.PaginatesServiceImp;
import DocuJapan.Service.User.ProductServiceImp;
@Controller
public class ProductManagerController extends AdminController {
	private static final String UPLOAD_DIRECTORY ="/assets/admin/img";
	@Autowired
	ServletContext context;
	
	@Autowired
	ProductServiceImp productService=new ProductServiceImp();
	
	@Autowired
	ImageService imageService=new ImageService();

	@RequestMapping(value="/admin/product-manager",method=RequestMethod.GET)
	public ModelAndView GetProduct(HttpSession session) {
		Account acc=(Account)session.getAttribute("LoginAdmin");
		if (acc == null) {
		       return new ModelAndView("redirect:/admin/login");
		}
		return AllProductPagination(1);
	}
	
	@Autowired
	private CategoryServiceImp categoryService;
	
	
	@Autowired
	private PaginatesServiceImp paginateService;
	
	@RequestMapping(value = "/admin/product-manager/{currentPage}")
	public ModelAndView AllProductPagination(@PathVariable int currentPage) {
		_mvShare.setViewName("admin/product/product_form");
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		int toltalData=productService.GetAllProducts().size();
		PaginatesDto paginateAll=paginateService.GetInfoPaginates(toltalData, 15,currentPage);
		_mvShare.addObject("paginateAll",paginateAll);
		_mvShare.addObject("toltalData",toltalData);
		_mvShare.addObject("allProductsPaginate",categoryService.AllProductsPaginate(15,paginateAll.getStart()));
		return _mvShare;
	}
	
	@RequestMapping(value="/admin/del-product/{id}",method=RequestMethod.GET)
	public String DeleteProduct(@PathVariable int id,HttpServletRequest request) { 
		
		try {
			int result = productService.DeleteProduct(id);
			if (result != 0) {		
				_mvShare.addObject("delstatus", "Da xoa san pham!");
			}
		} catch (Exception e) {
			_mvShare.addObject("delstatus", "Khong the xoa san pham!");
		}
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping(value="/admin/del-image/{id}",method=RequestMethod.GET)
	public String DeleteImage( @PathVariable int id,HttpServletRequest request) { 
		
		try {
			int result = imageService.DeleteImage(id);
			if (result != 0) {		
				_mvShare.addObject("delstatus", "Da xoa!");
			}
		} catch (Exception e) {
			_mvShare.addObject("delstatus", "Khong the xoa!");
		}
		return "redirect:"+request.getHeader("Referer");
	}
	
	
	
	@RequestMapping(value="/admin/product-detail",method=RequestMethod.GET)
	public ModelAndView AddProduct(@ModelAttribute("product")ProductsDto product) { 
		_mvShare.setViewName("/admin/product/product_detail");
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		_mvShare.addObject("images", imageService.GetImagesById(0));
		_mvShare.addObject("product",new ProductsDto());
		 return _mvShare;
	}

	@RequestMapping(value="/admin/product-detail/{id}",method=RequestMethod.GET)
	public ModelAndView EditProduct(@PathVariable int id,@ModelAttribute("product")ProductsDto product) { 
		product=productService.GetProductById(id);
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		_mvShare.setViewName("/admin/product/product_detail");
		_mvShare.addObject("images", imageService.GetImagesById(id));
		_mvShare.addObject("product",product);
		 return _mvShare;
			
	}
	
	//image choice is not update
	@RequestMapping(value = "/admin/product-save", method = RequestMethod.POST)
	public String SaveProduct(ProductsDto product,HttpServletRequest servletRequest,List<MultipartFile> files) throws Exception {
	
		try {
			if(product.getId_product()==0) {
				if(productService.AddProduct(product)>0) {
					//product.setImages(files);
					
					imageService.AddImages(Upload(product,files));//New product new image
					}
			}else
			{
				if(!files.isEmpty()) {	
					imageService.UpdateImages(Upload(product,files),product.getId_product());//Old product new image
					productService.UpdateProduct(product);
				//	System.out.println("if thuc thi");
			}
				else 
					{
					try {		
					productService.UpdateProduct(product);
					//System.out.println("else thuc thi");
					}catch(Exception e) {
						System.out.println("img is null" +e);
					}
				}
				}
	}catch(Exception e) {
		System.out.println("Exception "+e);
	}
		
	return "redirect:"+servletRequest.getHeader("Referer");
	}
	
	public List<String> Upload( ProductsDto product,List<MultipartFile> files) throws Exception {
	files = product.getImages();	
    List<String> fileNames = new ArrayList<String>();
    String path = context.getRealPath(UPLOAD_DIRECTORY);
        if (!files.isEmpty()) 
        {
           for (MultipartFile multipartFile : files) {
        	   String filename = StringUtils.cleanPath(multipartFile.getOriginalFilename());
               filename = filename.toLowerCase().replaceAll(" ", "-");
               fileNames.add(filename);
               
               File imageFile = new File(path + File.separator + filename);
               try
               {
                   multipartFile.transferTo(imageFile);
               } catch (IOException e) 
               {
                   e.printStackTrace();
               }
           }
           product.setImages(files);
       }
    return fileNames;
	}
}
