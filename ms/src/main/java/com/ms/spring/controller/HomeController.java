package com.ms.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value="/", method={RequestMethod.GET, RequestMethod.POST})
	public String home(HttpSession session){
		String userName = (String) session.getAttribute("userName");
		if(userName==null || "".equals(userName)){
			return "login";
		}
		else return "home";
	}

}
