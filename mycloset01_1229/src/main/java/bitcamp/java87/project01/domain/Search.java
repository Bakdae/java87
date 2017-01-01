package bitcamp.java87.project01.domain;


public class Search {
	
	///Field
  private int cntPerPage; 
  private int pageNo;
  private int offSet;
	
	///Constructor
	public Search() {
	}
	public Search(int cntPerPage, int pageNo) {
	  this.cntPerPage = cntPerPage;
	  this.pageNo = pageNo;
	  this.offSet = (pageNo+1)*cntPerPage;
  }
	///Method

  public int getCntPerPage() {
    return cntPerPage;
  }

  public void setCntPerPage(int cntPerPage) {
    this.cntPerPage = cntPerPage;
  }

  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public int getOffSet() {
    return (getPageNo()+1) * getCntPerPage();
  }

  public void setOffSet() {
    this.offSet = (getPageNo()+1) * getCntPerPage();
  }

  @Override
  public String toString() {
    return "Search [cntPerPage=" + cntPerPage + ", pageNo=" + pageNo + ", offSet=" + offSet + "]";
  }
	
}