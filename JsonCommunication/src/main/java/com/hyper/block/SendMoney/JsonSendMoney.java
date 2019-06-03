package com.hyper.block.SendMoney;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hyper.block.ServerAddress;

public interface JsonSendMoney {
	public final String ipAddr = ServerAddress.ipAddr;
	public SendMoneyModel getParser(JsonObject object) throws Exception;
	public JsonArray GetSendMoney() throws MalformedURLException, ProtocolException, UnsupportedEncodingException, IOException, Exception;
	
}
