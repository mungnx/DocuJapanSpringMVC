package DocuJapan.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import DocuJapan.Entity.Images;
import DocuJapan.Entity.MapperImages;

@Repository
public class ImageDao extends BaseDao{
	
public List<Images> GetImage(){
	List<Images>  list=new ArrayList<Images>();
	String sql="SELECT	* FROM images";
	list=_jbdcTemplate.query(sql, new MapperImages());
	return list; 
}


public int AddImage(Images image) {
	StringBuffer sql=new StringBuffer();
	sql.append("INSERT into images");
	sql.append("(" );
	sql.append("img,");
	sql.append("id_product");
	sql.append(") ");
	sql.append("VALUES ");
	sql.append("(");
	sql.append("'"+image.getImg()+"',");
	sql.append("'"+image.getId_product()+"' ");
	sql.append(")");
	
	int insert =_jbdcTemplate.update(sql.toString());
	return insert;
}

public int DeleteImage(int id) {
	String sql = "DELETE  FROM images WHERE id=" + id;
	return _jbdcTemplate.update(sql);
}


public int UpdateImage(Images image, int id) {
	
	StringBuffer sql=new StringBuffer();
	sql.append("UPDATE images");
	sql.append(" SET" );
	sql.append(" img= '"+image.getImg()+"',");
	sql.append(" id_product= '"+image.getId_product()+"'");
	sql.append(" WHERE");
	sql.append(" id= "+id);
	
	return _jbdcTemplate.update(sql.toString());
}


public List<Images> GetImageById(int id_product) {
	List<Images>  list=new ArrayList<Images>();
		
		String sql = "SELECT  *FROM images WHERE id_product="+id_product;
		list = _jbdcTemplate.query(sql, new MapperImages());
		return list;
}

}
