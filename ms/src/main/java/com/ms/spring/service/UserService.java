package com.ms.spring.service;

import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;

public interface UserService {

	public boolean authenticate(LoginForm loginForm);

	public boolean isUserExists(String userName);

	public void addUser(User user);

	public User findUserByUserName(String userId);

}
