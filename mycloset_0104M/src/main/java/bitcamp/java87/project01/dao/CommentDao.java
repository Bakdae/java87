package bitcamp.java87.project01.dao;

import java.util.List;

import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Comment;

public interface CommentDao {

  // INSERT
  public void addComment(Comment comment) throws Exception;

  //SELECTLIST
  public List<Comment> getCommentList(int styleNo) throws Exception;
  
  //DELETE
  public void deleteComment(int cmtNo)throws Exception;
  
  // SELECT ONE
 public Comment getComment(int cmtNo) throws Exception;

  
}
