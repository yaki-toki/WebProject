package com.hyper.block.Group;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public interface JsonGroup{
	public final String ipAddr = "http://localhost:3000/api/";
	public GroupModel getParser(JsonObject object) throws Exception;
	public JsonArray GetGroup() throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public JsonObject GetGroupById(String email) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	public String dataPost(GroupModel model) throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
}
