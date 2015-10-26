package com.site.covoiturage.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Annonce implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6336636348445236052L;

	@Id
	@GeneratedValue
	private Long id;

	private String adresseDepart;

	private String adresseArrivee;

	private Long placeDisponible;

	private Long placeProposees;

	private boolean fumeurActive;

	private String jourDepart;

	private String heureDepart;

	private int prix;

	private String typeTrajet;

	private String vehicule;

	private String lieuDepart;

	private String lieuArrivee;

	private String details;

	private boolean animauxActive;

	private boolean musicActive;

	private String photo;

	private boolean hasMusic;

	private int nbrePortes;

	private int nbrePersonnes;

	private int nbreSacs;

	private boolean climatisation;

	private String dateCreation;

	private String model;

	@ManyToOne
	@JoinColumn(name = "id_user")
	private User user;

	public Annonce() {
		super();
		// TODO Auto-generated constructor stub
	}

}
