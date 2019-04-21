package com.yangyuan.blog.dao;

import com.yangyuan.blog.entity.User;

public interface UserMapper extends BaseMapper<User> {

	public User login(User user);

}