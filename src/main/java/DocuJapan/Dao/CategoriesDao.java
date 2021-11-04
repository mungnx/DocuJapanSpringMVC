package DocuJapan.Dao;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DocuJapan.Entity.Categories;
import DocuJapan.Entity.MapperCategories;

@Repository
public class CategoriesDao extends BaseDao {

	public List<Categories> getDataCategories() {
		List<Categories> list = new ArrayList<Categories>();
		
		String sql = "SELECT	* FROM categories";
		list = _jbdcTemplate.query(sql, new MapperCategories());
		return list;
}
	
	public Categories getDataCategoriesById(int id) {
		Categories category = new Categories();
		
		String sql = "SELECT  *FROM categories Where id="+id;
		category = _jbdcTemplate.queryForObject(sql, new MapperCategories());
		return category;
}
}
