package com.hyper.block.Group;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class JsonGroupImpl implements JsonGroup {

	private String baseUrl = ipAddr + "Group";

	public GroupModel getParser(JsonObject object) {
		GroupModel model = new GroupModel();

		String GroupClass = object.get("$class").getAsString();
		String groupName = object.get("groupName").getAsString();
		String userEmail = object.get("userEmail").getAsString();
		String account = object.get("account").getAsString();
		Boolean state = object.get("state").getAsBoolean();
		String oauth = object.get("oauth").getAsString();

		model.setGroupClass(GroupClass);
		model.setGroupName(groupName);
		model.setUserEmail(userEmail);
		model.setAccount(account);
		model.setState(state);
		model.setOauth(oauth);

		return model;
	}

	public JsonArray GetGroup()
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {
		JsonArray jsonArray = null;
		URL url = new URL(baseUrl);
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
		return jsonArray;
	}

	public JsonObject GetGroupByEmail(String email)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {

		JsonObject object = null;
		URL url = new URL(baseUrl + "/" + email);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		// 응답
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}

		JsonParser jsonParser = new JsonParser();

		object = (JsonObject) jsonParser.parse(response.toString());
		in.close();
		return object;
	}

	public String GroupPost(GroupModel model)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {
		URL url = new URL(baseUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestMethod("POST");

		// 데이터
		JsonObject data = new JsonObject();
		data.addProperty("$class", model.getGroupClass());
		data.addProperty("groupName", model.getGroupName());
		data.addProperty("userEmail", model.getUserEmail());
		data.addProperty("account", model.getAccount());
		data.addProperty("state", model.getState());
		data.addProperty("oauth", model.getOauth());

		// 전송
		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(data.toString());
		wr.flush();

		// 응답
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		return response.toString();
	}
}
