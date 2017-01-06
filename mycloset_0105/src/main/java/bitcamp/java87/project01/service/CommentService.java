package bitcamp.java87.project01.service;

import java.util.List;
import java.util.Map;

import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Comment;

public interface CommentService {

  public void addComment(Comment comment) throws Exception;
  
  public List<Comment> getCommentList(int styleNo) throws Exception;
  
  public void deleteComment(int cmtNo)throws Exception;
  
  public Comment getComment(int cmtNo) throws Exception;

}