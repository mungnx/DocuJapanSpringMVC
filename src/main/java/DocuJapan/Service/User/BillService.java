package DocuJapan.Service.User;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.BillDao;
import DocuJapan.Dto.CartDto;
import DocuJapan.Dto.OderDto;
import DocuJapan.Entity.BillDetails;
import DocuJapan.Entity.Bills;

@Service
public class BillService implements IBillService {

	@Autowired
	BillDao billDao;
	public int AddBills(Bills bill) {
		
		bill.setCreated_at(new Date());
		return billDao.AddBill(bill);
	}

	public void AddBillDetail(HashMap<Integer, CartDto> carts) {
		int idBill= billDao.GetIdLastBill();
		for(Map.Entry<Integer, CartDto> itemCart:carts.entrySet()) {
			BillDetails billDetail=new BillDetails();
			billDetail.setId_bill(idBill);
			billDetail.setId_product(itemCart.getValue().getProduct().getId_product());
			billDetail.setQuanty(itemCart.getValue().getQuanty());
			billDetail.setTotal(itemCart.getValue().getTotalPrice());
			
			billDao.AddBillDetail(billDetail);
		}
		
	}
	
	public List<OderDto> GetOderById(int id) {

		return billDao.GetOderById(id);
	}

	public List<OderDto> GetAllOder() {

		return billDao.GetAllOder();
	}

	public List<Bills> GetBills() {

		return billDao.GetBills();
	}

	public int DeleteOder(int id) {
		return billDao.DeleteOder(id);
	}

	public Object GetBills(int id) {
		return billDao.GetBills(id);
	}

}
