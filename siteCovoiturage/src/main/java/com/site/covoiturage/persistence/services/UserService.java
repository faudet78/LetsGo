package com.site.covoiturage.persistence.services;

import java.util.Arrays;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.site.covoiturage.persistence.model.PasswordResetToken;
import com.site.covoiturage.persistence.model.User;
import com.site.covoiturage.persistence.model.VerificationToken;
import com.site.covoiturage.persistence.repositories.PasswordResetTokenRepository;
import com.site.covoiturage.persistence.repositories.RoleRepository;
import com.site.covoiturage.persistence.repositories.UserRepository;
import com.site.covoiturage.persistence.repositories.VerificationTokenRepository;
import com.site.covoiturage.validation.EmailExistsException;

@Service
@Transactional
public class UserService implements IUserService {
    @Autowired
    private UserRepository               repository;

    @Autowired
    private VerificationTokenRepository  tokenRepository;

    @Autowired
    private PasswordResetTokenRepository passwordTokenRepository;

    @Autowired
    private PasswordEncoder              passwordEncoder;

    @Autowired
    private RoleRepository               roleRepository;

    // API

    public User registerNewUserAccount( final UserDto accountDto ) throws EmailExistsException {
        if ( emailExist( accountDto.getEmail() ) ) {
            throw new EmailExistsException( "There is an account with that email adress: " + accountDto.getEmail() );
        }
        final User user = new User();

        user.setFirstName( accountDto.getFirstName() );
        user.setLastName( accountDto.getLastName() );
        user.setPassword( passwordEncoder.encode( accountDto.getPassword() ) );
        user.setEmail( accountDto.getEmail() );

        user.setRoles( Arrays.asList( roleRepository.findByName( "ROLE_USER" ) ) );
        return repository.save( user );
    }

    public User getUser( final String verificationToken ) {
        final User user = tokenRepository.findByToken( verificationToken ).getUser();
        return user;
    }

    public VerificationToken getVerificationToken( final String VerificationToken ) {
        return tokenRepository.findByToken( VerificationToken );
    }

    public void saveRegisteredUser( final User user ) {
        repository.save( user );
    }

    public void deleteUser( final User user ) {
        repository.delete( user );
    }

    public void createVerificationTokenForUser( final User user, final String token ) {
        final VerificationToken myToken = new VerificationToken( token, user );
        tokenRepository.save( myToken );
    }

    public VerificationToken generateNewVerificationToken( final String existingVerificationToken ) {
        VerificationToken vToken = tokenRepository.findByToken( existingVerificationToken );
        vToken.updateToken( UUID.randomUUID().toString() );
        vToken = tokenRepository.save( vToken );
        return vToken;
    }

    public void createPasswordResetTokenForUser( final User user, final String token ) {
        final PasswordResetToken myToken = new PasswordResetToken( token, user );
        passwordTokenRepository.save( myToken );
    }

    public User findUserByEmail( final String email ) {
        return repository.findByEmail( email );
    }

    public PasswordResetToken getPasswordResetToken( final String token ) {
        return passwordTokenRepository.findByToken( token );
    }

    public User getUserByPasswordResetToken( final String token ) {
        return passwordTokenRepository.findByToken( token ).getUser();
    }

    public User getUserByID( final long id ) {
        return repository.findOne( id );
    }

    public void changeUserPassword( final User user, final String password ) {
        user.setPassword( passwordEncoder.encode( password ) );
        repository.save( user );
    }

    public boolean checkIfValidOldPassword( final User user, final String oldPassword ) {
        return passwordEncoder.matches( oldPassword, user.getPassword() );
    }

    private boolean emailExist( final String email ) {
        final User user = repository.findByEmail( email );
        if ( user != null ) {
            return true;
        }
        return false;
    }

}