package com.site.covoiturage.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	public User findByUsername(String username);

}
