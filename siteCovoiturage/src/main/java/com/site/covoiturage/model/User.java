package com.site.covoiturage.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import com.site.covoiturage.annotation.UniqueUsername;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class User implements Serializable {

	/**
	 * 
	 */
	@Id
	@GeneratedValue
	private Long id;

	private String sex;

	@Size(min = 1, message = "Veuillez saisir un pr�nom! ")
	private String firstName;

	@Size(min = 1, message = "Veuillez saisir un nom de famille! ")
	private String lastName;

	@Size(min = 1, message = "Veuillez saisir un identifiant! ")
	@Column(unique = true)
	@UniqueUsername(message = "Un compte avec cet identifiant existe dej�!")
	private String username;

	@Size(min = 1, message = "Veuillez saisir une adresse email! ")
	@Email(message = "Email incorrecte!")
	private String email;

	@Size(min = 1, message = "Veuillez saisir un mot de passe! ")
	private String password;

	@Size(min = 1, message = "Veuillez saisir un numero de telephone! ")
	private String phoneNumber;

	private boolean active;

	private String commentaire;

	private String dateInscription;

	@ManyToMany(cascade = CascadeType.REMOVE)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "users_id"), inverseJoinColumns = @JoinColumn(name = "roles_id"))
	private List<Role> roles;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private List<Annonce> annonces;

	@OneToMany(mappedBy = "user")
	private List<Reservation> reservations;

}
