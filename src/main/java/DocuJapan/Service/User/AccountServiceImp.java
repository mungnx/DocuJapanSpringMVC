package DocuJapan.Service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.UserDao;
import DocuJapan.Entity.Account;

@Service
public class AccountServiceImp {

	
	@Autowired
	UserDao userDao=new UserDao();
	
	public int AddAccount(Account user) {
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));

		return userDao.AddAccount(user);
	}

	public Account CheckAccount(Account user) {
		String password=user.getPassword();
		user=userDao.GetUserByAcc(user);
		if(user!=null) {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return user;
			}
			else {
				return null;
			}
		}		
		return null;
	}
}
