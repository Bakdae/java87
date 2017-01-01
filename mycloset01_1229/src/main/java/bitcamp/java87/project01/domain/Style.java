package bitcamp.java87.project01.domain;

import java.util.Date;

public class Style {

  private int styleNo;
  private User user_no;
  private String fileName;
  private String tnFileName;
  private String styleTitle;

  private String infomation1;
  private String infomation2;
  private String infomation3;
  private String infomation4;
  private String infomation5;

  private String styleLike;

  private String hashTagString;

  private Date regDate;

  private String styleDesc;

  public Style() {
  }

  public User getUser_no() {
    return user_no;
  }

  public int getStyleNo() {
    return styleNo;
  }

  public void setStyleNo(int styleNo) {
    this.styleNo = styleNo;
  }

  public void setUser_no(User user_no) {
    this.user_no = user_no;
  }

  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public String getTnFileName() {
    return tnFileName;
  }

  public void setTnFileName(String tnFileName) {
    this.tnFileName = tnFileName;
  }

  public String getStyleTitle() {
    return styleTitle;
  }

  public void setStyleTitle(String styleTitle) {
    this.styleTitle = styleTitle;
  }

  public String getInfomation1() {
    return infomation1;
  }

  public void setInfomation1(String infomation1) {
    this.infomation1 = infomation1;
  }

  public String getInfomation2() {
    return infomation2;
  }

  public void setInfomation2(String infomation2) {
    this.infomation2 = infomation2;
  }

  public String getInfomation3() {
    return infomation3;
  }

  public void setInfomation3(String infomation3) {
    this.infomation3 = infomation3;
  }

  public String getInfomation4() {
    return infomation4;
  }

  public void setInfomation4(String infomation4) {
    this.infomation4 = infomation4;
  }

  public String getInfomation5() {
    return infomation5;
  }

  public void setInfomation5(String infomation5) {
    this.infomation5 = infomation5;
  }

  public String getStyleLike() {
    return styleLike;
  }

  public void setStyleLike(String styleLike) {
    this.styleLike = styleLike;
  }

  public String getHashTagString() {
    return hashTagString;
  }

  public void setHashTagString(String hashTagString) {
    this.hashTagString = hashTagString;
  }

  public Date getRegDate() {
    return regDate;
  }

  public void setRegDate(Date regDate) {
    this.regDate = regDate;
  }

  public String getStyleDesc() {
    return styleDesc;
  }

  public void setStyleDesc(String styleDesc) {
    this.styleDesc = styleDesc;
  }

  @Override
  public String toString() {
    return "Style [styleNo=" + styleNo + ", user_no=" + user_no + ", fileName=" + fileName + ", tnFileName="
        + tnFileName + ", styleTitle=" + styleTitle + ", infomation1=" + infomation1 + ", infomation2=" + infomation2
        + ", infomation3=" + infomation3 + ", infomation4=" + infomation4 + ", infomation5=" + infomation5
        + ", styleLike=" + styleLike + ", hashTagString=" + hashTagString + ", regDate=" + regDate + ", styleDesc="
        + styleDesc + "]";
  }

}