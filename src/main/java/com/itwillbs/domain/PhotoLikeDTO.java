package com.itwillbs.domain;

public class PhotoLikeDTO {

	private int plNum;		// primary key 추천 고유번호
	private int photoNum;	// photo 게시판 고유번호
	private String userId;	// "user_info 좋아요 누른 회원 번호"
	private int plCheck;	// 좋아요 체크 여부
	
	public int getPlNum() {
		return plNum;
	}
	public void setPlNum(int plNum) {
		this.plNum = plNum;
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
	public int getPlCheck() {
		return plCheck;
	}
	public void setPlCheck(int plCheck) {
		this.plCheck = plCheck;
	}
	


	

	
}
