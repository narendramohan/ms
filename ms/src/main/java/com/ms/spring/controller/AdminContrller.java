package com.ms.spring.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import client.request;

import com.ms.spring.dao.UserRepository;
import com.ms.spring.model.CipheredKeyword;
import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;
import com.ms.spring.service.UserService;
import com.ms.spring.vo.ViewPage;

@Controller
public class AdminContrller {

	
	@RequestMapping(value="/createuser")
	public String createUser(HttpSession session, HttpServletRequest request){
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1){
			user = new User();
			request.setAttribute("user", user);
			return "createuser";
		} else return "redirect:home";
		
	}
	
	@RequestMapping(value="/useraccess")
	public String userAccess(HttpSession session,HttpServletRequest request){
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1){
			request.setAttribute("user", user);
			return "useraccess";
		} else return "redirect:home";		
	}
	
	@Resource
	UserRepository userRepository;
	@RequestMapping(value="/listuser")
	public @ResponseBody ViewPage<User> listUser(HttpSession session, Pageable page){
		return new ViewPage<User>( userRepository.findAll(page));		
	}
	@Resource(name = "userService")
	private UserService userService;
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	@RequestMapping(value = "/saveuser", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String saveUser(@RequestParam(value="error", required=false) boolean error, ModelMap model, @ModelAttribute("command") User user,
			BindingResult result) {
		
		try {
			
			boolean exists = userService.isUserExists(user.getUserName());
			if(exists) {
				user = new User();
				model.addAttribute("error", "User already exists.");
				model.addAttribute("user", user);
				return "User Already exists";	
			} else {
				
				userService.addUser(user);
				return "User saved successfully!";
			}
			
		} catch(Exception e){
			e.printStackTrace();
			return "there are some error saving user.";
		}
		
	}
	
	
	@RequestMapping(value="/grantaccess")
	public String grantAccess(HttpSession session,HttpServletRequest request){
		
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1){
			String userName1 = request.getParameter("userName");
			userService.modifyUserAccess(userName1, userService.ACCESS_GRANTED);
			request.setAttribute("user", user);
			return "redirect:useraccess";
		} else return "redirect:home";		
	}

	
	@RequestMapping(value="/denyaccess")
	public String denyAccess(HttpSession session,HttpServletRequest request){
		
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1){
			String userName1 = request.getParameter("userName");
			userService.modifyUserAccess(userName1, "Access Denied");
			request.setAttribute("user", user);
			return "redirect:useraccess";
		} else return "redirect:home";		
	}

}


