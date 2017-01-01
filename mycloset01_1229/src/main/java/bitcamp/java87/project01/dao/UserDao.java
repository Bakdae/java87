package bitcamp.java87.project01.dao;

import java.util.List;

import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;


public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String email) throws Exception ;
	public User getUser() throws Exception ;
	// SELECT LIST
	public List<User> getUserList(Search search) throws Exception ;

	// SELECT ONE : user_no
	public User getUser(int user_no) throws Exception ;
	
	// UPDATE
	public void updateUser(User user) throws Exception ;
	
	// FACEBOOKUPDATE
		public void faceupdateUser(User user) throws Exception ;
		
	//(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}