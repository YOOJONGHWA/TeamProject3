package com.itwillbs.domain;

import java.sql.Timestamp;

public class CrewReplyDTO {

	private int crNum; 			// 댓글 고유번호
	private int crewNum; 		// crew 게시판 고유번호
	private String userId; 		// user_info 댓글 작성자
	private String crContent;	// 댓글 내용
	private Timestamp crDate; 	// 댓글 작성일
	private int crParent;		// 부모
	private int crDepth;		// 깊이
	private int crOrder;		// 순서
	
	
	public int getCrNum() {
		return crNum;
	}
	public void setCrNum(int crNum) {
		this.crNum = crNum;
	}
	public int getCrewNum() {
		return crewNum;
	}
	public void setCrewNum(int crewNum) {
		this.crewNum = crewNum;
	}
	public int getCrParent() {
		return crParent;
	}
	public void setCrParent(int crParent) {
		this.crParent = crParent;
	}
	public int getCrDepth() {
		return crDepth;
	}
	public void setCrDepth(int crDepth) {
		this.crDepth = crDepth;
	}
	public int getCrOrder() {
		return crOrder;
	}
	public void setCrOrder(int crOrder) {
		this.crOrder = crOrder;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCrContent() {
		return crContent;
	}
	public void setCrContent(String crContent) {
		this.crContent = crContent;
	}
	public Timestamp getCrDate() {
		return crDate;
	}
	public void setCrDate(Timestamp crDate) {
		this.crDate = crDate;
	}
	@Override
	public String toString() {
		return "CrewReplyDTO [crNum=" + crNum + ", crewNum=" + crewNum + ", userId=" + userId + ", crContent="
				+ crContent + ", crDate=" + crDate + ", crParent=" + crParent + ", crDepth=" + crDepth + ", crOrder="
				+ crOrder + "]";
	}

	
	
	
}
