package com.spring.example.db;

import java.sql.Date;

public class UserDTO {
	private String userEmail;
	private Boolean userState;
	private Date log_date;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Boolean getUserState() {
		return userState;
	}
	public void setUserState(Boolean userState) {
		this.userState = userState;
	}
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
}
