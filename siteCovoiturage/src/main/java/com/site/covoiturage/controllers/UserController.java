package com.site.covoiturage.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.site.covoiturage.model.Annonce;
import com.site.covoiturage.services.AnnonceService;
import com.site.covoiturage.services.UserService;

@Controller
@RequestMapping("/posterAnnonce")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private AnnonceService annonceService;

	@ModelAttribute("annonce")
	public Annonce constructAnnonce() {
		return new Annonce();
	}

	@RequestMapping
	public String getAnnoncePage(Principal principal, Model model) {
		if (principal != null) {
			String user = principal.getName();
			model.addAttribute("user", user);
		}
		return "poster-annonce";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String saveAnnonce(@Valid @ModelAttribute("annonce") Annonce annonce, BindingResult result,
			RedirectAttributes redirectAttributes, Principal principal, Model model) {

		if (result.hasErrors()) {
			return "poster-annonce";
		}
		String username = principal.getName();
		annonceService.save(annonce, username);
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/poster-annonce";
	}

	/*
	 * @RequestMapping( value = "/user" ) public String user( Model model,
	 * Principal principal ) { String username = principal.getName();
	 * model.addAttribute( "user", userService.findByUsername( username ) );
	 * return "index"; }
	 */
}
