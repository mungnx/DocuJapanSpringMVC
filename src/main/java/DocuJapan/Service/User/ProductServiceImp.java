package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.ProductsDao;
import DocuJapan.Dto.ProductsDto;
@Service
public class ProductServiceImp implements IProductService {

	@Autowired
	ProductsDao productDao=new ProductsDao();
	
	
	public ProductsDto GetProductById(int id) {
		List<ProductsDto> listProducts=productDao.GetProductById(id);
		return listProducts.get(0);
	}
	
	
	public List<ProductsDto> GetProductByIdCategory(int id) {
		
		return productDao.GetAllProductsById(id);
	}


	public List<ProductsDto> GetAllProducts() {
		
		return productDao.GetAllProducts();
	}

}
