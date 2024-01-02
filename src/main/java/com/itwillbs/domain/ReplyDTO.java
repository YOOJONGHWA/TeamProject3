package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReplyDTO {
	
	private int replyNum;
	private String userId;
	private String replyContent;
	private int readcount;
	private Timestamp replyDate;
	private int replyReRef;
	private int replyReSeq;
	private int replyReLev;
	private int reviewNum;
	
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	public int getReplyReRef() {
		return replyReRef;
	}
	public void setReplyReRef(int replyReRef) {
		this.replyReRef = replyReRef;
	}
	public int getReplyReSeq() {
		return replyReSeq;
	}
	public void setReplyReSeq(int replyReSeq) {
		this.replyReSeq = replyReSeq;
	}
	public int getReplyReLev() {
		return replyReLev;
	}
	public void setReplyReLev(int replyReLev) {
		this.replyReLev = replyReLev;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replyNum=" + replyNum + ", userId=" + userId + ", replyContent=" + replyContent
				+ ", readcount=" + readcount + ", replyDate=" + replyDate + ", replyReRef=" + replyReRef
				+ ", replyReSeq=" + replyReSeq + ", replyReLev=" + replyReLev + ", reviewNum=" + reviewNum + "]";
	}
	
	
	
	
}
