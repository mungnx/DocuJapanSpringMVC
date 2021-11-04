package DocuJapan.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DocuJapan.Entity.MapperMenus;
import DocuJapan.Entity.Menus;
@Repository
public class MenuDao extends BaseDao{
	
	public List<Menus> GetDataMenus() {
		List<Menus> list = new ArrayList<Menus>();
		String sql = "SELECT	* FROM menu ORDER BY id ASC";
		list = _jbdcTemplate.query(sql, new MapperMenus());
		return list;
}
}
