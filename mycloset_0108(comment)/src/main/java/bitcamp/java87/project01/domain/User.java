package bitcamp.java87.project01.domain;


public class User {
	
	///Field
	private int user_no;
	private String email;
	private String nick;
	private String pwd;
	private String phot_path;
	

	
	
	///Constructor
	public User(){
	}




  public String getEmail() {
    return email;
  }




  public int getUser_no() {
    return user_no;
  }




  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }




  public void setEmail(String email) {
    this.email = email;
  }




  public String getNick() {
    return nick;
  }




  public void setNick(String nick) {
    this.nick = nick;
  }




  public String getPwd() {
    return pwd;
  }




  public void setPwd(String pwd) {
    this.pwd = pwd;
  }




  public String getPhot_path() {
    return phot_path;
  }




  public void setPhot_path(String phot_path) {
    this.phot_path = phot_path;
  }




@Override
public String toString() {
	return "User [user_no=" + user_no + ", email=" + email + ", nick=" + nick + ", pwd=" + pwd + ", phot_path="
			+ phot_path + "]";
}




  
	
	///Method 
	
}