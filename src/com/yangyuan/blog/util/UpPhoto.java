package com.yangyuan.blog.util;
import java.io.File;
import java.io.IOException;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

public class UpPhoto {
	 private final String ACCESS_KEY = "XXX"; 
	 private final String SECRET_KEY = "XXX";  
	 private final String bucketname = "oldbook"; 
	 private  Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);  
	 private UploadManager uploadManager = new UploadManager();  

	    
	     
	    //普通上传  
	    public  boolean upload(File file,String key) {  
	    	String token=auth.uploadToken(bucketname);
	      try {  
	        //调用put方法上传  
	        Response res = uploadManager.put(file, key, token);  
	        System.out.println(res.isOK());
	        //打印返回的信息  
	        System.out.println(res.bodyString());   
	        if(res.isOK()) {
	        	return res.isOK(); 
	        }
	        } catch (QiniuException e) {  
	            Response r = e.response;  
	            // 请求失败时打印的异常的信息  
	            System.out.println(r.toString());  
	            try {  
	                //响应的文本信息  
	              System.out.println(r.bodyString());  
	            } catch (QiniuException e1) {  
	                //ignore  
	            }  
	        }
		return false;         
	    }  
}
