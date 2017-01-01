package bitcamp.java87.project01.dao;

import java.util.List;

import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Comment;

public interface CommentDao {

  // INSERT
  public void addComment(Comment comment) throws Exception;

  //SELECTLIST
  public List<Comment> getComment(int styleNo) throws Exception;
  // SELECT ONE
 /* public Comment getComment(int cmt_no) throws Exception;*/

  /*
   * // SELECT LIST public List<User> getUserList(Search search) throws
   * Exception ;
   * 
   * // UPDATE public void updateUser(User user) throws Exception ;
   * 
   * // FACEBOOKUPDATE public void faceupdateUser(User user) throws Exception ;
   * 
   * //(totalCount) return public int getTotalCount(Search search) throws
   * Exception ;
   */
}
