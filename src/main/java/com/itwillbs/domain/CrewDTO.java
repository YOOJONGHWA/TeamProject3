package com.itwillbs.domain;

import java.sql.Timestamp;

public class CrewDTO {

	private int crewNum;			// 게시글 고유번호
	private String userId;			// user_info user_id
	private String actTitle;		// activity act_title
	private String actCategory;		// activity act_category
	private String actLocation;		// activity activity act_location
	private String crewSubject;		// 게시글 제목
	private String crewContent;		// 게시글 내용
	private int crewReadcount;		// 게시글 조회수
	private Timestamp crewDate;		// 게시글 작성일자
	private String crewStatus;		// "모집 상태 모집중(Y) / 모집완료(N)"
	
	// 댓글 개수 가져오기
	private int replyCount;
	
	// 현재 사용자가 좋아요를 눌렀나요?
	private int clNum;
	
	// 좋아요 개수 가져오기
	private int likeCount;
	
	private int actNum;
	private String companyName;
	
	

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

	public String getActTitle() {
		return actTitle;
	}

	public void setActTitle(String actTitle) {
		this.actTitle = actTitle;
	}

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

	public String getCrewSubject() {
		return crewSubject;
	}

	public void setCrewSubject(String crewSubject) {
		this.crewSubject = crewSubject;
	}

	public String getCrewContent() {
		return crewContent;
	}

	public void setCrewContent(String crewContent) {
		this.crewContent = crewContent;
	}

	public int getCrewReadcount() {
		return crewReadcount;
	}

	public void setCrewReadcount(int crewReadcount) {
		this.crewReadcount = crewReadcount;
	}

	public Timestamp getCrewDate() {
		return crewDate;
	}

	public void setCrewDate(Timestamp crewDate) {
		this.crewDate = crewDate;
	}

	public String getCrewStatus() {
		return crewStatus;
	}

	public void setCrewStatus(String crewStatus) {
		this.crewStatus = crewStatus;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getClNum() {
		return clNum;
	}

	public void setClNum(int clNum) {
		this.clNum = clNum;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getActNum() {
		return actNum;
	}

	public void setActNum(int actNum) {
		this.actNum = actNum;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Override
	public String toString() {
		return "CrewDTO [crewNum=" + crewNum + ", userId=" + userId + ", actTitle=" + actTitle + ", actCategory="
				+ actCategory + ", actLocation=" + actLocation + ", crewSubject=" + crewSubject + ", crewContent="
				+ crewContent + ", crewReadcount=" + crewReadcount + ", crewDate=" + crewDate + ", crewStatus="
				+ crewStatus + ", replyCount=" + replyCount + ", clNum=" + clNum + ", likeCount=" + likeCount
				+ ", actNum=" + actNum + ", companyName=" + companyName + "]";
	}



}
