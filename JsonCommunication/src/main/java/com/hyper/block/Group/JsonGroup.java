package com.hyper.block.Group;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hyper.block.ServerAddress;

public interface JsonGroup{
	public final String ipAddr = ServerAddress.ipAddr;
	public GroupModel getParser(JsonObject object) throws Exception;
	public JsonArray GetGroup() throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public JsonObject GetGroupByEmail(String email) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public String GroupPost(GroupModel model) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
}
