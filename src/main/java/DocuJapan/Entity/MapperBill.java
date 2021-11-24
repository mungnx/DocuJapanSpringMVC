package DocuJapan.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBill implements RowMapper<Bills>{

	public Bills mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bills bill=new Bills();
		
		bill.setId(rs.getInt("id"));	
		bill.setUsername(rs.getString("username"));	
		bill.setAddress(rs.getString("address"));		
		bill.setPhone(rs.getString("phone"));
		bill.setQuanty(rs.getInt("quanty"));
		bill.setTotal(rs.getFloat("total"));
		bill.setNote(rs.getString("note"));
		bill.setCreated_at(rs.getDate("created_at"));

		return bill;

	}
}
