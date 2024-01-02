package com.itwillbs.domain;

import java.sql.Timestamp;

public class PhotoReplyDTO {

	private int prNum; 			// 댓글 고유번호
	private int photoNum; 		// photo 게시판 고유번호
	private String userId; 		// user_info 댓글 작성자
	private String prContent;	// 댓글 내용
	private Timestamp prDate; 	// 댓글 작성일
	private int prParent;		// 부모
	private int prDepth;		// 깊이
	private int prOrder;		// 순서
	
	public int getPrNum() {
		return prNum;
	}
	public void setPrNum(int prNum) {
		this.prNum = prNum;
	}
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPrContent() {
		return prContent;
	}
	public void setPrContent(String prContent) {
		this.prContent = prContent;
	}
	public Timestamp getPrDate() {
		return prDate;
	}
	public void setPrDate(Timestamp prDate) {
		this.prDate = prDate;
	}
	public int getPrParent() {
		return prParent;
	}
	public void setPrParent(int prParent) {
		this.prParent = prParent;
	}
	public int getPrDepth() {
		return prDepth;
	}
	public void setPrDepth(int prDepth) {
		this.prDepth = prDepth;
	}
	public int getPrOrder() {
		return prOrder;
	}
	public void setPrOrder(int prOrder) {
		this.prOrder = prOrder;
	}
	
	@Override
	public String toString() {
		return "PhotoReplyDTO [prNum=" + prNum + ", photoNum=" + photoNum + ", userId=" + userId + ", prContent="
				+ prContent + ", prDate=" + prDate + ", prParent=" + prParent + ", prDepth=" + prDepth + ", prOrder="
				+ prOrder + "]";
	}

}
