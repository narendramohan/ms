package com.ms.spring.service;

import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;
import com.ms.spring.model.UserAccess;

public interface UserService {
	public static final String ACCESS_GRANTED = "Access Granted";
	public boolean authenticate(LoginForm loginForm);

	public boolean isUserExists(String userName);

	public void addUser(User user);

	public User findUserByUserName(String userId);
	
	public void requstUserAccess(String userName);
	public boolean isAlreadyRequested(String userName);
	public void modifyUserAccess(String userName, String access);
	public boolean isUserHasAccess(String userName);

}
