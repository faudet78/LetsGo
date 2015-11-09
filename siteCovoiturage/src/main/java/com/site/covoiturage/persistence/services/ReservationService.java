package com.site.covoiturage.persistence.services;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.site.covoiturage.persistence.model.Annonce;
import com.site.covoiturage.persistence.model.Reservation;
import com.site.covoiturage.persistence.model.User;
import com.site.covoiturage.persistence.repositories.AnnonceRepository;
import com.site.covoiturage.persistence.repositories.ReservationRepository;
import com.site.covoiturage.persistence.repositories.UserRepository;

@Service
@Transactional
public class ReservationService {

	@Autowired
	private ReservationRepository reserverRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AnnonceRepository annonceRepository;

	public Reservation addReservation(Reservation reserver, String email, Long idAnnonce) {
		User user = userRepository.findByEmail(email);
		Annonce annonce = annonceRepository.findOne(idAnnonce);
		annonce.setPlaceDisponible(annonce.getPlaceDisponible() - reserver.getNombrePlace());
		reserver.setPrixTotal(annonce.getPrix() * reserver.getNombrePlace());
		reserver.setDateCreation(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
		reserver.setUser(user);
		reserver.setAnnonce(annonce);
		reserverRepository.save(reserver);

		return reserver;

	}

	public Page<Reservation> findReservationByUser(String email, Pageable pageable) {
		return reserverRepository.findReservationByUser(email, pageable);
	}

}
