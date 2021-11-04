package DocuJapan.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DocuJapan.Entity.MapperSlides;
import DocuJapan.Entity.Slides;

@Repository
public class SlidesDao extends BaseDao{
	
public List<Slides> GetDataSlide(){
	List<Slides>  list=new ArrayList<Slides>();
	String sql="SELECT	* FROM slides;";
	list=_jbdcTemplate.query(sql, new MapperSlides());
	return list; 
}

}
