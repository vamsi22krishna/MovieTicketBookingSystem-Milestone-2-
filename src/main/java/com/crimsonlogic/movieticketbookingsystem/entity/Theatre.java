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
 * Payment.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a theatre entity in the movie ticket
 * booking system. It includes details such as theatre ID, name,
 * location, total screens.
 * 
 * Author:Vamsi c
 * 
 * Since: 2024-09-11
 */
@Entity
@Table(name = "Theatre")
@Data
@NoArgsConstructor
public class Theatre {
	
	 @Id
	 @GeneratedValue(generator = "custom-prefix-generator")
	    @GenericGenerator(name = "custom-prefix-generator",
	    	strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator",
	    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "TH")
	    )
	    private String theatreId;

	    @Column(nullable = false)
	    private String name;

	    @Column(nullable = false)
	    private String location;
	    
	    @Column(nullable = false)
	    private int totalScreens;
	 

}
