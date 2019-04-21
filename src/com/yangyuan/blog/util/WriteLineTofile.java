package com.yangyuan.blog.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;


public class WriteLineTofile {
	 public static void execute(String line,String FilePath){
		    File file = new File(FilePath);
		        try {
		            file.createNewFile();
		        } catch (IOException ex) {
		        }
		        try {
		            PrintStream ps = new PrintStream(new FileOutputStream(file));
		            String newStr="";
		             try {  
		                  newStr = new String(line.getBytes(), "UTF-8");
		             } catch (UnsupportedEncodingException ex) {
		             }
		           
		            ps.print(newStr);
		        } catch (FileNotFoundException ex) {
		        }
		    }
}
