package com.hyper.block.SendMoney;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class JsonSendMoneyImpl implements JsonSendMoney {
	private String baseUrl = ipAddr + "SendMoney";

	public SendMoneyModel getParser(JsonObject object) throws Exception {
		SendMoneyModel model = new SendMoneyModel();

		model.setMoneyClass(object.get("$class").getAsString());
		model.setAccoutant(object.get("accoutant").getAsString());
		model.setNormal(object.get("normal").getAsString());
		model.setGroupPay(object.get("groupPay").getAsString());
		model.setTransactionId(object.get("transactionId").getAsString());
		model.setTimestamp(object.get("timestamp").getAsString());

		return model;
	}

	public JsonArray GetSendMoney()
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
}
