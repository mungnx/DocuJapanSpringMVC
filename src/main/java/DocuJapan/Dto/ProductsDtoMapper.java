package DocuJapan.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductsDtoMapper implements RowMapper<ProductsDto>{

	public ProductsDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ProductsDto productsDto=new ProductsDto();
		
		productsDto.setId_product(rs.getInt("id_product"));
		productsDto.setId_category(rs.getInt("id_category"));	
		productsDto.setName(rs.getString("name"));		
		productsDto.setHighlight(rs.getBoolean("highlight"));
		productsDto.setSale(rs.getFloat("sale"));
		productsDto.setTitle(rs.getString("title"));
		productsDto.setSize(rs.getString("size"));
		productsDto.setNew_product(rs.getBoolean("new_product"));
		productsDto.setDetail(rs.getString("detail"));
		productsDto.setPrice(rs.getFloat("price"));	
		//productsDto.setId_color(rs.getInt("id_color"));
		//productsDto.setName_color(rs.getString("name_color"));
		//productsDto.setCode(rs.getString("code"));
		productsDto.setCreated_at(rs.getDate("created_at"));
		productsDto.setUpdated_at(rs.getDate("updated_at"));
		productsDto.setImg(rs.getString("img"));
		
		return productsDto;
	}

}
