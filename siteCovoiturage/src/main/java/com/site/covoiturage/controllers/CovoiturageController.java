package com.site.covoiturage.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.site.covoiturage.model.Annonce;
import com.site.covoiturage.model.User;
import com.site.covoiturage.services.AnnonceService;
import com.site.covoiturage.services.UserService;

import lombok.Getter;
import lombok.Setter;

@Controller
@Getter
@Setter
@RequestMapping(value = "/annonces")
public class CovoiturageController {

	@Autowired
	private AnnonceService annonceService;

	@Autowired
	private UserService userService;

	// Charger la page d'annonces
	@RequestMapping
	public String getAnnonces(Model model, @PageableDefault(size = 5) Pageable pager, Principal principal) {
		if (principal != null) {
			String user = principal.getName();
			model.addAttribute("user", user);
		}

		Page<Annonce> annonces = annonceService.findall(pager);
		model.addAttribute("annonces", annonces.getContent());
		Integer nbrePages = annonces.getTotalPages();
		model.addAttribute("maxPages", nbrePages);
		Integer current = pager.getPageNumber();
		model.addAttribute("current", current);

		return "annonces";
	}

	// Affiche les details d'une annonce
	@RequestMapping("/{id}")
	public String getAnnonceDetails(@PathVariable("id") Long id, Model model,
			@PageableDefault(size = 10) Pageable pager, Principal principal) {
		if (principal != null) {
			String user = principal.getName();
			model.addAttribute("user", user);
		}

		Annonce annonce = annonceService.findByid(id);
		model.addAttribute("annonce", annonce);
		Long idUser = annonce.getUser().getId();
		Page<Annonce> annoncesUser = annonceService.getAnnonceByUser(idUser, pager);
		Long nbreAnnonces = annoncesUser.getTotalElements();
		model.addAttribute("annonces", annoncesUser.getContent());
		model.addAttribute("nbreAnnonces", nbreAnnonces);

		return "annonce-details";
	}

	// Afficher le resultat de la recherche des annonces
	@RequestMapping("/chercherAnnonce")
	public String getAnnoncesParAdresse(@RequestParam String adresseD, @RequestParam String adresseA,
			@RequestParam String jourDepart, Model model, @PageableDefault(size = 5) Pageable pager, Principal principal) {
		if (principal != null) {
			String user = principal.getName();
			model.addAttribute("user", user);
		}
		Page<Annonce> annonces = annonceService.getAnnonceByAdresse(adresseD, adresseA, jourDepart, pager);
		model.addAttribute("annonces", annonces.getContent());
		model.addAttribute("adresseD", adresseD);
		model.addAttribute("adresseA", adresseA);
		model.addAttribute("jourDepart", jourDepart);
		Integer nbrePages = annonces.getTotalPages();
		model.addAttribute("maxPages", nbrePages);
		Integer current = pager.getPageNumber();
		model.addAttribute("current", current);
		Long nbreAnnonces = annonces.getTotalElements();
		model.addAttribute("nbreAnnonces", nbreAnnonces);

		return "annonceByadresse";
	}

	// modelAttribute user
	@ModelAttribute("user")
	public User constructUser() {
		return new User();
	}

	@RequestMapping(value = "/inscription")
	public String showInscription() {
		return "inscription";
	}

	// Methode qui ajoute un utilisateur

	@RequestMapping(method = RequestMethod.POST, value = "/inscription")
	private String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result,
			RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return "inscription";
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

	// ModelAttribute annonce
	@ModelAttribute("annonce")
	public Annonce constructAnnonce() {
		return new Annonce();
	}

	// Affiche le formulaire de la creation d'une annonce
	@RequestMapping(value = "/posterAnnonce")
	public String getAnnoncePage(Principal principal, Model model) {
		if (principal != null) {
			String user = principal.getName();
			model.addAttribute("user", user);
		}
		return "poster-annonce";
	}

	// Methode de l'ajout de d'une annonce
	@RequestMapping(method = RequestMethod.POST, value = "/posterAnnonce")
	public String saveAnnonce(@Valid @ModelAttribute("annonce") Annonce annonce, BindingResult result,
			RedirectAttributes redirectAttributes, Principal principal, Model model) {

		if (result.hasErrors()) {
			return "poster-annonce";
		}
		String username = principal.getName();
		annonceService.save(annonce, username);
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/posterAnnonce.html";
	}

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
