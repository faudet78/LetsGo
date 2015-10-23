package com.site.covoiturage.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.site.covoiturage.repositories.UserRepository;

public class UniqueUsernameValidator implements ConstraintValidator<UniqueUsername, String> {

	@Autowired
	private UserRepository userRepository;

	public void initialize(UniqueUsername constraintAnnotation) {
		// TODO Auto-generated method stub

	}

	public boolean isValid(String username, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		if (userRepository == null) {
			return true;
		}

		return userRepository.findByUsername(username) == null;

	}

}
