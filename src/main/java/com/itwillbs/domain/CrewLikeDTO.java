package com.itwillbs.domain;

public class CrewLikeDTO {

	private int clNum;		// primary key 추천 고유번호
	private int crewNum;	// crew 게시판 고유번호
	private String userId;	// "user_info 좋아요 누른 회원 번호"
	private int clCheck;	// 좋아요 체크 여부
	
	public int getClNum() {
		return clNum;
	}
	public void setClNum(int clNum) {
		this.clNum = clNum;
	}
	public int getCrewNum() {
		return crewNum;
	}
	public void setCrewNum(int crewNum) {
		this.crewNum = crewNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getClCheck() {
		return clCheck;
	}
	public void setClCheck(int clCheck) {
		this.clCheck = clCheck;
	}
	

	

	
}
