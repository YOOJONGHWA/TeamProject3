package com.itwillbs.domain;

import com.google.protobuf.Timestamp;

// 주문정보DB
public class OrderInfoDTO {

	private int ordNum;
	private String companyId;
	private String userId;
	private String ordGetPhone;
	private String ordGetName;
	private Timestamp ordDate;
	private String payMethod;
	private int ordTotalPrice;
	private int usedPoint;
	private String ordStatus;
	
	// 만들어내는 값
	private int savePoint;
	
	public int getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrdGetPhone() {
		return ordGetPhone;
	}
	public void setOrdGetPhone(String ordGetPhone) {
		this.ordGetPhone = ordGetPhone;
	}
	public String getOrdGetName() {
		return ordGetName;
	}
	public void setOrdGetName(String ordGetName) {
		this.ordGetName = ordGetName;
	}
	public Timestamp getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Timestamp ordDate) {
		this.ordDate = ordDate;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getOrdTotalPrice() {
		return ordTotalPrice;
	}
	public void setOrdTotalPrice(int ordTotalPrice) {
		this.ordTotalPrice = ordTotalPrice;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public String getOrdStatus() {
		return ordStatus;
	}
	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}
	
	public int getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}
	
	@Override
	public String toString() {
		return "OrderInfoDTO [ordNum=\" + ordNum + \", companyId=\" + companyId + \", userId=\" + userId\r\n"
				+ "				+ \", ordGetPhone=\" + ordGetPhone + \", ordGetName=\" + ordGetName + \", ordDate=\" + ordDate\r\n"
				+ "				+ \", payMethod=\" + payMethod + \", ordTotalPrice=\" + ordTotalPrice + \", usedPoint=\" + usedPoint "
				+ "				+ \", ordStatus=\" + ordStatus + \", savePoint=\" + savePoint + \"]";
	}
	
	public void ordTotal() {
		
//		this.ordTotalPrice = this.salePrice*this.bookCount;
//		this.point = (int)(Math.floor(this.salePrice*0.05));
		
	}
	
	
	
	
	
}
