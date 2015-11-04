package com.site.covoiturage.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.persistence.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

}
