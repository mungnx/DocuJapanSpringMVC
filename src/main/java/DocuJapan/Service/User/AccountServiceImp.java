package DocuJapan.Service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.UserDao;
import DocuJapan.Entity.User;

@Service
public class AccountServiceImp {

	
	@Autowired
	UserDao userDao=new UserDao();
	public int AddAccount(User user) {
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		return userDao.AddAccount(user);
	}

	
}
