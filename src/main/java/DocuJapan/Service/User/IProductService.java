package DocuJapan.Service.User;

import java.util.List;

import org.springframework.stereotype.Service;

import DocuJapan.Dto.ProductsDto;
@Service
public interface IProductService {
	
	public ProductsDto GetProductById(int id);
	
	public List<ProductsDto> GetProductByIdCategory(int id);
	
	public List<ProductsDto> GetAllProducts();
	
	public int DeleteProduct(int id);
}
