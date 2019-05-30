package com.hyper.block.SendMoney;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class SendMoneyModel {
	private String moneyClass;
	private String accoutant;
	private String normal;
	private String groupPay;
	private String transactionId;
	private String timestamp;
	
	public String getMoneyClass() {
		return moneyClass;
	}
	public void setMoneyClass(String moneyClass) {
		this.moneyClass = moneyClass;
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
	public void setTimestamp(String timestamp) throws ParseException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		Calendar cal = Calendar.getInstance();
		String time = null;
		
		timestamp = timestamp.replaceAll("T", " ");
		timestamp = timestamp.replaceAll("Z", "");

		Date to = sdf.parse(timestamp);
		cal.setTime(to);

		cal.add(Calendar.HOUR, 9);
		time = sdf.format(cal.getTime());
		
		this.timestamp = time;
	}
}