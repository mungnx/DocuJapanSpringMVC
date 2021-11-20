package MediaLoad;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns="/img/*")
public class LoadImage extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String imagePath;
    @Override
	public void init() throws ServletException {
		imagePath=System.getProperty("catalina.home")+File.separator+"assets/admin/img";
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestedImage=request.getPathInfo();
		
		if(requestedImage==null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		
		}
		File image=new File(imagePath,URLDecoder.decode(requestedImage,"UTF-8"));
		if(!image.exists()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		String contentType=getServletContext().getMimeType(image.getName());
		if(contentType==null||!contentType.startsWith("image")) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		response.setContentType(contentType);
		response.setHeader("Content-Length", String.valueOf(image.length()));
		//ghi noi dung anh vao response
		Files.copy(image.toPath(), response.getOutputStream());
	}


}
