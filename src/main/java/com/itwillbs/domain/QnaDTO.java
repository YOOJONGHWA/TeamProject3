package com.itwillbs.domain;

import java.sql.Timestamp;

/**
 * @author ITWILL
 */

public class QnaDTO {				//CCCCCCCCCCCCCCC
	private int qnaIndex;			//원글 번호
	private int qnaNum;				//글번호
	private String userId; 			//ID
	private String qnaSubject;		//제목
	private String qnaContent; 	 	//글내용
	private Timestamp qnaDate;	//등록일	
	private int qnaReadcount; 		//조회수
	private int qnaSecret; 			//비밀글
	private String qnaName;		//작성자
	
	private int qnaRef;				//그룹번호 == 일반글번호
	private int qnaLev;				//들여쓰기 0
	private int qnaSeq;				//답글순서 0
	
	

	
	public int getQnaIndex() {
		return qnaIndex;
	}

	public void setQnaIndex(int qnaIndex) {
		this.qnaIndex = qnaIndex;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQnaSubject() {
		return qnaSubject;
	}

	public void setQnaSubject(String qnaSubject) {
		this.qnaSubject = qnaSubject;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Timestamp getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Timestamp qnaDate) {
		this.qnaDate = qnaDate;
	}

	public int getQnaReadcount() {
		return qnaReadcount;
	} 

	public void setQnaReadcount(int qnaReadcount) {
		this.qnaReadcount = qnaReadcount;
	} 

	public int getQnaSecret() {
		return qnaSecret;
	}

	public void setQnaSecret(int qnaSecret) {
		this.qnaSecret = qnaSecret;
	}

	public String getQnaName() {
		return qnaName;
	} 

	public void setQnaName(String qnaName) {
		this.qnaName = qnaName;
	}
	
	public int getQnaRef() {
		return qnaRef;
	}
	public void setQnaRef(int qnaRef) {
		this.qnaRef = qnaRef;
	}
	public int getQnaLev() {
		return qnaLev;
	}
	public void setQnaLev(int qnaLev) {
		this.qnaLev = qnaLev;
	}
	public int getQnaSeq() {
		return qnaSeq;
	}
	public void setQnaSeq(int qnaSeq) {
		this.qnaSeq = qnaSeq;
	}

	@Override
	public String toString() {
		return "QnaDTO [qnaIndex=" + qnaIndex + ", qnaNum=" + qnaNum + ", userId=" + userId + ", qnaSubject="
				+ qnaSubject + ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate + ", qnaReadcount=" + qnaReadcount
				+ ", qnaSecret=" + qnaSecret + ", qnaName=" + qnaName + ", qnaRef=" + qnaRef + ", qnaLev=" + qnaLev
				+ ", qnaSeq=" + qnaSeq + "]";
	}

	
	

	
	
}				//CCCCCCCC
