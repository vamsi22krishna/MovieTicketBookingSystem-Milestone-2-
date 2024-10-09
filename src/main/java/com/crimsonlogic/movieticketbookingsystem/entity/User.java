package com.crimsonlogic.movieticketbookingsystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * user.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a user entity in the movie ticket
 * booking system. It includes details such as user ID, username,
 * password, email, phone,role,firstName,lastName.
 * 
 * Author:Vamsi c
 * 
 * Since: 2024-09-11
 */
@Data
@NoArgsConstructor
@Entity
	@Table(name = "Users")
	public class User {
	    @Id
	    @GeneratedValue(generator = "custom-prefix-generator")
	    @GenericGenerator(name = "custom-prefix-generator",
	    	strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator",
	    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "US")
	    )
	    private String userId;

	    @Column(nullable = false, unique = true)
	    private String username;

	    @Column(nullable = false)
	    private String password;

	    @Column(nullable = false, unique = true)
	    private String email;
     
	    @Column(nullable = false)
	    private String phone;
	    
	    @Column(nullable = false)
	    private String role = "customer";
	    
	    
	    @Column(nullable = false)
	    private String firstName;

	    @Column(nullable = false)
	    private String lastName;

	  
	}

