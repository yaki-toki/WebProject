package com.hyper.block.Group;

public class GroupModel {
	private String groupClass;
	private String groupName;
	private String userEmail;
	private String account;
	private Boolean state;
	private String oauth;
	
	public GroupModel() {}
	
	public String getGroupClass() {
		return groupClass;
	}
	public void setGroupClass(String groupClass) {
		this.groupClass = groupClass;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Boolean getState() {
		return state;
	}
	public void setState(Boolean state) {
		this.state = state;
	}
	public String getOauth() {
		return oauth;
	}
	public void setOauth(String oauth) {
		this.oauth = oauth;
	}
}
