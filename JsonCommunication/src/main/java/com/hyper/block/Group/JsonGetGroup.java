package com.hyper.block.Group;

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
import com.hyper.block.ServerAddress;

public class JsonGetGroup extends ServerAddress{

	private String baseUrl = ipAddr+"Group";
	
	public JsonArray GetGroup() {	
		JsonArray jsonArray = null;	
		try {	
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
			return  jsonArray;
			
		}catch (MalformedURLException e) {
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
		
		return jsonArray;
	}
	
	public JsonObject GetGroupById(String id) {
		JsonObject object = null;
		try {
			URL url = new URL(baseUrl+"/"+id);
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
		return object;
	}
}
