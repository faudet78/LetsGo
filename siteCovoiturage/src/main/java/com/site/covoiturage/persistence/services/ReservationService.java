package com.site.covoiturage.persistence.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
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
    private UserRepository        userRepository;

    @Autowired
    private AnnonceRepository     annonceRepository;

    public Reservation addReservation( Reservation reserver, Long idUser, Long idAnnonce ) {
        User user = userRepository.findOne( idUser );
        Annonce annonce = annonceRepository.findOne( idAnnonce );
        annonce.setPlaceDisponible( annonce.getPlaceDisponible() - reserver.getNombrePlace() );
        reserver.setPrixTotal( annonce.getPrix() * reserver.getNombrePlace() );
        reserver.setUser( user );
        reserver.setAnnonce( annonce );
        reserverRepository.save( reserver );

        return reserver;

    }

}
