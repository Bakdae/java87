package bitcamp.java87.project01.service;

import java.util.List;
import java.util.Map;

import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Comment;

public interface CommentService {

  public void addComment(Comment comment) throws Exception;
  
  public List<Comment> getComment(int styleNo) throws Exception;
   

  /*public Comment getComment(int cmt_no) throws Exception;*/

  /*
   * public Map<String , Object> getUserList(Search search) throws Exception;
   * 
   * public void updateUser(User user) throws Exception;
   * 
   * public void faceupdateUser(User user) throws Exception; // ȸ�� ID �ߺ� Ȯ��
   * public boolean checkDuplication(String email) throws Exception;
   */

}