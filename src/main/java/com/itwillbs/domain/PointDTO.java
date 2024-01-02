package com.itwillbs.domain;

import java.sql.Timestamp;

public class PointDTO {
	
	private int pointNum;
	private String userId;
	private Timestamp pointDate;  
	private int pointBalance;	// 포인트 잔고(시작은 0)
	private int pointUsed;		// 사용한 포인트
	private String pointType;	// 포인트 유현(적립/사용)
	
	
	public int getPointNum() {
		return pointNum;
	}
	public void setPointNum(int pointNum) {
		this.pointNum = pointNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getPointDate() {
		return pointDate;
	}
	public void setPointDate(Timestamp pointDate) {
		this.pointDate = pointDate;
	}
	public int getPointBalance() {
		return pointBalance;
	}
	public void setPointBalance(int pointBalance) {
		this.pointBalance = pointBalance;
	}
	public int getPointUsed() {
		return pointUsed;
	}
	public void setPointUsed(int pointUsed) {
		this.pointUsed = pointUsed;
	}
	public String getPointType() {
		return pointType;
	}
	public void setPointType(String pointType) {
		this.pointType = pointType;
	}
	
	
	
	
	
	
	
}           
             