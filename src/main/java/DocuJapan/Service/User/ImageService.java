package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.ImageDao;
import DocuJapan.Dao.ProductsDao;
import DocuJapan.Entity.Images;

@Service
public class ImageService {
	
	@Autowired
	ImageDao imageDao=new ImageDao();
	
	@Autowired
	ProductsDao productDao=new ProductsDao();

	public void AddImages( List<String> fileNames) {
		int id_product= productDao.GetLastId();
		Images image=new Images();
		for (String string : fileNames) {	
		image.setId_product(id_product);
		image.setImg(string);
		imageDao.AddImage(image);
		}
	}
	
	public void UpdateImages( List<String> fileNames,int id_product) {
		Images image=new Images(id_product);
		for (String string : fileNames) {	
		//image.setId_product(id_product);
		image.setImg(string);
		imageDao.AddImage(image);
		}
	}

	public int DeleteImage(int id) {
		return imageDao.DeleteImage(id);
	}


	public List<Images> GetImagesById(int id_product) {
			
			return imageDao.GetImageById(id_product);
		}
	public List<Images> GetImages() {
		
		return imageDao.GetImage();
	}
	

}
