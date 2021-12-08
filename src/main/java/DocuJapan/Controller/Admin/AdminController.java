package DocuJapan.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import DocuJapan.Service.User.HomeServiceImp;
@Controller
public class AdminController {
	@Autowired
	HomeServiceImp _homeService;
	 private static final String UPLOAD_DIRECTORY ="/assets/admin/img";
		@Autowired
		ServletContext context;
	
	
	public ModelAndView _mvShare=new ModelAndView();
	
	//Convert java.util.Date to SQL format Date 
		@InitBinder
	    public void initBinder(WebDataBinder binder, WebRequest request) {
	        //convert the date Note that the conversion here should always be in the same format as the string passed in, e.g. 2015-9-9 should be yyyy-MM-dd
	        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor is a custom date editor
	    }
		
	
	public String UpLoad(CommonsMultipartFile file) throws Exception
	{
		String filename = null;
	
		if (!file.isEmpty()) {
			try {
				
				String path = context.getRealPath(UPLOAD_DIRECTORY);
				byte[] bytes = file.getBytes();

				filename = file.getOriginalFilename();

				System.out.println(path + " " + filename);

				File fileSever = new File(path + File.separator + filename);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fileSever));
				stream.write(bytes);
				stream.flush();
				stream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}

		return filename;
	}
	
	
	
	
}