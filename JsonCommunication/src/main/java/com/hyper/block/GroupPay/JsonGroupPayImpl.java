package com.hyper.block.GroupPay;

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

public class JsonGroupPayImpl implements JsonGroupPay {

	private String baseUrl = ipAddr + "GroupPay";

	public GroupPayModel getParser(JsonObject object) {
		GroupPayModel model = new GroupPayModel();

		String payClass = object.get("$class").getAsString();
		String groupName = object.get("groupName").getAsString();
		int pay = object.get("pay").getAsInt();
		int participantNum = object.get("participantNum").getAsInt();
		int nowPay = object.get("nowPay").getAsInt();

		model.setPayClass(payClass);
		model.setGroupName(groupName);
		model.setPay(pay);
		model.setParticipantNum(participantNum);
		model.setNowPay(nowPay);

		return model;
	}

	public JsonArray GetGroupPay()
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

	public JsonObject GetGroupPayByName(String name)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {
		JsonObject object = null;
		URL url = new URL(baseUrl + "/" + name);
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

	public String GroupPayPost(GroupPayModel model)
			throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception {
		URL url = new URL(baseUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestMethod("POST");

		// 데이터
		JsonObject data = new JsonObject();
		data.addProperty("$class", model.getPayClass());
		data.addProperty("groupName", model.getGroupName());
		data.addProperty("pay", model.getPay());
		data.addProperty("participantNum", model.getParticipantNum());
		data.addProperty("nowPay", model.getNowPay());

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