package com.site.covoiturage.persistence.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.site.covoiturage.persistence.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

	@Query("select r from Reservation r where r.user.email=:email")
	Page<Reservation> findReservationByUser(@Param("email") String email, Pageable pageable);

}
