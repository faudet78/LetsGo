package com.site.covoiturage.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public ModelAndView getLoginForm(@RequestParam(required = false) String authfailed, String logout, String denied) {
		String message = "";
		if (authfailed != null) {
			message = "Username or password incorrect, try again!";
		} else if (logout != null) {
			message = "Successfully logged out!";
		} else if (denied != null) {
			message = "Access denied";
		}

		return new ModelAndView("login", "message", message);
	}

	@RequestMapping("/403page")
	public String get403page() {
		return "redirect:login?denied";
	}

}
