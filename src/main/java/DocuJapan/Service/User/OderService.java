package DocuJapan.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.BillDao;
import DocuJapan.Dto.OderDto;

@Service
public class OderService {
	
	@Autowired
	BillDao oderDao=new BillDao();

public List<OderDto> GetOderById(int id) {
		
		return oderDao.GetOderById(id);
	}


	public List<OderDto> GetAllOder() {
		
		return oderDao.GetAllOder();
	}


	public int DeleteOder(int id) {
		return oderDao.DeleteOder(id);
	}
}
