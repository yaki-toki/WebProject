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

import com.google.gson.JsonObject;
import com.hyper.block.ServerAddress;

public class GroupPostMethod  extends ServerAddress{
	
	public String dataPost(GroupModel model) {
		try {
			URL url = new URL(ipAddr+"Group");
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
			
			System.out.println(data);
			
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
			System.out.println(response.toString());
			in.close();
			return response.toString();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
