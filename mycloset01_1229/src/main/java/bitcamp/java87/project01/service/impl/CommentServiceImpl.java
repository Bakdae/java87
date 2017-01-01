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
public class CommentServiceImpl implements CommentService{
	
	///Field
	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;
	
	public void setCommentDao(CommentDao commentDao) { /** */
		this.commentDao = commentDao;
	}
	
	///Constructor
	public CommentServiceImpl() {
		System.out.println("서비스임플"+this.getClass());
	}

	///Method
	public void addComment(Comment comment) throws Exception {

		commentDao.addComment(comment);
	}
	
	public List<Comment> getComment(int styleNo) throws Exception{

	  commentDao.getComment(styleNo);
	}

	/*public Comment getComment(int cmt_no) throws Exception {
		Comment comment = new Comment();
		comment=commentDao.getComment(cmt_no);
		System.out.println(comment);
	
		return comment;
	}*/
  /*
	public Map<String , Object > getUserList(Search search) throws Exception {
		List<Comment> list= commentDao.getCommentList(search);
		int totalCount = commentDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	public boolean checkDuplication(String email) throws Exception {
		boolean result=true;
		User user=userDao.getUser(email);
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public void faceupdateUser(User user) throws Exception {
		userDao.faceupdateUser(user);		
	}
	*/
}