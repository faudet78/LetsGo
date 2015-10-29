package com.site.covoiturage.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.site.covoiturage.model.Role;
import com.site.covoiturage.model.User;
import com.site.covoiturage.repositories.RoleRepository;
import com.site.covoiturage.repositories.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	public void save(User user) {
		user.setActive(true);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));

		List<Role> roles = new ArrayList<Role>();

		roles.add(roleRepository.findByName("ROLE_USER"));

		user.setRoles(roles);
		user.setDateInscription(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
		userRepository.save(user);

	}

	public void delete(Long id) {
		userRepository.delete(id);

	}

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}

}
