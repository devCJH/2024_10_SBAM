package com.example.demo.util;

public class Util {
	public static boolean isEmpty(String str) {
		
		if (str == null) {
			return true;
		}
		
		return str.trim().length() == 0;
	}
}
