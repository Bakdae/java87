package bitcamp.java87.project01.dao;

import java.util.List;
import java.util.Map;

import bitcamp.java87.project01.domain.Cls;
import bitcamp.java87.project01.domain.Wardrobe;

public interface WardrobeDao {
  
  // insert - 옷장 추가
  public void addWardrobe(Wardrobe wardrobe) throws Exception ; 
  
  // selectOne - 옷장 이름 중복체크 (user_no, cls_name 필요)
  public Wardrobe getWardrobe(Wardrobe wardrobe) throws Exception ; 

  // selectOne - 옷장일련번호로 get
  public Wardrobe getWardrobe(int cls_no) throws Exception ; 
  
  // selectList  - 옷장 목록 출력
  public Map<String, Object> getWardrobeList(int user_no) throws Exception ; 

  // update - 옷장 이름 변경
  public void updateWardrobe(Wardrobe wardrobe) throws Exception;

  // delete - 옷장 삭제
  public void deleteWardrobe(int cls_no) throws Exception;
  
  
  // insert - 옷장 팔로우 (세션유저(Follower)가 타인 옷장의 팔로우버튼을 눌렀을 때)
  public void addFollow(Wardrobe wardrobe) throws Exception;
  
  // delete - 옷장 언팔로우 (세션유저(Follower)가 타인 옷장의 언팔로우버튼을 눌렀을 때)
  public void deleteFollow(Wardrobe wardrobe) throws Exception;
  
  // selectOne - 옷장 팔로우 여부
  public int getFollow(Wardrobe wardrobe) throws Exception ; 
  
  // selectList  - 팔로워(세션유저의 옷장에서 팔로우 버튼을 누른 유저) 목록 출력
  public List<Wardrobe> getFollowerList(int following) throws Exception ; 

  // selectList  - 팔로잉(세션유저가 팔로우 버튼을 누른 옷장) 목록 출력
  public List<Wardrobe> getFollowingList(int follower) throws Exception ; 
  
  

}
