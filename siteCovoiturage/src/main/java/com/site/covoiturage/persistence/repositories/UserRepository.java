package com.site.covoiturage.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.persistence.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail( String email );

    void delete( User user );

    public User findByUsername( String username );

}
