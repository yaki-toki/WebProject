package com.hyper.block.Query;

import java.io.IOException;
import java.net.MalformedURLException;

import com.hyper.block.ServerAddress;

public interface JsonQuery {
	public final String ipAddr = ServerAddress.ipAddr+"queries/";
	public int SelectUserEmail(String userEmail) throws MalformedURLException, IOException;
}
