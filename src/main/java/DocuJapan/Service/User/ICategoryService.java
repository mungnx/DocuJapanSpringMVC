package DocuJapan.Service.User;

import java.util.List;
import org.springframework.stereotype.Service;
import DocuJapan.Dto.ProductsDto;
import DocuJapan.Entity.Categories;

@Service
public interface ICategoryService {
	
	public List<ProductsDto> GetAllProductsById(int id);
	public List<ProductsDto> GetDataProductsPaginate(int id,int totalPage, int offset);
	public int AddCategory( Categories category) ;
}
