package bitcamp.java87.project01.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import bitcamp.java87.project01.dao.ClsDao;
import bitcamp.java87.project01.domain.Cls;
import bitcamp.java87.project01.domain.Cls2;
import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.domain.Wardrobe;
import bitcamp.java87.project01.service.ClsService;



@Service("clsServiceImpl")
public class ClsServiceImpl implements ClsService{
	
	///Field
	@Autowired
	@Qualifier("clsDaoImpl")
	private ClsDao clsDao;	
	
	///Constructor
	public ClsServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCls(Cls2 cls) throws Exception {
			clsDao.addCls(cls);
	}

	@Override
	public List<Cls> getClsList(int userNo) throws Exception {
		return clsDao.getClsList(userNo);
	}

	@Override
	public void deleteCls(int cls_no) throws Exception {
		
		
	}



	/*@Override
	public Map<String, Object> getClsList(int cls_no) throws Exception {
		return clsDao.getClsList(cls_no);
	}*/

}