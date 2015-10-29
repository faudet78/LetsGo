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

	private String typeTrajet;

	private String vehicule;

	private String lieuDepart;

	private String lieuArrivee;

	private String details;

	private String photo;

	private String dateCreation;

	private String model;

	private boolean animauxActive;

	private boolean musicActive;

	private boolean climatisation;

	private boolean hasMusic;

	private int nbrePortes;

	private int nbrePersonnes;

	private int prix;

	private int nbreSacs;

	private EAnnonceStatut statut;

	@ManyToOne
	@JoinColumn(name = "id_user")
	private User user;

	public Annonce() {
		super();
	}

	public Annonce(String adresseDepart, String adresseArrivee, Long placeDisponible, Long placeProposees,
			boolean fumeurActive, String jourDepart, String heureDepart, int prix, String typeTrajet, String vehicule,
			String lieuDepart, String lieuArrivee, String details, boolean animauxActive, boolean musicActive,
			String photo, boolean hasMusic, int nbrePortes, int nbrePersonnes, int nbreSacs, boolean climatisation,
			String dateCreation, String model, User user) {
		super();
		this.adresseDepart = adresseDepart;
		this.adresseArrivee = adresseArrivee;
		this.placeDisponible = placeDisponible;
		this.placeProposees = placeProposees;
		this.fumeurActive = fumeurActive;
		this.jourDepart = jourDepart;
		this.heureDepart = heureDepart;
		this.prix = prix;
		this.typeTrajet = typeTrajet;
		this.vehicule = vehicule;
		this.lieuDepart = lieuDepart;
		this.lieuArrivee = lieuArrivee;
		this.details = details;
		this.animauxActive = animauxActive;
		this.musicActive = musicActive;
		this.photo = photo;
		this.hasMusic = hasMusic;
		this.nbrePortes = nbrePortes;
		this.nbrePersonnes = nbrePersonnes;
		this.nbreSacs = nbreSacs;
		this.climatisation = climatisation;
		this.dateCreation = dateCreation;
		this.model = model;
		this.user = user;
	}

}
