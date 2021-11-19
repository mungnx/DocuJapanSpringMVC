package DocuJapan.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
	 private static final String UPLOAD_DIRECTORY ="/assets/admin/img";
	@Autowired
	private SlideService slideService= new SlideService();
	@Autowired
	private SlidesDao slideDao= new SlidesDao();
	
	
	@RequestMapping(value="/admin/slide-manager",method=RequestMethod.GET)
	public ModelAndView Get() {
		_mvShare.addObject("slides",_homeService.GetDataSlide());
		_mvShare.setViewName("/admin/manages/slide_form");
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
	public String Save(Slides slide,@RequestParam CommonsMultipartFile file,  
	           HttpSession session) throws Exception
	{
	
		if (file != null && !file.isEmpty()) {
			try {
				ServletContext context = session.getServletContext();
				String path = context.getRealPath(UPLOAD_DIRECTORY);
				byte[] bytes = file.getBytes();

				String filename = file.getOriginalFilename();

				System.out.println(path + " " + filename);

				File fileSever = new File(path + File.separator + filename);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fileSever));
				stream.write(bytes);
				stream.flush();
				stream.close();
			
				slide.setImg(filename);	
				
				if(slide.getId()!=0) {
				slideService.UpdateSlide(slide);
				}
				else {
					slideService.AddSlide(slide);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/slide-manager";
	}
}
