package DocuJapan.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class OderDtoMapper implements RowMapper<OderDto> {	
	
	public OderDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		OderDto oderDto=new OderDto();
		oderDto.setId(rs.getInt("id"));
		oderDto.setUsername(rs.getString("username"));	
		oderDto.setAddress(rs.getString("address"));		
		oderDto.setPhone(rs.getString("phone"));
		oderDto.setProductName(rs.getString("name"));
		oderDto.setPrice(rs.getFloat("price"));
		oderDto.setSale(rs.getInt("sale"));
		oderDto.setSize(rs.getString("size"));
		oderDto.setQuanty(rs.getInt("quanty"));
		oderDto.setTotal(rs.getFloat("total"));
		oderDto.setCreated_at(rs.getDate("created_at"));
		//oderDto.setClose_at(rs.getDate("close_at"));	
		oderDto.setNote(rs.getString("note"));
		return oderDto;

	}
}
	
	
