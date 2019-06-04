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
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class JsonGroupImpl implements JsonGroup {

	private String baseUrl = ipAddr + "Group";

	public GroupModel getParser(JsonObject object) {
		GroupModel model = new GroupModel();

		String GroupClass = object.get("$class").getAsString();
		JsonArray groupName = object.get("groupName").getAsJsonArray();
		JsonArray groupState = object.get("groupState").getAsJsonArray();
		JsonArray groupAccount = object.get("groupAccount").getAsJsonArray();
		String userEmail = object.get("userEmail").getAsString();
		
		// 그룹 명 리스트
		ArrayList<String> name = new ArrayList<String>();
		for(int j = 0; j < groupName.size(); j++) {
			name.add(groupName.get(j).toString());
		}
		
		// 그룹별 해당 상태 리스트
		ArrayList<Boolean> state = new ArrayList<Boolean>();
		for(int j = 0; j < groupState.size(); j++) {
			state.add(groupState.get(j).getAsBoolean());
		}
		
		// 그룹별 해당 권한 리스트
		ArrayList<String> account = new ArrayList<String>();
		for(int i = 0; i < groupAccount.size(); i++) {
			account.add(groupAccount.get(i).toString());
		}
		
		model.setGroupClass(GroupClass);
		model.setGroupName(name);
		model.setGroupState(state);
		model.setGroupAccount(account);
		model.setUserEmail(userEmail);

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
		data.addProperty("userEmail", model.getUserEmail());

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
