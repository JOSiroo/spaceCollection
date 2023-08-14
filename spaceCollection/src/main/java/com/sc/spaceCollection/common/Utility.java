package com.sc.spaceCollection.common;

public class Utility {
	public static String getFileInfo(String originalFileName,long fileSize) {
		String result="";
		double size=fileSize/1000.0; //3.15789
		size=Math.round(size*100)/100.0;
		result=originalFileName+"( "+size+" KB)";

		return result;
	}



}
