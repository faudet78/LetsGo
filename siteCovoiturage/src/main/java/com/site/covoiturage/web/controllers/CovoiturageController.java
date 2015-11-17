package com.site.covoiturage.web.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.validation.Valid;

import lombok.Getter;
import lombok.Setter;

/*import org.apache.commons.io.IOUtils;*/
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.site.covoiturage.persistence.model.Annonce;
import com.site.covoiturage.persistence.model.Reservation;
import com.site.covoiturage.persistence.model.User;
import com.site.covoiturage.persistence.services.AnnonceService;
import com.site.covoiturage.persistence.services.IUserService;
import com.site.covoiturage.persistence.services.ReservationService;

@Controller
@Getter
@Setter
@RequestMapping(value = "/annonces")
public class CovoiturageController {

	@Autowired
	private AnnonceService annonceService;

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private IUserService userService;

	// Charger la page d'annonces
	@RequestMapping
	public String getAnnonces(Model model, @PageableDefault(size = 5) Pageable pager, Principal principal,
			@ModelAttribute("message") String message) {
		if (principal != null) {
			String email = principal.getName();
			User user = userService.findUserByEmail(email);
			model.addAttribute("user", user);
		}

		Page<Annonce> annonces = annonceService.findall(pager);
		model.addAttribute("annonces", annonces.getContent());
		Integer nbrePages = annonces.getTotalPages();
		model.addAttribute("maxPages", nbrePages);
		Integer current = pager.getPageNumber();
		model.addAttribute("current", current);
		model.addAttribute(message);

		return "annonces";
	}

	// Affiche les details d'une annonce
	@RequestMapping("{id}")
	public String getAnnonceDetails(@PathVariable("id") Long id, Model model,
			@PageableDefault(size = 10) Pageable pager, Principal principal) {
		if (principal != null) {
			String email = principal.getName();
			User user = userService.findUserByEmail(email);
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
			String email = principal.getName();
			User user = userService.findUserByEmail(email);
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

	@RequestMapping(value = "/inscription")
	public String showInscription() {
		return "inscription";
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
			String email = principal.getName();
			User user = userService.findUserByEmail(email);
			model.addAttribute("user", user);
		}
		return "poster-annonce";
	}

	// Methode de l'ajout de d'une annonce
	@RequestMapping(method = RequestMethod.POST, value = "/posterAnnonce")
	public String saveAnnonce(@Valid @ModelAttribute("annonce") Annonce annonce, BindingResult result,
			RedirectAttributes redirectAttributes, Principal principal, Model model) throws IOException {

		if (result.hasErrors()) {
			return "poster-annonce";
		}

		String username = principal.getName();

		Long idP = annonceService.save(annonce, username);

		annonceService.save(annonce, username);
		redirectAttributes.addFlashAttribute("message", "Votre annonce a été créée avec succès!");
		return "redirect:/annonces.html";

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

	public CovoiturageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@ModelAttribute("reservation")
	public Reservation constructReservation() {
		return new Reservation();
	}

	@RequestMapping(value = "/reservation/{id}", method = RequestMethod.POST)
	public String doReservation(@ModelAttribute("reservation") Reservation reservation, Model model,
			Principal principal, RedirectAttributes redirectAttributes, String email, @PathVariable Long id) {
		if (principal != null) {
			email = principal.getName();
			User user = userService.findUserByEmail(email);
			model.addAttribute("user", user);
		}
		reservationService.addReservation(reservation, email, id);
		redirectAttributes.addFlashAttribute("message", "Succès de votre réservation!");
		return "redirect:/annonces.html";
	}

	@RequestMapping(value = "/dashboard/annonces")
	public String getDashboardAnnonces(Principal principal, Model model, @PageableDefault(size = 5) Pageable pager) {
		String email = null;
		if (principal != null) {
			email = principal.getName();
			User user = userService.findUserByEmail(email);
			model.addAttribute("user", user);
		}
		Page<Annonce> annoncesUser = annonceService.getAnnonceByUserEmail(email, pager);
		Long nbreAnnonces = annoncesUser.getTotalElements();
		model.addAttribute("annonces", annoncesUser.getContent());
		model.addAttribute("nbreAnnonces", nbreAnnonces);
		Integer nbrePages = annoncesUser.getTotalPages();
		model.addAttribute("maxPages", nbrePages);
		Integer current = pager.getPageNumber();
		model.addAttribute("current", current);

		return "annoncesUser";

	}

	@RequestMapping(value = "/dashboard/reservations")
	public String getDashboardReservations(Principal principal, Model model, @PageableDefault(size = 5) Pageable pager) {
		String email = null;
		if (principal != null) {
			email = principal.getName();
			User user = userService.findUserByEmail(email);
			model.addAttribute("user", user);
		}
		Page<Reservation> reservations = reservationService.findReservationByUser(email, pager);
		model.addAttribute("reservations", reservations.getContent());
		Integer nbrePages = reservations.getTotalPages();
		model.addAttribute("maxPages", nbrePages);
		Integer current = pager.getPageNumber();
		model.addAttribute("current", current);

		return "reservationsUser";

	}

}
