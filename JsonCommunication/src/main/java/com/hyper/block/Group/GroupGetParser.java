package com.hyper.block.Group;

import com.google.gson.JsonObject;

public class GroupGetParser {
	public GroupModel getParser(JsonObject object) {
		
		GroupModel model = new GroupModel();
		
		String GroupClass = object.get("$class").getAsString();
		String groupName = object.get("groupName").getAsString();
		String userEmail = object.get("userEmail").getAsString();
		String account = object.get("account").getAsString();
		Boolean state = object.get("state").getAsBoolean();
		String oauth = object.get("oauth").getAsString();
		
		model.setGroupClass(GroupClass);
		model.setGroupName(groupName);
		model.setUserEmail(userEmail);
		model.setAccount(account);
		model.setState(state);
		model.setOauth(oauth);
		
		return model;
	}
}
