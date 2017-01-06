package bitcamp.java87.project01.dao;

import java.util.List;
import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.domain.Search;


public interface StyleDao {
	

	public List<Style> getStyleList(Search search) throws Exception ;

	public int getTotalCount(Search search) throws Exception ;

	public void addStyle(Style style)throws Exception ;

	public Style getStyle(int styleNo)throws Exception ;

	public void updateStyle(Style style)throws Exception ;
	
	public void deleteStyle(int styleNo)throws Exception ;

	
}