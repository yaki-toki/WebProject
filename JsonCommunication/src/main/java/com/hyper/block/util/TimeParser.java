package com.hyper.block.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class TimeParser {
	
	public String UTCParser(String timestamp) throws ParseException {
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
		
		return time;
	}
}
