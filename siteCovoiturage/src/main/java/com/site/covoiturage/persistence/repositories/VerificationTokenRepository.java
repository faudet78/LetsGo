package com.site.covoiturage.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.persistence.model.User;
import com.site.covoiturage.persistence.model.VerificationToken;

public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {

    VerificationToken findByToken(String token);

    VerificationToken findByUser(User user);

}
