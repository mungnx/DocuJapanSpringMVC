package DocuJapan.Dao;
import java.util.ArrayList;
import java.util.List;

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
	
	
	public int AddCategory(Categories category) {
		StringBuffer sql=new StringBuffer();
		sql.append("INSERT into categories");
		sql.append("(" );
		sql.append("name,");
		sql.append("caption");
		sql.append(") ");
		sql.append("VALUES ");
		sql.append("(");
		sql.append("'"+category.getName()+"',");
		sql.append("'"+category.getCaption()+"' ");
		sql.append(")");
		
		int insert =_jbdcTemplate.update(sql.toString());
		return insert;
	}

	public int DeleteCategory(int id) {
		String sql = "DELETE  FROM categories WHERE id=" + id;
		return _jbdcTemplate.update(sql);
	}
	

	public int UpdateCategory(Categories category) {
		
		StringBuffer sql=new StringBuffer();
		sql.append("UPDATE categories");
		sql.append(" SET" );
		sql.append(" name= '"+category.getName()+"',");
		sql.append(" caption= '"+category.getCaption()+"'");
		sql.append(" WHERE");
		sql.append(" id= "+category.getId());
		
		return _jbdcTemplate.update(sql.toString());
	}
}
