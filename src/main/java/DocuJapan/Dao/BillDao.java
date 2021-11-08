package DocuJapan.Dao;

import org.springframework.stereotype.Repository;

import DocuJapan.Entity.BillDetails;
import DocuJapan.Entity.Bills;

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
		sql.append("note ");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("(");
		sql.append("'"+bill.getUsername()+"',");
		sql.append("'"+bill.getPhone()+"',");
		sql.append("'"+bill.getAddress()+"',");
		sql.append("'"+bill.getEmail()+"',");
		sql.append("'"+bill.getTotal()+"',");
		sql.append("'"+bill.getQuanty()+"',");
		sql.append("'"+bill.getNote()+"' ");
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
}