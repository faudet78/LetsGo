package com.site.covoiturage.persistence.model;

import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class User {

    @Id
    @GeneratedValue( strategy = GenerationType.AUTO )
    private Long              id;

    private String            sex;

    private String            firstName;

    private String            lastName;

    private String            email;

    @Column( length = 60 )
    private String            password;

    private String            username;
    private String            phoneNumber;

    private String            commentaire;

    private String            dateInscription;

    private boolean           enabled;

    private boolean           tokenExpired;

    //

    @ManyToMany
    @JoinTable( name = "users_roles", joinColumns = @JoinColumn( name = "user_id", referencedColumnName = "id" ), inverseJoinColumns = @JoinColumn( name = "role_id", referencedColumnName = "id" ) )
    private Collection<Role>  roles;

    @OneToMany( mappedBy = "user", fetch = FetchType.EAGER )
    private List<Annonce>     annonces;

    @OneToMany( mappedBy = "user" )
    private List<Reservation> reservations;

    public User() {
        super();
        this.enabled = false;
        this.tokenExpired = false;
    }

    public Long getId() {
        return id;
    }

    public void setId( final Long id ) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName( final String firstName ) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName( final String lastName ) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail( final String username ) {
        this.email = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword( final String password ) {
        this.password = password;
    }

    public Collection<Role> getRoles() {
        return roles;
    }

    public void setRoles( final Collection<Role> roles ) {
        this.roles = roles;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled( final boolean enabled ) {
        this.enabled = enabled;
    }

    public boolean isTokenExpired() {
        return tokenExpired;
    }

    public void setTokenExpired( final boolean expired ) {
        this.tokenExpired = expired;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername( String username ) {
        this.username = username;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber( String phoneNumber ) {
        this.phoneNumber = phoneNumber;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire( String commentaire ) {
        this.commentaire = commentaire;
    }

    public String getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription( String dateInscription ) {
        this.dateInscription = dateInscription;
    }

    public List<Annonce> getAnnonces() {
        return annonces;
    }

    public void setAnnonces( List<Annonce> annonces ) {
        this.annonces = annonces;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations( List<Reservation> reservations ) {
        this.reservations = reservations;
    }

    public String getSex() {
        return sex;
    }

    public void setSex( String sex ) {
        this.sex = sex;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ( ( email == null ) ? 0 : email.hashCode() );
        return result;
    }

    @Override
    public boolean equals( final Object obj ) {
        if ( this == obj ) {
            return true;
        }
        if ( obj == null ) {
            return false;
        }
        if ( getClass() != obj.getClass() ) {
            return false;
        }
        final User user = (User) obj;
        if ( !email.equals( user.email ) ) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        final StringBuilder builder = new StringBuilder();
        builder.append( "User [firstName=" ).append( firstName ).append( "]" ).append( "[lastName=" ).append( lastName )
                .append( "]" ).append( "[username" ).append( email ).append( "]" );
        return builder.toString();
    }

}