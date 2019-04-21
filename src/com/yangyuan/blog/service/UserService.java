package com.yangyuan.blog.service;

import com.yangyuan.blog.entity.User;

public interface UserService  extends BaseService<User>{
public User login(User user);
}
