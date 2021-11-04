package DocuJapan.Service.User;

import org.springframework.stereotype.Service;

import DocuJapan.Entity.User;

@Service
public interface IAccountService {

	public int AddAccount(User user);
}
