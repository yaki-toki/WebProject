package com.hyper.block.GroupPay;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.text.ParseException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hyper.block.ServerAddress;

public interface JsonGroupPay {
	public final String ipAddr = ServerAddress.ipAddr;
	public GroupPayModel getParser(JsonObject object) throws Exception;
	public GroupPayUserModel getUserParser(JsonObject object) throws ParseException;
	public JsonArray GetGroupPay() throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public JsonObject GetGroupPayByName(String name) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public String GroupPayPost(GroupPayModel model) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
}
