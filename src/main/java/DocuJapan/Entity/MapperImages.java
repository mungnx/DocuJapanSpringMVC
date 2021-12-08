package DocuJapan.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

	public class MapperImages implements RowMapper<Images>{

		public Images mapRow(ResultSet rs, int rowNum) throws SQLException {
		
			Images images=new Images();
			images.setId(rs.getInt("id"));
			images.setImg(rs.getString("img"));
			images.setId_product(rs.getInt("id_product"));
			return images;
		}

}
