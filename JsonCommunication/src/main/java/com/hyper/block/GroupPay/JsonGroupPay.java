package com.hyper.block.GroupPay;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public interface JsonGroupPay {
	public final String ipAddr = "http://localhost:3000/api/";
	public GroupPayModel getParser(JsonObject object) throws Exception;
	public JsonArray GetGroupPay() throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public JsonObject GetGroupPayByName(String name) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public String GroupPayPost(GroupPayModel model) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
}
