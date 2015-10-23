package com.site.covoiturage.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.site.covoiturage.model.Annonce;
import com.site.covoiturage.model.User;
import com.site.covoiturage.repositories.AnnonceRepository;
import com.site.covoiturage.repositories.UserRepository;

@Service
@Transactional
public class AnnonceService {

	@Autowired
	private AnnonceRepository annonceRepository;

	@Autowired
	private UserRepository userRepository;

	public List<Annonce> findAll() {
		return annonceRepository.findAll();
	}

	public Page<Annonce> findall(Pageable p) {
		return annonceRepository.findAll(p);
	}

	public void save(Annonce annonce, String username) {
		User user = userRepository.findByUsername(username);
		annonce.setUser(user);
		annonce.setDateCreation(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
		annonce.setPlaceDisponible(annonce.getPlaceProposees());
		annonceRepository.save(annonce);
	}

	public Annonce findByid(Long id) {
		// TODO Auto-generated method stub
		return annonceRepository.findOne(id);
	}

	public Page<Annonce> getAnnonceByAdresse(String adresseD, String adresseA, String jourDepart, Pageable pageable) {
		return annonceRepository.findAnnonceByAdresse("%" + adresseD + "%", "%" + adresseA + "%", jourDepart, pageable);
	}

	public Page<Annonce> getAnnonceByUser(Long id, Pageable pageable) {
		return annonceRepository.findAnnonceByUser(id, pageable);
	}

	public User findById(Long id) {
		return userRepository.findOne(id);
	}

}
