package DocuJapan.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dao.CategoriesDao;
import DocuJapan.Entity.Account;
import DocuJapan.Entity.Categories;
import DocuJapan.Service.User.CategoryServiceImp;

@Controller
public class CategoryManagerController extends AdminController{
	@Autowired
	private CategoryServiceImp categoryService= new CategoryServiceImp();
	@Autowired
	private CategoriesDao categoryDao= new CategoriesDao();
	
	
	@RequestMapping(value="/admin/category-manager",method=RequestMethod.GET)
	public ModelAndView GetCategory(HttpSession session) {
		
		Account acc=(Account)session.getAttribute("LoginAdmin");
		if (acc == null) {
		       return new ModelAndView("redirect:/admin/login");
		}
		_mvShare.addObject("categories",_homeService.GetDataCategories());
		_mvShare.setViewName("/admin/product/category_form");
		_mvShare.addObject("category",new Categories());
		return _mvShare;
		
	}
		
	@RequestMapping(value="/admin/del-category/{id}",method=RequestMethod.GET)
	public String DeleteCategory(@PathVariable int id) { 
		
		try {
			int result = categoryService.DeleteCategory(id);
			if (result != 0) {
				_mvShare.addObject("delstatus", "Da xoa danh muc!");
			}
		} catch (Exception e) {
			_mvShare.addObject("delstatus", "Khong the xoa danh muc dang chua san pham!");
		}
		return "redirect:/admin/category-manager";	
	}

	@RequestMapping(value="/admin/edit-category/{id}",method=RequestMethod.GET)
	public ModelAndView CategoryEdit(@PathVariable int id,@ModelAttribute("category")Categories category) { 
		
		
		category=categoryDao.getDataCategoriesById(id);
		
		_mvShare.addObject("category",category);
		 return _mvShare;
			
	}
	
	@RequestMapping(value = "/admin/category-save", method = RequestMethod.POST)
	public String SaveCategory(Categories category,HttpServletRequest request) throws Exception {			
		try {
		if (category.getId()==0 && !category.getName().isEmpty()) {
			categoryService.AddCategory(category);
			_mvShare.addObject("delstatus", "Da them!");
			
		} else {
		categoryService.UpdateCategory(category);
		_mvShare.addObject("delstatus", "Da update!");
		}
		}catch(Exception e) {
			System.out.println("Is empty "+e);
		}
	return "redirect:/admin/category-manager";
	}
}
