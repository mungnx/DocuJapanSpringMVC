package DocuJapan.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Service.User.HomeServiceImp;
@Controller
public class AdminController {
	@Autowired
	HomeServiceImp _homeService;
	public ModelAndView _mvShare=new ModelAndView();
	
	
}