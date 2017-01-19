package bitcamp.java87.project01.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import bitcamp.java87.project01.dao.StyleDao;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.service.StyleService;


@Service("StyleServiceImpl")
public class StyleServiceImpl implements StyleService{
	
	///Field
	@Autowired
	@Qualifier("StyleDaoImpl")
	private StyleDao styleDao;
		
	
	public void setStyleDao(StyleDao styleDao) {
		this.styleDao = styleDao;
	}
	
	///Constructor
	public StyleServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addStyle(Style style) throws Exception {
		styleDao.addStyle(style);
	}
	
	@Override
	public Style getStyle(int styleNo) throws Exception {
	  // TODO Auto-generated method stub
	  return styleDao.getStyle(styleNo);
	}
	
	@Override
	public Map<String , Object> getStyleList(Search search) throws Exception {
		
	  List<Style> list= styleDao.getStyleList(search);
	  System.out.println("서비스 레이어 getStyleList 디버깅 0 list.get(0)"+list.get(0));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		
		return map;
	}

	@Override
	public void updateStyle(Style style) throws Exception {
		// TODO Auto-generated method stub
	  styleDao.updateStyle(style);
	}
	
	@Override
	public void deleteStyle(int styleNo) throws Exception {
		styleDao.deleteStyle(styleNo);
	}


}