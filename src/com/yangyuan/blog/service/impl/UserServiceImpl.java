package com.yangyuan.blog.service.impl;

import org.springframework.stereotype.Service;

import com.yangyuan.blog.entity.User;
import com.yangyuan.blog.service.UserService;



@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userMapper.login(user);
	}
	
	
}
