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

	@Override
	public User findUserByUserName(String userId) {
		return userDao.findUserByUserName(userId);
	}

	@Override
	public void requstUserAccess(String userName) {
		userDao.requstUserAccess(userName);
		
	}

	@Override
	public boolean isAlreadyRequested(String userName) {
		return userDao.isAlreadyRequested(userName);
		
	}

	@Override
	public void modifyUserAccess(String userName, String access) {
		userDao.modifyUserAccess(userName, access);
		
	}

}
