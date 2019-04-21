package com.yangyuan.blog.entity;

import java.security.Timestamp;
import java.util.Date;

public class AccessLog {
	 private Date accessTime;
//	private Timestamp accessTime;
	private String ipAddress;

	private String location;

	private String userAgent;

	 public Date getAccessTime() {
	 return accessTime;
	 }
	
	 public void setAccessTime(Date accessTime) {
	 this.accessTime = accessTime;
	 }
/*	public Timestamp getAccessTime() {
		return accessTime;
	}

	public void setAccessTime(Timestamp accessTime) {
		this.accessTime = accessTime;
	}*/

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
}