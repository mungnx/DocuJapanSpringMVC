package DocuJapan.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminHomeController extends AdminController {

	
@RequestMapping(value= "/admin")
	
	public ModelAndView AdminIndex() {
		_mvShare.setViewName("admin/index");
		
	return _mvShare;
		
	}
	



}
