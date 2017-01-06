package bitcamp.java87.project01.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import bitcamp.java87.project01.dao.CommentDao;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Comment;
import bitcamp.java87.project01.service.CommentService;;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService {

  /// Field
  @Autowired
  @Qualifier("commentDaoImpl")
  private CommentDao commentDao;

  public void setCommentDao(CommentDao commentDao) { /** */
    this.commentDao = commentDao;
  }

  /// Constructor
  public CommentServiceImpl() {
    System.out.println("서비스임플" + this.getClass());
  }

  /// Method
  public void addComment(Comment comment) throws Exception {

    commentDao.addComment(comment);
  }

  // getCommentList
  public List<Comment> getCommentList(int styleNo) throws Exception {

    return commentDao.getCommentList(styleNo);
  }
  
  //deleteComment
  public void deleteComment(int cmtNo)throws Exception{
    
   commentDao.deleteComment(cmtNo);
  }

  @Override
  public Comment getComment(int cmtNo) throws Exception {
    return commentDao.getComment(cmtNo);
  }

}