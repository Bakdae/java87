package bitcamp.java87.project01.domain;

import java.util.List;

public class Cls {

  /// Field
 private int clNo;
 private int userNo;
 private String clName;
 private List<Style> style;
 
 
	public Cls() {
	super();
	
	}
	
	public int getClNo() {
		return clNo;
	}
	public void setClNo(int clNo) {
		this.clNo = clNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getClName() {
		return clName;
	}
	public void setClName(String clName) {
		this.clName = clName;
	}
	public List<Style> getStyle() {
		return style;
	}
	public void setStyle(List<Style> style) {
		this.style = style;
	}
	
	@Override
	public String toString() {
		return "Cls [clNo=" + clNo + ", userNo=" + userNo + ", clName=" + clName + ", style=" + style + "]";
	}

 






  
}