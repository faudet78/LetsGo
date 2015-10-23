package com.site.covoiturage.services;

import java.text.SimpleDateFormat;
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
import com.site.covoiturage.model.User;
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

		/*
		 * User user = userRepository.findOne( 1L ); Page<Annonce> annoncesByUser
		 * = annonceRepository .findAnnonceByUser( user.getId(), new PageRequest(
		 * 0, 5 ) ); System.out.println(
		 * "=========================================" ); System.out.println(
		 * "Annonces publiees par " + user.getFirstName() ); for ( Annonce annonce
		 * : annoncesByUser ) { System.out.println( annonce.getAdresseDepart() +
		 * "to " + annonce.getAdresseArrivee() );
		 * 
		 * }
		 */

		System.out.println("==========Test find End===============");

	}

	/* @PostConstruct */
	public void test1() {
		Reservation reservation = reservationService.addReservation(new Reservation(2L, new Date()), 1L, 1L);

	}

	/* @PostConstruct */
	public void init() {
		if (userRepository.findAll().size() == 0) {
			System.out.println("=============START DB INIT=================");

			Role role1 = new Role();
			role1.setName("ROLE_ADMIN");

			Role role2 = new Role();
			role2.setName("ROLE_USER");
			;

			List<Role> roles = new ArrayList<Role>();
			roles.add(role1);
			roles.add(role2);
			roleRepository.save(role1);
			roleRepository.save(role2);

			User user = new User();
			user.setFirstName("Azere");
			user.setLastName("Mabiala");
			user.setPhoneNumber("15241679642");
			user.setUsername("azeredudu");
			user.setPassword("christophe");
			user.setSex("homme");
			user.setRoles(roles);
			user.setDateInscription(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
			user.setCommentaire("Je suis comme Mr tout le monde, simple et aime bien rigoler..... Roule tranquillement.");
			user.setActive(true);
			userRepository.save(user);

			User user2 = new User();
			user2.setFirstName("Jean");
			user2.setLastName("Christophe Mabiala");
			user2.setPhoneNumber("13021264776");
			user2.setDateInscription(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
			user2.setCommentaire("Je suis sympa, je traite bien mes clients et j'adore la musique..... Roule tranquillement.");
			user2.setUsername("christophe242");
			user2.setPassword("christophe242");
			user2.setActive(true);
			user2.setSex("homme");
			user2.setRoles(roles);
			userRepository.save(user2);

			Annonce annonce = new Annonce("Paris", "Lyon", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 15, 30, 15, "Allee simple", "Toyota Yaris 2",
					"Place Jules Ferry, Yzeure, France", "Antony, France",
					"Merci de me contacter pour toute information compl�mentaire.", user2);
			annonce.setPlaceDisponible(annonce.getPlaceProposees());
			annonceRepository.save(annonce);

			Annonce annonce1 = new Annonce("Paris", "Lyon", 2L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 14, 45, 13, "Allee simple", "Peugeot 208",
					" Antony, France", "RDV � Lyon : voir avec le ",
					"Merci de me contacter pour toute information compl�mentaire.", user);
			annonce1.setPlaceDisponible(annonce1.getPlaceProposees());
			annonceRepository.save(annonce1);

			Annonce annonce2 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Volkswagen Golf",
					" Porte de Valenciennes, Lille", "Porte de la Chapelle, Paris",
					"D�part M�tro Porte de valenciennes.Arriv�e porte de la Chapelle.", user);
			annonce2.setPlaceDisponible(annonce2.getPlaceProposees());
			annonceRepository.save(annonce2);

			Annonce annonce3 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Citroen C5",
					" RDV � Croix : voir avec le conducteur", "RDV � Croix : voir avec le conducteur",
					"Je rends visite � des amis, un petit bagage est possible.", user2);
			annonce3.setPlaceDisponible(annonce3.getPlaceProposees());
			annonceRepository.save(annonce3);

			Annonce annonce4 = new Annonce(
					"Paris",
					"Monaco",
					0L,
					false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()),
					17,
					25,
					32,
					"Allee simple",
					"Citroen Xantia",
					" Gare Lille Flandres, Lille",
					"Porte Maillot, Paris",
					"Voiture tr�s confortable, voyagez sans �tre serr�.Je peux vous d�poser � porte maillot ou au centre de Puteaux.",
					user);
			annonce4.setPlaceDisponible(annonce4.getPlaceProposees());
			annonceRepository.save(annonce4);

			Annonce annonce5 = new Annonce("Monaco", "Bordeaux", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"Gare Lille Flandres, Lille", "RDV � Porte de la Chapelle, Paris : voir avec le conducteur",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user2);
			annonce5.setPlaceDisponible(annonce5.getPlaceProposees());
			annonceRepository.save(annonce5);

			Annonce annonce6 = new Annonce("Lyon", "Bordeaux", 2L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"GRoubaix, France", "Chilly-Mazarin, 91380 Chilly-Mazarin, France",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user);
			annonce6.setPlaceDisponible(annonce6.getPlaceProposees());
			annonceRepository.save(annonce6);

			Annonce annonce7 = new Annonce("Paris", "Lyon", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 15, 30, 15, "Allee simple", "Toyota Yaris 2",
					"Place Jules Ferry, Yzeure, France", "Antony, France",
					"Merci de me contacter pour toute information compl�mentaire.", user2);
			annonce7.setPlaceDisponible(annonce7.getPlaceProposees());
			annonceRepository.save(annonce7);

			Annonce annonce8 = new Annonce("Paris", "Lyon", 2L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 14, 45, 13, "Allee simple", "Peugeot 208",
					" Antony, France", "RDV � Lyon : voir avec le ",
					"Merci de me contacter pour toute information compl�mentaire.", user);
			annonce8.setPlaceDisponible(annonce8.getPlaceProposees());
			annonceRepository.save(annonce8);

			Annonce annonce9 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Volkswagen Golf",
					" Porte de Valenciennes, Lille", "Porte de la Chapelle, Paris",
					"D�part M�tro Porte de valenciennes.Arriv�e porte de la Chapelle.", user);
			annonce9.setPlaceDisponible(annonce9.getPlaceProposees());
			annonceRepository.save(annonce9);

			Annonce annonce10 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Citroen C5",
					" RDV � Croix : voir avec le conducteur", "RDV � Croix : voir avec le conducteur",
					"Je rends visite � des amis, un petit bagage est possible.", user2);
			annonce10.setPlaceDisponible(annonce10.getPlaceProposees());
			annonceRepository.save(annonce10);

			Annonce annonce11 = new Annonce(
					"Paris",
					"Monaco",
					0L,
					false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()),
					17,
					25,
					32,
					"Allee simple",
					"Citroen Xantia",
					" Gare Lille Flandres, Lille",
					"Porte Maillot, Paris",
					"Voiture tr�s confortable, voyagez sans �tre serr�.Je peux vous d�poser � porte maillot ou au centre de Puteaux.",
					user);
			annonce11.setPlaceDisponible(annonce11.getPlaceProposees());
			annonceRepository.save(annonce11);

			Annonce annonce12 = new Annonce("Monaco", "Bordeaux", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"Gare Lille Flandres, Lille", "RDV � Porte de la Chapelle, Paris : voir avec le conducteur",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user2);
			annonce12.setPlaceDisponible(annonce12.getPlaceProposees());
			annonceRepository.save(annonce12);

			Annonce annonce13 = new Annonce("Lyon", "Bordeaux", 2L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"GRoubaix, France", "Chilly-Mazarin, 91380 Chilly-Mazarin, France",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user);
			annonce13.setPlaceDisponible(annonce13.getPlaceProposees());
			annonceRepository.save(annonce13);

			Annonce annonce14 = new Annonce("Paris", "Lyon", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 15, 30, 15, "Allee simple", "Toyota Yaris 2",
					"Place Jules Ferry, Yzeure, France", "Antony, France",
					"Merci de me contacter pour toute information compl�mentaire.", user2);
			annonce14.setPlaceDisponible(annonce14.getPlaceProposees());
			annonceRepository.save(annonce14);

			Annonce annonce15 = new Annonce("Paris", "Lyon", 2L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 14, 45, 13, "Allee simple", "Peugeot 208",
					" Antony, France", "RDV � Lyon : voir avec le ",
					"Merci de me contacter pour toute information compl�mentaire.", user);
			annonce15.setPlaceDisponible(annonce15.getPlaceProposees());
			annonceRepository.save(annonce15);

			Annonce annonce16 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Volkswagen Golf",
					" Porte de Valenciennes, Lille", "Porte de la Chapelle, Paris",
					"D�part M�tro Porte de valenciennes.Arriv�e porte de la Chapelle.", user);
			annonce16.setPlaceDisponible(annonce16.getPlaceProposees());
			annonceRepository.save(annonce16);

			Annonce annonce17 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Citroen C5",
					" RDV � Croix : voir avec le conducteur", "RDV � Croix : voir avec le conducteur",
					"Je rends visite � des amis, un petit bagage est possible.", user2);
			annonce17.setPlaceDisponible(annonce17.getPlaceProposees());
			annonceRepository.save(annonce17);

			Annonce annonce18 = new Annonce(
					"Paris",
					"Monaco",
					0L,
					false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()),
					17,
					25,
					32,
					"Allee simple",
					"Citroen Xantia",
					" Gare Lille Flandres, Lille",
					"Porte Maillot, Paris",
					"Voiture tr�s confortable, voyagez sans �tre serr�.Je peux vous d�poser � porte maillot ou au centre de Puteaux.",
					user);
			annonce18.setPlaceDisponible(annonce18.getPlaceProposees());
			annonceRepository.save(annonce18);

			Annonce annonce19 = new Annonce("Monaco", "Bordeaux", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"Gare Lille Flandres, Lille", "RDV � Porte de la Chapelle, Paris : voir avec le conducteur",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user2);
			annonce19.setPlaceDisponible(annonce19.getPlaceProposees());
			annonceRepository.save(annonce19);

			Annonce annonce20 = new Annonce("Lyon", "Bordeaux", 2L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"GRoubaix, France", "Chilly-Mazarin, 91380 Chilly-Mazarin, France",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user);
			annonce20.setPlaceDisponible(annonce20.getPlaceProposees());
			annonceRepository.save(annonce20);

			Annonce annonce21 = new Annonce("Paris", "Lyon", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 15, 30, 15, "Allee simple", "Toyota Yaris 2",
					"Place Jules Ferry, Yzeure, France", "Antony, France",
					"Merci de me contacter pour toute information compl�mentaire.", user2);
			annonce21.setPlaceDisponible(annonce21.getPlaceProposees());
			annonceRepository.save(annonce21);

			Annonce annonce22 = new Annonce("Paris", "Lyon", 2L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 14, 45, 13, "Allee simple", "Peugeot 208",
					" Antony, France", "RDV � Lyon : voir avec le ",
					"Merci de me contacter pour toute information compl�mentaire.", user);
			annonce22.setPlaceDisponible(annonce22.getPlaceProposees());
			annonceRepository.save(annonce22);

			Annonce annonce23 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Volkswagen Golf",
					" Porte de Valenciennes, Lille", "Porte de la Chapelle, Paris",
					"D�part M�tro Porte de valenciennes.Arriv�e porte de la Chapelle.", user);
			annonce23.setPlaceDisponible(annonce23.getPlaceProposees());
			annonceRepository.save(annonce23);

			Annonce annonce24 = new Annonce("Paris", "Nice", 1L, false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 18, 35, 29, "Allee simple", "Citroen C5",
					" RDV � Croix : voir avec le conducteur", "RDV � Croix : voir avec le conducteur",
					"Je rends visite � des amis, un petit bagage est possible.", user2);
			annonce24.setPlaceDisponible(annonce24.getPlaceProposees());
			annonceRepository.save(annonce24);

			Annonce annonce25 = new Annonce(
					"Paris",
					"Monaco",
					0L,
					false,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()),
					17,
					25,
					32,
					"Allee simple",
					"Citroen Xantia",
					" Gare Lille Flandres, Lille",
					"Porte Maillot, Paris",
					"Voiture tr�s confortable, voyagez sans �tre serr�.Je peux vous d�poser � porte maillot ou au centre de Puteaux.",
					user);
			annonce25.setPlaceDisponible(annonce25.getPlaceProposees());
			annonceRepository.save(annonce25);

			Annonce annonce26 = new Annonce("Monaco", "Bordeaux", 3L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"Gare Lille Flandres, Lille", "RDV � Porte de la Chapelle, Paris : voir avec le conducteur",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user2);
			annonce26.setPlaceDisponible(annonce26.getPlaceProposees());
			annonceRepository.save(annonce26);

			Annonce annonce27 = new Annonce("Lyon", "Bordeaux", 2L, true,
					new SimpleDateFormat("dd/MM/yyyy").format(new Date()), 17, 25, 32, "Allee simple", "Renault Clio 2",
					"GRoubaix, France", "Chilly-Mazarin, 91380 Chilly-Mazarin, France",
					"Le conducteur n'a pas donn� plus de d�tails sur son trajet.", user);
			annonce27.setPlaceDisponible(annonce27.getPlaceProposees());
			annonceRepository.save(annonce27);

			System.out.println("==============Test==========================");
			System.out.println("Annonce owner : " + annonce.getUser().getFirstName() + " "
					+ annonce.getUser().getLastName());

		}
	}

}
