package DocuJapan.Service.User;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import DocuJapan.Dto.CartDto;
import DocuJapan.Entity.Bills;

@Service
public interface IBillService {

	public int AddBills(Bills bill);
	
	public void AddBillDetail(HashMap<Integer, CartDto> carts);
}
