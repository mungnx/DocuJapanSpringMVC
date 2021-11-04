package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.ProductsDao;
import DocuJapan.Dto.ProductsDto;
@Service
public class CategoryServiceImp implements ICategoryService {

	@Autowired
	private ProductsDao productsDao;
	
	public List<ProductsDto> GetAllProductsById(int id) { 
		
		return productsDao.GetAllProductsById(id);
	}
	
public List<ProductsDto> GetAllProducts() { 
		
		return productsDao.GetAllProducts();
	}
	
	public List<ProductsDto> GetDataProductsPaginate(int id, int totalPage,int start) {

		return productsDao.GetDataProductsPaginate(id,totalPage, start);
		
	}
	
	public List<ProductsDto> AllProductsPaginate(int totalPage,int start) {

		return productsDao.AllProductsPaginate(totalPage, start);
		
	}
	
}
