package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.CategoriesDao;
import DocuJapan.Dao.ProductsDao;
import DocuJapan.Dto.ProductsDto;
import DocuJapan.Entity.Categories;

@Service
public class CategoryServiceImp implements ICategoryService {

	@Autowired
	private ProductsDao productsDao;

	@Autowired
	private CategoriesDao categoriesDao = new CategoriesDao();

	public List<ProductsDto> GetAllProductsById(int id) {

		return productsDao.GetAllProductsById(id);
	}

	public List<ProductsDto> GetAllProducts() {

		return productsDao.GetAllProducts();
	}

	public List<ProductsDto> GetDataProductsPaginate(int id, int totalPage, int start) {

		return productsDao.GetDataProductsPaginate(id, totalPage, start);

	}

	public List<ProductsDto> AllProductsPaginate(int totalPage, int start) {

		return productsDao.AllProductsPaginate(totalPage, start);

	}
	
	public List<ProductsDto> AllProductsSalePaginate(int totalPage, int start) {

		return productsDao.AllProductsSalePaginate(totalPage, start);

	}
	
	
	public int AddCategory(Categories category) {
		 return categoriesDao.AddCategory(category);
		
	}

	public int DeleteCategory(int id) {

		return categoriesDao.DeleteCategory(id);
	}

	public int UpdateCategory(Categories category) {

		return categoriesDao.UpdateCategory(category);
	}


}
