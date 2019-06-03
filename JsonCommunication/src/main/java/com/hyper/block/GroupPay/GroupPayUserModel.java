package com.hyper.block.GroupPay;

public class GroupPayUserModel {
	
	private String userClass;
	private String accoutant;
	private String normal;
	private String groupPay;
	private String transactionId;
	private String timestamp;
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	public String getAccoutant() {
		return accoutant;
	}
	public void setAccoutant(String accoutant) {
		this.accoutant = accoutant;
	}
	public String getNormal() {
		return normal;
	}
	public void setNormal(String normal) {
		this.normal = normal;
	}
	public String getGroupPay() {
		return groupPay;
	}
	public void setGroupPay(String groupPay) {
		this.groupPay = groupPay;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
}
