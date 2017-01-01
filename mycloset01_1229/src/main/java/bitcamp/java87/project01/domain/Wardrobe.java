package bitcamp.java87.project01.domain;

public class Wardrobe {

	///Field
  private int cls_no;
  private int user_no;
  private String cls_name;

	///Constructor
  public Wardrobe(){
  }

  public int getCls_no() {
    return cls_no;
  }

  public int getUser_no() {
    return user_no;
  }

  public String getCls_name() {
    return cls_name;
  }

  public void setCls_no(int cls_no) {
    this.cls_no = cls_no;
  }

  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }

  public void setCls_name(String cls_name) {
    this.cls_name = cls_name;
  }

  @Override
  public String toString() {
    return "Wardrobe [cls_no=" + cls_no + ", user_no=" + user_no + ", cls_name=" + cls_name+ "]";
  }
	
}