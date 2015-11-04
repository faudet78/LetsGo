package com.site.covoiturage.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.persistence.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName( String name );

    void delete( Role role );

}
