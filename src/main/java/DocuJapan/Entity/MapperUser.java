package DocuJapan.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUser implements RowMapper<User>{

	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		User user=new User();
		user.setId(rs.getInt("id"));
		user.setUserName(rs.getString("username"));
		
		user.setEmail(rs.getString("email"));
		user.setAddress(rs.getString("address"));
		user.setPassword(rs.getString("password"));
		return user;
	}

}
