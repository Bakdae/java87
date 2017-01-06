package bitcamp.java87.project01.dao;

import java.util.List;

import bitcamp.java87.project01.domain.Wardrobe;

public interface WardrobeDao {
  
  // insert - 옷장 추가
  public void addWardrobe(Wardrobe wardrobe) throws Exception ; 
  
  // selectOne - 옷장 이름 중복체크 (user_no, cls_name 필요)
  public Wardrobe getWardrobe(Wardrobe wardrobe) throws Exception ; 

  // selectOne - 옷장일련번호로 get
  public Wardrobe getWardrobe(int cls_no) throws Exception ; 
  
  // selectList  - 옷장 목록 출력
  public List<Wardrobe> getWardrobeList(int user_no) throws Exception ; 

  // update - 옷장 이름 변경
  public void updateWardrobe(Wardrobe wardrobe) throws Exception;

  // delete - 옷장 삭제
  public void deleteWardrobe(int cls_no) throws Exception;
  
}
