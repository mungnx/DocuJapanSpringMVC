package DocuJapan.Controller.Admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Entity.Account;
import DocuJapan.Service.User.AccountServiceImp;

@Controller
public class LoginController extends AdminController {
	
	@Autowired
	private AccountServiceImp accountService= new AccountServiceImp();

	@RequestMapping(value="/admin/login")
	public ModelAndView Login() {
		_mvShare.addObject("user",new Account());
		_mvShare.setViewName("/admin/account/login");
		return _mvShare;
	}

	@RequestMapping(value="admin/login",method=RequestMethod.POST)
	public ModelAndView Login(HttpSession session,@ModelAttribute("user") Account user) { 
	try {
		user=accountService.CheckAccount(user);
		
	if(user!=null) {
		_mvShare.setViewName("redirect:/admin");
		session.setAttribute("LoginInfo", user);
	}
	else {
		_mvShare.setViewName("redirect:/admin/login");
		
	}
	}catch(Exception e) {

	}
	return _mvShare; 
	}
	
	@RequestMapping(value="admin/logout",method=RequestMethod.GET)
	public String LogOut(HttpSession session) { 
	
		session.removeAttribute("LoginInfo");
	return "redirect:/admin/login";
	}
	
	
	
}
