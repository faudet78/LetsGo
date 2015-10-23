package com.site.covoiturage.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.site.covoiturage.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

	Role findByName(String roleName);

}
