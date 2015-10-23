package com.site.covoiturage.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

}
