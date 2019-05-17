package com.hyper.block.GroupPay;

public class GroupPayModel {
	private String payClass;
	private String groupName;
	private int pay;
	private int participantNum;
	private int nowPay;
	
	public String getPayClass() {
		return payClass;
	}
	public void setPayClass(String payClass) {
		this.payClass = payClass;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getParticipantNum() {
		return participantNum;
	}
	public void setParticipantNum(int participantNum) {
		this.participantNum = participantNum;
	}
	public int getNowPay() {
		return nowPay;
	}
	public void setNowPay(int nowPay) {
		this.nowPay = nowPay;
	}
}
