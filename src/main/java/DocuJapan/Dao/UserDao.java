package DocuJapan.Dao;

import org.springframework.stereotype.Repository;

import DocuJapan.Entity.MapperUser;
import DocuJapan.Entity.User;

@Repository
public class UserDao extends BaseDao{

	public int AddAccount(User user) {
		StringBuffer sql=new StringBuffer();
		sql.append("INSERT into users");
		sql.append("(" );
		sql.append("username,");
		sql.append("email,");
		sql.append("address,");
		sql.append("password ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("(");
		sql.append("'"+user.getUserName()+"',");
		sql.append("'"+user.getEmail()+"',");
		sql.append("'"+user.getAddress()+"',");
		sql.append("'"+user.getPassword()+"' ");
		sql.append(")");
		
		int insert =_jbdcTemplate.update(sql.toString());
		return insert;
	}

}
