package com.yangyuan.blog.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yangyuan.blog.entity.User;

@Controller
public class PhotoAction {
	public PhotoAction() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "/test")
	public String test(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("---action.user:");
		System.out.println(request.getParameter("tt"));
		Cookie[] cookies = request.getCookies();
		/*
		 * for (int i = 0; i < cookies.length; i++) {
		 * System.out.println(cookies[
		 * i].getName()+" getComment"+cookies[i].getComment
		 * ()+" "+cookies[i].getValue()+" getDomain"+cookies[i].getDomain()
		 * +" "+"getPath "+cookies[i].getPath()
		 * +" getVersion"+cookies[i].getVersion()
		 * +" getSecure"+cookies[i].getSecure() );
		 * 
		 * //JSESSIONID getCommentnull 954FD0400DEA8AB5E59A98915D939398
		 * getDomainnull getPath null getVersion0 getSecurefalse //userName
		 * getCommentnull yyyyyyy getDomainnull getPath null getVersion0
		 * getSecurefalse }
		 */
		if (cookies !=null) {
			for (Cookie cookie : cookies) {
				System.out.println(cookie.getName() + " " + cookie.getValue() + " "
						+ cookie.getMaxAge());
			}
		}
		
		//request.getSession(true).setAttribute("userName", "12314141");
		System.out.println(request.getSession().getAttribute("userName"));
		return "forward:/login.jsp";
	}
	@RequestMapping(value = "/test1")
	public String test(String ttt, HttpServletResponse response) {
		System.out.println(ttt);
		//能够实现主动把提交的ttt的值赋到ttt这个变量中。
		return "forward:/login.jsp";
	}
}
