package com.yangyuan.blog.action;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qiniu.http.Response;
import com.yangyuan.blog.entity.User;
import com.yangyuan.blog.service.UserService;
import com.yangyuan.blog.util.IDTools;


@Controller
@RequestMapping("/user")
public class UserAction extends BaseAction {
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/login")
	public String login(User user,HttpServletRequest request,HttpSession session,Model model,HttpServletResponse response){
		System.out.println("---action.user:"+user);
		User userResult= userService.login(user);
		//System.out.println((User)session.getAttribute("user"));
		if(userResult!=null){
			//存session
			userResult.setUserPassword("00000");
			session.setAttribute("user", userResult);
			System.out.println(userResult);
			//model.addAttribute("msg", "12334");
			Cookie cookie=new Cookie("msg1", "hhhhhh");
			response.addCookie(cookie);
			//System.out.println((User)session.getAttribute("user"));
			//request.setAttribute("user",user);
		//return "forward:/WEB-INF/index.jsp";
			return "redirect:/index.action";
		}else{
			model.addAttribute("msg", "用户名或密码错误！");
			//request.setAttribute("msg", "用户名或密码错误！");
			return "forward:/login.jsp";
		}
	}
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/index.action";
	}
	@RequestMapping("register")
	public String register(User user,HttpSession session){
		try {
			user.setUserPhoto("");
			user.setUserId(IDTools.getId());
			userService.insert(user);
			user.setUserPassword("");
			session.setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "forward:/register.jsp";
		}
		return "redirect:/index.action";
	}
}
