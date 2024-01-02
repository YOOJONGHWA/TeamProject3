package com.itwillbs.domain;

public class QpPageDTO {		//CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

	private int qpPageSize;					//화면에 보여줄 글개수
	private String qpPageNum;				//현재 페이지 번호	
	private int qpCurrentPage;				//현재 페이지 번호를 정수형으로
	private int qpStartRow;					//시작하는 행번호
	private int qpEndRow;					//끝나는 행번호
	
	private int qpCount;						//전제글개수			
	private int qpPageBlock;					//화면에 보여줄 페이지갯수 		
	private int qpStartPage;				//시작하는 페이지번호
	private int qpEndPage;					//끝나는 페이지번호
	private int qpPageCount;				//전체페이지갯수
	
	private String qpKeyWord;				//검색	
	
	
//	public PageDTO() {
//		super();
//		this(1, 10);
//	}
//	
//	public PageDTO(String qpPageNum, int qpPageBlock) {
//		super();
//		this.qpPageNum = qpPageNum;
//		this.qpPageBlock = qpPageBlock;
//	}

	
	public String getQpKeyWord() {
		return qpKeyWord;
	}
	public void setQpKeyWord(String qpKeyWord) {
		this.qpKeyWord = qpKeyWord;
	}
	
	
	public int getQpPageSize() {
		return qpPageSize;
	}
	public void setQpPageSize(int qpPageSize) {
		this.qpPageSize = qpPageSize;
	}
	public String getQpPageNum() {
		return qpPageNum;
	}
	public void setQpPageNum(String qpPageNum) {
		this.qpPageNum = qpPageNum;
	}
	public int getQpCurrentPage() {
		return qpCurrentPage;
	}
	public void setQpCurrentPage(int qpCurrentPage) {
		this.qpCurrentPage = qpCurrentPage;
	}
	public int getQpStartRow() {
		return qpStartRow;
	}
	public void setQpStartRow(int qpStartRow) {
		this.qpStartRow = qpStartRow;
	}
	public int getQpEndRow() {
		return qpEndRow;
	}
	public void setQpEndRow(int qpEndRow) {
		this.qpEndRow = qpEndRow;
	}
	public int getQpCount() {
		return qpCount;
	}
	public void setQpCount(int qpCount) {
		this.qpCount = qpCount;
	}
	public int getQpPageBlock() {
		return qpPageBlock;
	}
	public void setQpPageBlock(int qpPageBlock) {
		this.qpPageBlock = qpPageBlock;
	}
	public int getQpStartPage() {
		return qpStartPage;
	}
	public void setQpStartPage(int qpStartPage) {
		this.qpStartPage = qpStartPage;
	}
	public int getQpEndPage() {
		return qpEndPage;
	}
	public void setQpEndPage(int qpEndPage) {
		this.qpEndPage = qpEndPage;
	}
	public int getQpPageCount() {
		return qpPageCount;
	}
	public void setQpPageCount(int qpPageCount) {
		this.qpPageCount = qpPageCount;
	}
	
//	@Override
//	public String toString() {
//		return "PageDTO [qpPageNum=" + qpPageNum + ", qpPageBlock=" + qpPageBlock + "]";
//	}
	
	
}		//CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
