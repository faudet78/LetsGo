package com.site.covoiturage.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.site.covoiturage.model.User;
import com.site.covoiturage.services.UserService;

@Controller
@RequestMapping("/test")
public class InscriptionController {

	@Autowired
	private UserService userService;
	/*
	 * @RequestMapping public String showInscription() { return "inscription"; }
	 */

	@ModelAttribute("user")
	public User constructUser() {
		return new User();
	}

	@RequestMapping(method = RequestMethod.POST)
	private String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "/inscription";
		}
		userService.save(user);
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/annonces";
	}

	/*
	 * un test avec
	 * http://localhost:8080/siteCovoiturage/inscription/available?username
	 * =azeredudu pour savoir si l'utilisateur est disponible ou pas
	 */@RequestMapping("/available")
	@ResponseBody
	public String available(@RequestParam String username) {
		Boolean available = userService.findByUsername(username) == null;
		return available.toString();

	}

}
