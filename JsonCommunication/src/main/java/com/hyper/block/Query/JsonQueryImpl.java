package com.hyper.block.Query;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

public class JsonQueryImpl implements JsonQuery{
	
	public int SelectUserEmail(String userEmail) throws MalformedURLException, IOException {
		JsonArray jsonArray = null;
		String queries = ipAddr+"/SelectUserEmail?userEmail="+userEmail;
		URL url = new URL(queries);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		// 응답
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		JsonParser jsonParser = new JsonParser();
		jsonArray = (JsonArray) jsonParser.parse(response.toString());
		in.close();
		
		return jsonArray.size();
	}
}
