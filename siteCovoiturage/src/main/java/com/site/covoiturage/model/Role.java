package com.site.covoiturage.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Role implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7851405599252472296L;

	@Id
	@GeneratedValue
	private Long id;

	private String name;

	@ManyToMany(mappedBy = "roles")
	private List<User> users;

}
