package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dto.ProductsDto;
import DocuJapan.Entity.Categories;
import DocuJapan.Entity.Menus;
import DocuJapan.Entity.Slides;
@Service
public interface IHomeService {
	@Autowired
	public List<Slides> GetDataSlide();
	@Autowired
	public List<Categories> GetDataCategories();
	@Autowired
	public List<Menus> GetDataMenus();
	@Autowired
	public List<ProductsDto> GetDataNewProducts();
	@Autowired
	public List<ProductsDto> GetDataHighlightProducts();
}
