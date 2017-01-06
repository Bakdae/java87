package bitcamp.java87.project01.domain;

/**
 * @author jwee0
 *
 */
public class Search {
	
	/// Field
	private int cntPerPage;
	private int pageNo;
	private int offSet;
	private String keyword;
	
	/// Constructor
	public Search() {
	}
	
	public Search(int cntPerPage, int pageNo, String keyword) {
		this.cntPerPage = cntPerPage;
		this.pageNo = pageNo;
		this.offSet = (pageNo + 1) * cntPerPage;
		this.keyword = keyword;
	}
	/// Method
	
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
		return (getPageNo() + 1) * getCntPerPage();
	}
	
	public void setOffSet() {
		this.offSet = (getPageNo() + 1) * getCntPerPage();
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Search [cntPerPage=" + cntPerPage + ", pageNo=" + pageNo + ", offSet=" + offSet + ", keyword=" + keyword
		        + "]";
	}
	
}