package com.itwillbs.domain;

public class CrewPageDTO {
	private int pageSize;
	private String pageNum;
	private int currentPage;
	private int startRow;
	private int endRow;
	
	private int count;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int pageCount;
	
	// 글 번호
	private int CrewNum;
	
	// 카테고리
	private String actCategory;		// activity act_category
	private String actLocation;		// activity activity act_location
	

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	// 글 번호
	public int getCrewNum() {
		return CrewNum;
	}
	public void setCrewNum(int crewNum) {
		CrewNum = crewNum;
	}

	// 카테고리
	public String getActCategory() {
		return actCategory;
	}
	public void setActCategory(String actCategory) {
		this.actCategory = actCategory;
	}
	public String getActLocation() {
		return actLocation;
	}
	public void setActLocation(String actLocation) {
		this.actLocation = actLocation;
	}
	
	@Override
	public String toString() {
		return "CrewPageDTO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", currentPage=" + currentPage
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count + ", pageBlock=" + pageBlock
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", pageCount=" + pageCount + ", CrewNum="
				+ CrewNum + ", actCategory=" + actCategory + ", actLocation=" + actLocation + "]";
	}
	
	

}
