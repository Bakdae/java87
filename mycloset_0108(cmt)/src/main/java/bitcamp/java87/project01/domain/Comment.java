package bitcamp.java87.project01.domain;

public class Comment {

  /// Field
  private int cmtNo;
  private int styleNo;
  private int userNo;
  private String nick;
  private String content;
  private String hrs;

  /// Constructor
  public Comment() {
  }

  public int getCmtNo() {
    return cmtNo;
  }

  public void setCmtNo(int cmtNo) {
    this.cmtNo = cmtNo;
  }

  public int getStyleNo() {
    return styleNo;
  }

  public void setStyleNo(int styleNo) {
    this.styleNo = styleNo;
  }

  public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
    this.userNo = userNo;
  }

  public String getNick() {
    return nick;
  }

  public void setNick(String nick) {
    this.nick = nick;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getHrs() {
    return hrs;
  }

  public void setHrs(String hrs) {
    this.hrs = hrs;
  }

  @Override
  public String toString() {
    return "Comment [cmtNo=" + cmtNo + ", styleNo=" + styleNo + ", userNo=" + userNo + ", nick=" + nick + ", content="
        + content + ", hrs=" + hrs + "]";
  }
  
}