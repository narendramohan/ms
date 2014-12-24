package com.ms.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.spring.dao.UserDao;
import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;
import com.ms.spring.service.UserService;

@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public boolean authenticate(LoginForm loginForm) {
		
		return userDao.authenticate(loginForm);
	}

	@Override
	public boolean isUserExists(String userName) {
		
		return false;
	}

	@Override
	public void addUser(User user) {
		userDao.addUser(user);

	}

}
