package DocuJapan.Service.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DocuJapan.Dao.SlidesDao;
import DocuJapan.Entity.Slides;

@Service
public class SlideService {

	@Autowired
	private SlidesDao slideDao;
	
	public int AddSlide(Slides slide) {

		return slideDao.AddSlide(slide);
	}

	public int DeleteSlide(int id) {

		return slideDao.DeleteSlide(id);
	}

	public int UpdateSlide(Slides slide) {

		return slideDao.UpdateSlide(slide);
	}
}
