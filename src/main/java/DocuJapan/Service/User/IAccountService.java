package DocuJapan.Service.User;

import org.springframework.stereotype.Service;

import DocuJapan.Entity.Account;

@Service
public interface IAccountService {

	public int AddAccount(Account user);
	
	public boolean CheckAccount(Account user);
}
