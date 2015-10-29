package com.site.covoiturage.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.site.covoiturage.model.Annonce;
import com.site.covoiturage.model.Reservation;
import com.site.covoiturage.model.Role;
import com.site.covoiturage.repositories.AnnonceRepository;
import com.site.covoiturage.repositories.ReservationRepository;
import com.site.covoiturage.repositories.RoleRepository;
import com.site.covoiturage.repositories.UserRepository;

@Service
@Transactional
public class InitDbService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private AnnonceRepository annonceRepository;

	@Autowired
	private ReservationRepository reservationRepository;

	@Autowired
	private ReservationService reservationService;

	@PostConstruct
	public void test() {
		Page<Annonce> annonces = annonceRepository.findAnnonceByAdresse("Paris", "Lyon", "20/10/2015", new PageRequest(0,
				5));
		System.out.println("==========Test find Start===============");
		for (Annonce annonce : annonces) {

			System.out.println(annonce.getUser().getFirstName() + " " + annonce.getUser().getLastName());
			System.out.println(annonce.getVehicule());
			System.out.println(annonce.getPrix());
		}
		System.out.println("==========Test find End===============");
	}

	/* @PostConstruct */
	public void test1() {
		Reservation reservation = reservationService.addReservation(new Reservation(2L, new Date()), 1L, 1L);

	}

	@PostConstruct
	public void init() {
		if (roleRepository.findAll().size() == 0) {
			Role role1 = new Role();
			role1.setName("ROLE_USER");
			roleRepository.save(role1);

			List<Role> roles = new ArrayList<Role>();
			roles.add(role1);

			/*
			 * User user = new User(); user.setActive(true);
			 * user.setDateInscription(new
			 * SimpleDateFormat("dd/MM/yyyy").format(new Date()));
			 * BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			 * user.setPassword(encoder.encode("christophe"));
			 * user.setUsername("azeredudu"); user.setFirstName("Azere");
			 * user.setLastName("Mabiala");
			 * user.setCommentaire("Je suis un mec sympa, cool, .. ..");
			 * user.setRoles(roles); userRepository.save(user);
			 * 
			 * if (annonceRepository.findAll().size() == 0) {
			 * 
			 * Annonce annonce = new Annonce("Paris", "Lyon", 3L, 3L, true, new
			 * SimpleDateFormat("dd/MM/yyyy").format(new Date()), new
			 * SimpleDateFormat("HH:mm").format(new Date()), 25, "Allee simple",
			 * "Mercedes", "N'importe ou", "N'importe ou",
			 * "Je pars sur Lyon visiter des parents j'ai trois places de libre dans ma voiture"
			 * , true, true, null, false, 3, 1, 3, false, new
			 * SimpleDateFormat("dd/MM/yyyy").format(new Date()), "Classe c",
			 * user); annonceRepository.save(annonce);
			 * 
			 * Annonce annonce1 = new Annonce("Rennes", "Bordeaux", 3L, 3L, true,
			 * new SimpleDateFormat("dd/MM/yyyy").format(new Date()), new
			 * SimpleDateFormat("HH:mm").format(new Date()), 25, "Allee simple",
			 * "Mercedes", "N'importe ou", "N'importe ou",
			 * "Je pars sur Bordeaux visiter des parents j'ai trois places de libre dans ma voiture"
			 * , true, true, null, false, 4, 1, 4, false, new
			 * SimpleDateFormat("dd/MM/yyyy").format(new Date()), "Classe c",
			 * user); annonceRepository.save(annonce1);
			 * 
			 * }
			 */

		}

	}
}
