package DocuJapan.Controller.User;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Service.User.HomeServiceImp;
@Controller
public class BaseController {
	@Autowired
	HomeServiceImp _homeService;
	public ModelAndView _mvShare=new ModelAndView();
	
	@PostConstruct
	public ModelAndView Init() {
		_mvShare.addObject("menu",_homeService.GetDataMenus());
		return _mvShare;
	}
}