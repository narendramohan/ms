package com.ms.spring.dao;

import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;

public interface UserDao {

	boolean authenticate(LoginForm loginForm);

	void addUser(User user);

	User findUserByUserName(String userId);

	void requstUserAccess(String userName);

	boolean isAlreadyRequested(String userName);

	void modifyUserAccess(String userName, String access);

}
