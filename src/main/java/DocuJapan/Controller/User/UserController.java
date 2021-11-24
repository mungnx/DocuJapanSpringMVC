package DocuJapan.Controller.User;

import javax.servlet.http.HttpServletRequest;
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
public class UserController extends BaseController{

	@Autowired
	private AccountServiceImp accountService= new AccountServiceImp();
	
	@RequestMapping(value="/dang-ky",method=RequestMethod.GET)
	public ModelAndView Register() {
		
		_mvShare.setViewName("/user/account/register");
		_mvShare.addObject("user",new Account());
		return _mvShare;
	}
	
	
	
	@RequestMapping(value="/dang-ky",method=RequestMethod.POST)
	public ModelAndView CreateAcc(HttpSession session,@ModelAttribute("user") Account user) { 
		
		try {
			int count=accountService.AddAccount(user);
		if(count>0) {
			_mvShare.addObject("status","Register succeful!");
			_mvShare.setViewName("redirect:trang-chu");
			session.setAttribute("LoginInfo", user);
		}
		else {
			_mvShare.setViewName("user/account/register");
			_mvShare.addObject("status","Register Fail!!");
		}
		}
		catch(Exception e) {
			_mvShare.setViewName("user/account/register");
			_mvShare.addObject("status","Register Fail! Email was exited!");
			System.out.println("Trung email");
		}
		return _mvShare; 
	}
	
	@RequestMapping(value="/dang-nhap",method=RequestMethod.POST)
	public ModelAndView Login(HttpSession session,@ModelAttribute("user") Account user) { 
	
		user=accountService.CheckAccount(user);
		
	if(user!=null) {
		_mvShare.setViewName("redirect:trang-chu");
		session.setAttribute("LoginInfo", user);
	}
	else {
		_mvShare.addObject("statusLogin", "Login fail !!");
	}
	return _mvShare; 
	}
	
	
	@RequestMapping(value="/dang-xuat",method=RequestMethod.GET)
	public String LogOut(HttpSession session,HttpServletRequest request) { 
	
		session.removeAttribute("LoginInfo");
	return "redirect:"+request.getHeader("Referer");
	}
	
}
