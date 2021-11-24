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
			sql.append("limit 18");
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
//All Product pagination
public  List<ProductsDto> AllProductsPaginate(int toltalPage, int offset){	
	List<ProductsDto> listProduct=new ArrayList<ProductsDto>();	
	String sql=SqlProductsPaginates(toltalPage, offset);
		
		listProduct=_jbdcTemplate.query(sql.toString(),new ProductsDtoMapper());
	
	return listProduct;
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
	public int DeleteProduct(int id) {
		String sql = "DELETE  FROM products WHERE id=" + id;
		return _jbdcTemplate.update(sql);
	}
	public int AddProduct(ProductsDto product) {
		StringBuffer sql=new StringBuffer();
		sql.append("INSERT into products");
		sql.append("(" );
		sql.append("id_category,");
		sql.append("name,");
		sql.append("price,");
		sql.append("sale,");
		sql.append("title,");
		sql.append("highlight,");
		sql.append("new_product,");
		sql.append("detail,");
		sql.append("created_at,");
		sql.append("updated_at,");
		sql.append("img");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("(");
		sql.append("'"+product.getId_category()+"',");
		sql.append("'"+product.getName()+"', ");
		sql.append("'"+product.getPrice()+"',");
		sql.append("'"+product.getSale()+"', ");
		sql.append("'"+product.getTitle()+"',");
		sql.append("'"+product.isHighlight()+"', ");
		sql.append("'"+product.isNew_product()+"',");
		sql.append("'"+product.getDetail()+"', ");
		sql.append("'"+product.getCreated_at()+"',");
		sql.append("'"+product.getUpdated_at()+"',");
		sql.append("'"+product.getImg()+"' ");
		sql.append(")");
		
		int insert =_jbdcTemplate.update(sql.toString());
		return insert;
	}
	public int UpdateProduct(ProductsDto product) {
		StringBuffer sql=new StringBuffer();
		sql.append("UPDATE products");
		sql.append(" SET" );
		sql.append(" id_category= '"+product.getId_category()+"',");
		sql.append(" size= '"+product.getSize()+"',");
		sql.append(" name= '"+product.getName()+"',");
		sql.append(" price= '"+product.getPrice()+"',");
		sql.append(" sale= '"+product.getSale()+"',");
		sql.append(" title= '"+product.getTitle()+"',");
		sql.append(" highlight= '"+product.isHighlight()+"',");
		sql.append(" new_product= '"+product.isNew_product()+"',");
		sql.append(" detail= '"+product.getDetail()+"',");
		sql.append(" created_at= '"+product.getCreated_at()+"',");
		sql.append(" updated_at= NOW(),");
		sql.append(" img= '"+product.getImg()+"'");
		sql.append(" WHERE");
		sql.append(" id= "+product.getId_product());
		
		return _jbdcTemplate.update(sql.toString());
	}
	
}