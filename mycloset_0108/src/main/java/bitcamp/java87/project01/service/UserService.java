package bitcamp.java87.project01.service;

import java.util.Map;

import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;


public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String email) throws Exception;
	
	public User getUser(int user_no) throws Exception;
	
	public User getUser() throws Exception;
	
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void faceupdateUser(User user) throws Exception;
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(String email) throws Exception;
	
}