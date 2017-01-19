package bitcamp.java87.project01.service;

import java.util.List;
import java.util.Map;


import bitcamp.java87.project01.domain.Cls;
import bitcamp.java87.project01.domain.Cls2;



public interface ClsService {
	
	 public void addCls(Cls2 cls) throws Exception;
		
	 public List<Cls> getClsList(int userNo) throws Exception;
	 
	 public void  deleteCls(int cls_no) throws Exception;
}