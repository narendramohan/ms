package com.ms.spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ms.spring.model.User;
public class LoginValidator implements Validator{


	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return User.class.isAssignableFrom(arg0);
	}


	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userId",
				"required.userName", "User id is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password",
				"required.password", "Password is required.");
		
	}
	

}
