package bitcamp.java87.project01.domain;

public class Wardrobe {

	///Field
  private int cls_no;
  private int user_no;
  private String cls_name;
  
  private int follower;
  private int following;
  private User follow;
  
  private Style hang;
  
  ///Constructor
  public Wardrobe(){
  }
  
  ///Method
	public int getCls_no() {
    return cls_no;
  }

  public void setCls_no(int cls_no) {
    this.cls_no = cls_no;
  }

  public int getUser_no() {
    return user_no;
  }

  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }

  public String getCls_name() {
    return cls_name;
  }

  public void setCls_name(String cls_name) {
    this.cls_name = cls_name;
  }

  public int getFollower() {
    return follower;
  }

  public void setFollower(int follower) {
    this.follower = follower;
  }

  public int getFollowing() {
    return following;
  }

  public void setFollowing(int following) {
    this.following = following;
  }

  public User getFollow() {
    return follow;
  }

  public void setFollow(User follow) {
    this.follow = follow;
  }

  public Style getHang() {
    return hang;
  }

  public void setHang(Style hang) {
    this.hang = hang;
  }

  @Override
  public String toString() {
    return "Wardrobe [cls_no=" + cls_no + ", user_no=" + user_no + ", cls_name=" + cls_name + ", follower=" + follower
        + ", following=" + following + ", follow=" + follow + ", hang=" + hang + "]";
  }

}