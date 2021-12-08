package DocuJapan.Controller.Admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Entity.Account;

@Controller
public class AdminHomeController extends AdminController {

@RequestMapping(value= "/admin")
	
	public ModelAndView AdminIndex(HttpSession session) {
	
	Account acc=(Account)session.getAttribute("LoginAdmin");
	if (acc == null) {
	       return new ModelAndView("redirect:/admin/login");
	}
	
	
	return new ModelAndView("/admin/index");

}
}
