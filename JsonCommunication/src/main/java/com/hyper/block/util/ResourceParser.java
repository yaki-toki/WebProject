package com.hyper.block.util;

public class ResourceParser {
	public String nameParser(String name) {
		
		name = name.substring(name.lastIndexOf("#") + 1);
		
		return name;
	}
}
