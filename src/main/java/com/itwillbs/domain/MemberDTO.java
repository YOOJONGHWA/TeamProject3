package com.itwillbs.domain;

public class MemberDTO {
	// 회원가입 한 내용을 담아서 전달해주는 바구니
	// 멤버변수 => 접근 제한 => 데이터 은닉
	
   private String userId;		// 아이디
   private String userPass;		// 비밀번호
   private String userName;		// 이름
   private String userBirth;	// 생일
   private String userGender;	// 성별
   private String userEmail;	// 이메일
   private String userPhone;	// 폰번호
   private String userAddress;  // 주소
   
   private String userSport;	// 관심 스포츠
   private String userArea;		// 관심지역
   private int userPoint;		// 포인트
   
   
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getUserPass() {
	return userPass;
}
public void setUserPass(String userPass) {
	this.userPass = userPass;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserGender() {
	return userGender;
}
public String getUserBirth() {
	return userBirth;
}
public void setUserBirth(String userBirth) {
	this.userBirth = userBirth;
}
public void setUserGender(String userGender) {
	this.userGender = userGender;
}
public String getUserEmail() {
	return userEmail;
}
public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}
public String getUserPhone() {
	return userPhone;
}
public void setUserPhone(String userPhone) {
	this.userPhone = userPhone;
}
public String getUserAddress() {
	return userAddress;
}
public void setUserAddress(String userAddress) {
	this.userAddress = userAddress;
}
public String getUserSport() {
	return userSport;
}
public void setUserSport(String userSport) {
	this.userSport = userSport;
}
public String getUserArea() {
	return userArea;
}
public void setUserArea(String userArea) {
	this.userArea = userArea;
}
public int getUserPoint() {
	return userPoint;
}
public void setUserPoint(int userPoint) {
	this.userPoint = userPoint;
}
   
  		
	
	
	   

   

}
