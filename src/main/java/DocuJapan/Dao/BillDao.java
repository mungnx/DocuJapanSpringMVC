package DocuJapan.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import DocuJapan.Dto.OderDto;
import DocuJapan.Dto.OderDtoMapper;
import DocuJapan.Entity.BillDetails;
import DocuJapan.Entity.Bills;
import DocuJapan.Entity.MapperBill;

@Repository
public class BillDao extends BaseDao {

	public int AddBill(Bills bill) {
		StringBuffer sql=new StringBuffer();
		sql.append("INSERT into bills");
		sql.append("(" );
		sql.append("username,");
		sql.append("phone,");
		sql.append("address,");
		sql.append("email,");
		sql.append("total,");
		sql.append("quanty,");
		sql.append("note, ");
		sql.append("created_at ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("(");
		sql.append("'"+bill.getUsername()+"',");
		sql.append("'"+bill.getPhone()+"',");
		sql.append("'"+bill.getAddress()+"',");
		sql.append("'"+bill.getEmail()+"',");
		sql.append("'"+bill.getTotal()+"',");
		sql.append("'"+bill.getQuanty()+"',");
		sql.append("'"+bill.getNote()+"', ");
		sql.append("'"+bill.getCreated_at()+"'");
		sql.append(")");
		
		int insert =_jbdcTemplate.update(sql.toString());
		return insert;
	}


public int GetIdLastBill() {
	StringBuffer sql=new StringBuffer();
	sql.append("SELECT MAX(id) FROM bills");
	int id=_jbdcTemplate.queryForObject(sql.toString(), new Object[] {},Integer.class);
	return id;
}


public int AddBillDetail(BillDetails billDetail) {
	
	StringBuffer sql=new StringBuffer();
	sql.append("INSERT into billdetail");
	sql.append("(" );
	sql.append("id_product,");
	sql.append("id_bill,");
	sql.append("quanty,");
	sql.append("total");
	sql.append(") ");
	sql.append("VALUES ");
	sql.append("(");
	sql.append("'"+billDetail.getId_product()+"',");
	sql.append("'"+billDetail.getId_bill()+"',");
	sql.append("'"+billDetail.getQuanty()+"',");
	sql.append("'"+billDetail.getTotal()+"'");
	sql.append(")");
	
	int insert =_jbdcTemplate.update(sql.toString());
	return insert;
}


public List<OderDto> GetOderById(int id) {
	StringBuffer sql = new StringBuffer();
	sql.append("SELECT ");
	sql.append("b.id ");	
	sql.append(", b.username ");
	sql.append(", b.address ");	
	sql.append(", b.phone ");
	sql.append(", p.name ");
	sql.append(", p.price ");
	sql.append(", p.sale ");
	sql.append(", p.size ");
	sql.append(", d.quanty ");
	sql.append(", d.total ");
	sql.append(", b.created_at ");
	//sql.append(", b.close_at ");
	sql.append(", b.note ");
	sql.append("FROM ");
	sql.append("bills AS b ");
	sql.append(" inner join billdetail as d on b.id=d.id_bill");
	sql.append(" inner join products as p on d.id_product=p.id");
	sql.append(" where b.id=" +id);
	
	List<OderDto> oderDto= _jbdcTemplate.query(sql.toString(),new OderDtoMapper());
return oderDto;
}



public List<OderDto> GetAllOder() {
	StringBuffer sql = new StringBuffer();
	sql.append("SELECT ");
	sql.append(" b.username ");
	sql.append(", b.address ");	
	sql.append(", b.phone ");
	sql.append(", p.name ");
	sql.append(", p.price ");
	sql.append(", p.sale ");
	sql.append(", p.size ");
	sql.append(", d.quanty ");
	sql.append(", d.total ");
	sql.append(", b.created_at ");
	sql.append(", b.close_at ");
	sql.append(", b.note ");
	sql.append("FROM ");
	sql.append("bills AS b ");
	sql.append(" inner join billdetail as d on b.id=d.id_bill");
	sql.append(" inner join products as p on d.id_product=p.id");
	sql.append(" order by b.username ");
	
	List<OderDto> oderDto= _jbdcTemplate.query(sql.toString(),new OderDtoMapper());
	return oderDto;

}

public List<Bills> GetBills() {
	String sql = "select * from bills";
	
	List<Bills> bill= _jbdcTemplate.query(sql,new MapperBill());
	return bill;

}

public List<Bills> GetBills(int id) {
	String sql = "select * from bills where id= "+id;
	
	List<Bills> bill= _jbdcTemplate.query(sql,new MapperBill());
	return bill;

}

public int DeleteOder(int id) {
	String sql = "DELETE  FROM bills WHERE id=" + id;
	return _jbdcTemplate.update(sql);
}
}