package com.itwillbs.domain;

import java.sql.Timestamp;

// 결제에 들어가는 DB
public class OrderDTO {
	
	private int ordNum;
	private String ordCode;	// OrderInfo??
	private String userId;
	private int actNum;
	private int ordQuantity;
	private int ordPayPrice;
	private String payMethod; 
	private Timestamp ordDate;
	private String ordRefund;
	private String ordStatus;
	
	// OrderList 불러올 때
	private OrderInfoDTO infoDto;
	
	
	public int getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
	}
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getActNum() {
		return actNum;
	}
	public void setActNum(int actNum) {
		this.actNum = actNum;
	}
	public int getOrdQuantity() {
		return ordQuantity;
	}
	public void setOrdQuantity(int ordQuantity) {
		this.ordQuantity = ordQuantity;
	}
	public int getOrdPayPrice() {
		return ordPayPrice;
	}
	public void setOrdPayPrice(int ordPayPrice) {
		this.ordPayPrice = ordPayPrice;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Timestamp getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Timestamp ordDate) {
		this.ordDate = ordDate;
	}
	public String getOrdRefund() {
		return ordRefund;
	}
	public void setOrdRefund(String ordRefund) {
		this.ordRefund = ordRefund;
	}
	public String getOrdStatus() {
		return ordStatus;
	}
	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}
	public OrderInfoDTO getInfoDto() {
		return infoDto;
	}
	public void setInfoDto(OrderInfoDTO infoDto) {
		this.infoDto = infoDto;
	}
	

}
