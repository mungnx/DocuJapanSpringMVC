package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.CategoriesDao;
import DocuJapan.Dao.MenuDao;
import DocuJapan.Dao.SlidesDao;
import DocuJapan.Dao.ProductsDao;
import DocuJapan.Dto.ProductsDto;
import DocuJapan.Entity.Categories;
import DocuJapan.Entity.Menus;
import DocuJapan.Entity.Slides;
@Service
public class HomeServiceImp implements IHomeService {
	
	@Autowired
	private SlidesDao slidesDao;
	@Autowired
	private CategoriesDao categoriesDao;
	
	@Autowired
	private MenuDao menuDao;
	
	
	@Autowired
	private ProductsDao productsDao;
	
	public List<Slides> GetDataSlide() {
		
		return slidesDao.GetDataSlide();
	}
	public List<Categories> GetDataCategories() {
		
		return categoriesDao.getDataCategories();
	}
	
public Categories GetCategoriesById(int id) {
		
		return categoriesDao.getDataCategoriesById(id);
	}
	public List<Menus> GetDataMenus() {
		return menuDao.GetDataMenus();
	}
	public List<ProductsDto> GetDataNewProducts() {
		List<ProductsDto>  listNewProducts=productsDao.GetDataNewProducts();
		return listNewProducts; 
	}
	public List<ProductsDto> GetDataHighlightProducts() {
		List<ProductsDto>  listHighlightProducts=productsDao.GetDataHighlightProducts();
		return listHighlightProducts; 
	}
	

}
