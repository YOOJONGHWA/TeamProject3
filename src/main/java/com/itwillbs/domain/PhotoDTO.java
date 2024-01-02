package com.itwillbs.domain;

import java.sql.Timestamp;

public class PhotoDTO {

	private int photoNum;			//게시판 고유번호
	private String userId;			//글 작성자
	private String photoContent;	//글 내용
	private String photoImage;		//글 사진
	private String photoLocation;	//글 장소
	private int photoReadcount;		//글 조회수
	private Timestamp photoDate;	//글 작성일자
	
	// 댓글 개수 가져오기
	private int replyCount;
	
	// 현재 사용자가 좋아요를 눌렀나요?
	private int plNum;
	
	// 좋아요 개수 가져오기
	private int likeCount;
	
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
	public String getPhotoContent() {
		return photoContent;
	}
	public void setPhotoContent(String photoContent) {
		this.photoContent = photoContent;
	}
	public String getPhotoImage() {
		return photoImage;
	}
	public void setPhotoImage(String photoImage) {
		this.photoImage = photoImage;
	}
	public String getPhotoLocation() {
		return photoLocation;
	}
	public void setPhotoLocation(String photoLocation) {
		this.photoLocation = photoLocation;
	}

	
	public int getPhotoReadcount() {
		return photoReadcount;
	}
	public void setPhotoReadcount(int photoReadcount) {
		this.photoReadcount = photoReadcount;
	}
	public Timestamp getPhotoDate() {
		return photoDate;
	}
	public void setPhotoDate(Timestamp photoDate) {
		this.photoDate = photoDate;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getPlNum() {
		return plNum;
	}
	public void setPlNum(int plNum) {
		this.plNum = plNum;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	
}
