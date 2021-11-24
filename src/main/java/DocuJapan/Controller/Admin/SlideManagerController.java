package DocuJapan.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Dao.SlidesDao;
import DocuJapan.Entity.Slides;
import DocuJapan.Service.User.SlideService;

@Controller
public class SlideManagerController extends AdminController{
	@Autowired
	private SlideService slideService= new SlideService();
	@Autowired
	private SlidesDao slideDao= new SlidesDao();
	
	@RequestMapping(value="/admin/slide-manager",method=RequestMethod.GET)
	public ModelAndView Get() {
		_mvShare.addObject("slides",_homeService.GetDataSlide());
		_mvShare.setViewName("/admin/product/slide_form");
		_mvShare.addObject("slide",new Slides());
		return _mvShare;
		
	}
	
	@RequestMapping(value="/admin/del-slide/{id}",method=RequestMethod.GET)
	public String Delete(@PathVariable int id) { 
		
		try {
			int result = slideService.DeleteSlide(id);
			if (result != 0) {
				_mvShare.addObject("delstatus", "Da xoa slide!");
			}
		} catch (Exception e) {
			_mvShare.addObject("delstatus", "Khong the xoa!");
		}
		return "redirect:/admin/slide-manager";	
	}

	@RequestMapping(value="/admin/edit-slide/{id}",method=RequestMethod.GET)
	public ModelAndView Edit(@PathVariable int id,@ModelAttribute("slide")Slides slide) { 
		slide=slideDao.getSlideById(id);
		_mvShare.addObject("slide",slide);		
		 return _mvShare;
			
	}
	
	@RequestMapping(value = "/admin/slide-save", method = RequestMethod.POST)
	public String Save(Slides slide,@RequestParam CommonsMultipartFile file) throws Exception
	{
				if(slide.getId()==0 && !slide.getFile().isEmpty()) {
					slide.setImg(UpLoad(file));
					slideService.AddSlide(slide);
				}else {
					if(slide.getFile().isEmpty()) 
					{
					slideService.UpdateSlide(slide);
					}else 
						{
							slide.setImg(UpLoad(file));
							slideService.UpdateSlide(slide);
					}
				
				}

		return "redirect:/admin/slide-manager";
	}
	
	
}
