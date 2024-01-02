package com.itwillbs.domain;

import java.sql.Date;

public class ScheduleDTO {
	
	int scheduleIdx;
	int scheduleNum;
	String scheduleSubject;
	String scheduleDesc;
	Date scheduleDate;
	public int getScheduleIdx() {
		return scheduleIdx;
	}
	public void setScheduleIdx(int scheduleIdx) {
		this.scheduleIdx = scheduleIdx;
	}
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public String getScheduleSubject() {
		return scheduleSubject;
	}
	public void setScheduleSubject(String scheduleSubject) {
		this.scheduleSubject = scheduleSubject;
	}
	public String getScheduleDesc() {
		return scheduleDesc;
	}
	public void setScheduleDesc(String scheduleDesc) {
		this.scheduleDesc = scheduleDesc;
	}
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	
	
	@Override
	public String toString() {
		return "ScheduleDTO [scheduleIdx=" + scheduleIdx + ", scheduleNum=" + scheduleNum + ", scheduleSubject="
				+ scheduleSubject + ", scheduleDesc=" + scheduleDesc + ", scheduleDate=" + scheduleDate + "]";
	}
	
	
}
