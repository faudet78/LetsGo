package com.site.covoiturage.persistence.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.site.covoiturage.persistence.model.Annonce;

public interface AnnonceRepository extends JpaRepository<Annonce, Long> {

	@Query("select a from Annonce a WHERE (a.adresseDepart like :adresseD AND a.adresseArrivee like :adresseA) AND a.jourDepart=:jourDepart ORDER BY a.prix ASC")
	Page<Annonce> findAnnonceByAdresse(@Param("adresseD") String adresseD, @Param("adresseA") String adresseA,
			@Param("jourDepart") String jourDepart, Pageable pageable);

	/*
	 * @Query( value = "select a from Annonce a", countQuery =
	 * "count(a) from Annonce a" )
	 */
	Page<Annonce> findAll(Pageable pageable);

	@Query("select a from Annonce a where a.user.id =:id ")
	Page<Annonce> findAnnonceByUser(@Param("id") Long id, Pageable pageable);

}
