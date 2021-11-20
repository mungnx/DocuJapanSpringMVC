package DocuJapan.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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