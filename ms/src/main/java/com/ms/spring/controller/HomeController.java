package com.ms.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ms.spring.model.UserBean;
import com.ms.spring.controller.HomeController;
import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;
import com.ms.spring.service.UserService;
import com.ms.spring.validator.LoginValidator;

@Controller
public class HomeController {
	List<User> users = new ArrayList<User>();
	@Resource(name = "userService")
	private UserService userService;
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	
	@RequestMapping(value="/", method={RequestMethod.GET, RequestMethod.POST})
	public String home(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		String userName = (String) session.getAttribute("userName");
		if(userName==null || "".equals(userName)){
			return "login";
		}
		else return "home";
	}
	@RequestMapping(value="/home", method={RequestMethod.GET, RequestMethod.POST})
	public String home1(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		String userName = (String) session.getAttribute("userName");
		if(userName==null || "".equals(userName)){
			return "login";
		}
		else return "home";
	}	
	
	@RequestMapping(value="/login", method={RequestMethod.GET, RequestMethod.POST})
	public String login(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		String userName = (String) session.getAttribute("userName");
		if(userName==null || "".equals(userName)){
			return "login";
		}
		else return "home";
	}	
	/**
	 * 
	 * @param error
	 * @param model
	 * @param loginForm
	 * @param model1
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/authenticate")
	public String authenticate(@RequestParam(value="error", required=false) boolean error, ModelMap model, LoginForm loginForm,
			BindingResult model1, HttpServletRequest request, HttpSession session) {
		String submit = request.getParameter("submit");
		logger.debug("submit: "+submit);
		if(session==null || request.isRequestedSessionIdValid())
			session = request.getSession(true);

		User user1 = (User)session.getAttribute("user");
		if(user1!=null)
			return "redirect:home";
		if(submit!=null) {
		LoginValidator validator = new LoginValidator();
			validator.validate(loginForm, model1);
		}
		
		if(model1.hasErrors()){
            loginForm.setUserId("");
            loginForm.setPassword("");
            logger.debug(model1.getAllErrors().toString());
            
            return "redirect:login";
        } else if (loginForm.getUserId() != null && loginForm.getPassword() != null) {
			boolean isAuthentic = userService.authenticate(loginForm);
			logger.debug(isAuthentic+"");
			
			if (isAuthentic) {
				
					session = request.getSession(true);
					User user = userService.findUserByUserName(loginForm.getUserId());
					session.setAttribute("user", user);
					session.setAttribute("userName", loginForm.getUserId());
					session.setAttribute("fullName", user.getFirstName()+" "+user.getLastName());	
					return "redirect:home";
			} else {
				
				model.addAttribute("error", "You have entered an invalid username or password!");				
			}
		}
		return "redirect:login";
	}
	
	
	/**
	 * Handles and retrieves the denied JSP page. This is shown whenever a regular user
	 * tries to access an admin only page.
	 * 
	 * @return the name of the JSP page
	 */
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
 	public String getDeniedPage() {
		logger.debug("Received request to show denied page");
		
		// This will resolve to /WEB-INF/jsp/deniedpage.jsp
		return "deniedpage";
	}
	@RequestMapping(value = "/register", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView registerUser(@RequestParam(value="error", required=false) boolean error, ModelMap model, @ModelAttribute("command") User user,
			BindingResult result) {
		
		user.setType(0);
		try {
			if(user.getUserName()==null) {
				user = new User();
				model.addAttribute("user", user);
				return new ModelAndView("register");
			}
			boolean exists = userService.isUserExists(user.getUserName());
			if(exists) {
				user = new User();
				model.addAttribute("error", "User already exists.");
				model.addAttribute("user", user);
				return new ModelAndView("register");	
			} else {
				
				userService.addUser(user);
				return new ModelAndView("redirect:registerSuccess");
			}
			
		} catch(Exception e){
			e.printStackTrace();
			return new ModelAndView("redirect:registerFailure");
		}
		
	}
	@RequestMapping(value = "/registerSuccess")
	public String registerSuccess(Model model,HttpSession session, LoginForm loginForm) {
		session.invalidate();
		return "/registerSuccess";
	}
	
	@RequestMapping(value = "/registerFailure")
	public String registerFailure(Model model,HttpSession session, LoginForm loginForm) {
		session.invalidate();
		return "/registerFailure";
	}	
	
	@RequestMapping(value = "/logout")
	public String logout(Model model,HttpSession session, LoginForm loginForm) {
		session.invalidate();
		return "/login";
	}
}
