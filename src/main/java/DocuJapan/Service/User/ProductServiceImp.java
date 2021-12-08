package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.ImageDao;
import DocuJapan.Dao.ProductsDao;
import DocuJapan.Dto.ProductsDto;
@Service
public class ProductServiceImp implements IProductService {

	@Autowired
	ProductsDao productDao=new ProductsDao();
	
	@Autowired
	ImageDao imageDao=new  ImageDao();
	
	
	public ProductsDto GetProductById(int id) {
		ProductsDto product=productDao.FindProductById(id);
		return product;
	}
	
	
	public List<ProductsDto> GetProductByIdCategory(int id) {
		
		return productDao.GetAllProductsById(id);
	}

	
public List<ProductsDto> GetProductBySale() {
		
		return productDao.GetAllProductSale();
	}

	public List<ProductsDto> GetAllProducts() {
		
		return productDao.GetAllProducts();
	}


	public int DeleteProduct(int id) {
		return productDao.DeleteProduct(id);
	
	}


	public int AddProduct(ProductsDto product) {
		return productDao.AddProduct(product);
	}
	
	

	public int UpdateProduct(ProductsDto product) {
		return productDao.UpdateProduct(product);
		
	}

}
