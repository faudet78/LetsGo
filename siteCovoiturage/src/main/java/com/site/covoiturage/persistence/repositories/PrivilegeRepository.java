package com.site.covoiturage.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.persistence.model.Privilege;

public interface PrivilegeRepository extends JpaRepository<Privilege, Long> {

    Privilege findByName( String name );

    void delete( Privilege privilege );

}
