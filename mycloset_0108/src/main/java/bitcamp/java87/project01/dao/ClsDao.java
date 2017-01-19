package bitcamp.java87.project01.dao;

import java.util.List;
import java.util.Map;

import bitcamp.java87.project01.domain.Cls;
import bitcamp.java87.project01.domain.Cls2;


public interface ClsDao {

  // INSERT2
  public void addCls(Cls2 cls) throws Exception;

  //SELECTLIST
 public List<Cls> getClsList(int userNo) throws Exception;
  //DELETE
 public void deleteCls(int cls_no)throws Exception;
  


}
