package com.site.covoiturage.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.covoiturage.model.Annonce;
import com.site.covoiturage.model.Reservation;
import com.site.covoiturage.model.User;
import com.site.covoiturage.repositories.AnnonceRepository;
import com.site.covoiturage.repositories.ReservationRepository;
import com.site.covoiturage.repositories.UserRepository;

@Service
@Transactional
public class ReservationService {

	@Autowired
	private ReservationRepository reserverRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AnnonceRepository annonceRepository;

	public Reservation addReservation(Reservation reserver, Long idUser, Long idAnnonce) {
		User user = userRepository.findOne(idUser);
		Annonce annonce = annonceRepository.findOne(idAnnonce);
		annonce.setPlaceDisponible(annonce.getPlaceDisponible() - reserver.getNombrePlace());
		reserver.setPrixTotal(annonce.getPrix() * reserver.getNombrePlace());
		reserver.setUser(user);
		reserver.setAnnonce(annonce);
		reserverRepository.save(reserver);

		return reserver;

	}

}
