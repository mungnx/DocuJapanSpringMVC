package DocuJapan.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import DocuJapan.Entity.MapperSlides;
import DocuJapan.Entity.Slides;

@Repository
public class SlidesDao extends BaseDao{
	
public List<Slides> GetDataSlide(){
	List<Slides>  list=new ArrayList<Slides>();
	String sql="SELECT	* FROM slides";
	list=_jbdcTemplate.query(sql, new MapperSlides());
	return list; 
}


public int AddSlide(Slides slide) {
	StringBuffer sql=new StringBuffer();
	sql.append("INSERT into slides");
	sql.append("(" );
	sql.append("img,");
	sql.append("caption,");
	sql.append("content");
	sql.append(") ");
	sql.append("VALUES ");
	sql.append("(");
	sql.append("'"+slide.getImg()+"',");
	sql.append("'"+slide.getCaption()+"', ");
	sql.append("'"+slide.getContent()+"' ");
	sql.append(")");
	
	int insert =_jbdcTemplate.update(sql.toString());
	return insert;
}

public int DeleteSlide(int id) {
	String sql = "DELETE  FROM slides WHERE id=" + id;
	return _jbdcTemplate.update(sql);
}


public int UpdateSlide(Slides slide) {
	
	StringBuffer sql=new StringBuffer();
	sql.append("UPDATE slides");
	sql.append(" SET" );
	sql.append(" img= '"+slide.getImg()+"',");
	sql.append(" caption= '"+slide.getCaption()+"',");
	sql.append(" content= '"+slide.getContent()+"'");
	sql.append(" WHERE");
	sql.append(" id= "+slide.getId());
	
	return _jbdcTemplate.update(sql.toString());
}


public Slides getSlideById(int id) {
		Slides slide = new Slides();
		
		String sql = "SELECT  *FROM slides Where id="+id;
		slide = _jbdcTemplate.queryForObject(sql, new MapperSlides());
		return slide;
}

}
