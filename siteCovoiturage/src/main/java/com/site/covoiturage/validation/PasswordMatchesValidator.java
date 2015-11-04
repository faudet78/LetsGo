package com.site.covoiturage.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.site.covoiturage.persistence.services.UserDto;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object> {

    public void initialize( final PasswordMatches constraintAnnotation ) {
        //
    }

    public boolean isValid( final Object obj, final ConstraintValidatorContext context ) {
        final UserDto user = (UserDto) obj;
        return user.getPassword().equals( user.getMatchingPassword() );
    }

}
