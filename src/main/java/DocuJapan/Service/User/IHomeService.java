package DocuJapan.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import DocuJapan.Dto.ProductsDto;
import DocuJapan.Entity.Categories;
import DocuJapan.Entity.Menus;
import DocuJapan.Entity.Slides;
@Service
public interface IHomeService {
	
	public List<Slides> GetDataSlide();
	
	public List<Categories> GetDataCategories();
	
	public List<Menus> GetDataMenus();
	
	public List<ProductsDto> GetDataNewProducts();
	
	public List<ProductsDto> GetDataHighlightProducts();

}

