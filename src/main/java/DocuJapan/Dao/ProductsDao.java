package DocuJapan.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import DocuJapan.Dto.ProductsDto;
import DocuJapan.Dto.ProductsDtoMapper;
@Repository
public class ProductsDao  extends BaseDao{
	
	private final boolean YES=true;
	private final boolean NO=false;

	private StringBuffer SqlString() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ");
		sql.append("p.id as id_product ");
		sql.append(", p.id_category ");
		sql.append(", p.name ");
		sql.append(", p.highlight ");	
		sql.append(", p.sale ");
		sql.append(", p.title ");
		sql.append(", p.size ");
		sql.append(", p.new_product ");
		sql.append(", p.detail ");
		sql.append(", p.price ");
		sql.append(", p.created_at ");
		sql.append(", p.updated_at ");
		sql.append(", p.img ");
		sql.append("FROM ");
		sql.append("products AS p ");
		return sql;
	}
	private String SqlProducts(boolean new_product, boolean highlight) {
		
		StringBuffer sql=SqlString();
		sql.append(" Where 1=1 ");
		if(highlight) {
			sql.append("and p.highlight =true ");
		}
		if(new_product) {
			sql.append(" and p.new_product=true ");
		}
		sql.append(" order by random()");
		if(highlight) {
			sql.append("limit 9");
		}
		if(new_product) {
			sql.append("limit 12");
		}
		return sql.toString();
		
	}
//id ok
private StringBuffer SqlProductsByCategory(int id) {
		StringBuffer sql=SqlString();
		sql.append(" WHERE 1=1");
		sql.append(" and p.id_category= " +id+" ");
		return sql;
		
	}

private String SqlProductById(int id) {
	StringBuffer sql=SqlString();
	sql.append(" WHERE 1=1");
	sql.append(" and p.id= " +id+" ");
	sql.append(" limit 1");
	return sql.toString();
	
}

private String SqlProductsPaginates(int id,int toltalPage, int offset) {
	
	StringBuffer sql=SqlProductsByCategory(id);
	sql.append(" LIMIT " +toltalPage+" "+ "OFFSET "+offset);
	return sql.toString();
	
}
private String SqlProductsPaginates(int toltalPage, int offset) {
	
	StringBuffer sql=SqlString();
	sql.append(" LIMIT " +toltalPage+" "+ "OFFSET "+offset);
	return sql.toString();
	
}
	
public  List<ProductsDto> GetDataNewProducts(){
		
		String sql=SqlProducts(YES,NO);
		List<ProductsDto> listProducts = _jbdcTemplate.query(sql, new ProductsDtoMapper());
				return listProducts;
	}
public  List<ProductsDto> GetDataHighlightProducts(){
		
		String sql=SqlProducts(NO,YES);
		List<ProductsDto> listProducts = _jbdcTemplate.query(sql, new ProductsDtoMapper());
				return listProducts;
	}
	
public List<ProductsDto> GetAllProductsById(int id) {
		String sql=SqlProductsByCategory(id).toString();
		List<ProductsDto> listProducts=_jbdcTemplate.query(sql, new ProductsDtoMapper());
				return listProducts; 
	}
	

public List<ProductsDto> GetAllProducts() {
	String sql=SqlString().toString();
	List<ProductsDto> listProducts=_jbdcTemplate.query(sql, new ProductsDtoMapper());
			return listProducts; 
}

public  List<ProductsDto> GetDataProductsPaginate(int id,int toltalPage, int offset){	
		StringBuffer sqlGetDataById=SqlProductsByCategory(id);
		List<ProductsDto> listProductsByID=_jbdcTemplate.query(sqlGetDataById.toString(), new ProductsDtoMapper());
		List<ProductsDto> listProducts=new ArrayList<ProductsDto>();
		if(listProductsByID.size()>0) {
			String sql=SqlProductsPaginates(id, toltalPage, offset);
			listProducts=_jbdcTemplate.query(sql,new ProductsDtoMapper());
			
		}
		
		return listProducts;
	}
//Phan trang toan bo san pham
public  List<ProductsDto> AllProductsPaginate(int toltalPage, int offset){	
		String sql=SqlProductsPaginates(toltalPage, offset);
		List<ProductsDto>listProducts=_jbdcTemplate.query(sql,new ProductsDtoMapper());
	
	return listProducts;
}

	
public List<ProductsDto> GetProductById(int id) {
		String sql=SqlProductById(id);
		List<ProductsDto> listProduct=_jbdcTemplate.query(sql, new ProductsDtoMapper());
		return listProduct;
	}
	
	public ProductsDto FindProductById(int id) {
		String sql=SqlProductById(id);
		ProductsDto product=_jbdcTemplate.queryForObject(sql, new ProductsDtoMapper());
		return product;
	}
	
}