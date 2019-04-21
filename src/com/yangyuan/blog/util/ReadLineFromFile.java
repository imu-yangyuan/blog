package com.yangyuan.blog.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class ReadLineFromFile {
public static String  execute(String filePath) {
	try {
		BufferedReader bufferedReader=new BufferedReader(new FileReader(filePath));
		return bufferedReader.readLine();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}
public static void main(String[] args) {
	System.out.println(execute(""));
}
}
