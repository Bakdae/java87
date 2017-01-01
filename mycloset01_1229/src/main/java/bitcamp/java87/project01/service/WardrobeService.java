package bitcamp.java87.project01.service;

import java.util.Map;

import bitcamp.java87.project01.domain.Wardrobe;


public interface WardrobeService {

  public void addWardrobe(Wardrobe wardrobe) throws Exception;

  public Wardrobe getWardrobe(Wardrobe wardrobe) throws Exception;  
  
  public Wardrobe getWardrobe(int cls_no) throws Exception;  

  public Map<String, Object> getWardrobeList(int user_no) throws Exception;  
  
  public void updateWardrobe(Wardrobe wardrobe) throws Exception;

  public void deleteWardrobe(int cls_no) throws Exception;

}
