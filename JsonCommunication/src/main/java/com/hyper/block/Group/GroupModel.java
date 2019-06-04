package com.hyper.block.Group;

import java.util.ArrayList;

public class GroupModel {
	private String groupClass;
	private ArrayList<String> groupName;
	private ArrayList<Boolean> groupState;
	private ArrayList<String> groupAccount;
	private String userEmail;
	
	public String getGroupClass() {
		return groupClass;
	}
	public void setGroupClass(String groupClass) {
		this.groupClass = groupClass;
	}
	public ArrayList<String> getGroupName() {
		return groupName;
	}
	public void setGroupName(ArrayList<String> groupName) {
		this.groupName = groupName;
	}
	public ArrayList<Boolean> getGroupState() {
		return groupState;
	}
	public void setGroupState(ArrayList<Boolean> groupState) {
		this.groupState = groupState;
	}
	public ArrayList<String> getGroupAccount() {
		return groupAccount;
	}
	public void setGroupAccount(ArrayList<String> groupAccount) {
		this.groupAccount = groupAccount;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
}
