package bitcamp.java87.project01.dao.impl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import bitcamp.java87.project01.dao.CommentDao;
import bitcamp.java87.project01.domain.Comment;


@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CommentDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addComment(Comment comment) throws Exception {
	  System.out.println("dao : "+comment);
		sqlSession.insert("CommentMapper.addComment", comment);
	}

	public List<Comment> getCommentList(int styleNo) throws Exception {
	  List<Comment> list = sqlSession.selectList("CommentMapper.getCommentList", styleNo);
	  return list;
	}
	
	public void deleteComment(int cmtNo)throws Exception{
	  System.out.println("dao : "+cmtNo);
	  sqlSession.delete("CommentMapper.deleteComment", cmtNo);
	}

  @Override
  public Comment getComment(int cmtNo) throws Exception {
    return  sqlSession.selectOne("CommentMapper.getComment", cmtNo);
  }
	
	
}