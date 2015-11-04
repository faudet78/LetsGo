package com.site.covoiturage.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.persistence.model.PasswordResetToken;
import com.site.covoiturage.persistence.model.User;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {

    PasswordResetToken findByToken(String token);

    PasswordResetToken findByUser(User user);

}
