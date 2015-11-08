package com.site.covoiturage.persistence.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Reservation {

	@Id
	@GeneratedValue
	private Long id;

	@Column(name = "nombre_place")
	private Long nombrePlace;

	private String dateCreation;

	private double prixTotal;

	@ManyToOne()
	private User user;

	@ManyToOne
	private Annonce annonce;

	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reservation(Long nombrePlace, String dateCreation) {
		super();
		this.nombrePlace = nombrePlace;
		this.dateCreation = dateCreation;
	}

}
