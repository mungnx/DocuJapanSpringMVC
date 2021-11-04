package DocuJapan.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Entity.User;
import DocuJapan.Service.User.AccountServiceImp;

@Controller
public class UserController extends BaseController{

	@Autowired
	private AccountServiceImp accountService= new AccountServiceImp();
	
	@RequestMapping(value="/dang-ky",method=RequestMethod.GET)
	public ModelAndView Register() {
		
		_mvShare.setViewName("/user/account/register");
		_mvShare.addObject("user",new User());
		return _mvShare;
	}
	
	@RequestMapping(value="/dang-ky",method=RequestMethod.POST)
	public ModelAndView CreateAcc(@ModelAttribute("user") User user) { 
		int count=accountService.AddAccount(user);
		if(count>0) {
			_mvShare.addObject("status","Register succeful!");
		}
		else {
			_mvShare.addObject("status","Register Fail!!");
		}
		_mvShare.setViewName("user/account/register");
		
		return _mvShare; 
	}
	
	
	
}
