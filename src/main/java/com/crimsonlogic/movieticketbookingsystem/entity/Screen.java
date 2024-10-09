package com.crimsonlogic.movieticketbookingsystem.entity;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Screen.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a booking entity in the movie ticket
 * booking system. It includes details such as screen ID, theatre,
 * name, total seats.
 * 
 * Author:Vamsi c
 * 
 * Since: 2024-09-11
 */
@Data
@NoArgsConstructor

	@Entity
	@Table(name = "Screens")
	public class Screen {
	    @Id
	    @GeneratedValue(generator = "custom-prefix-generator")
	    @GenericGenerator(name = "custom-prefix-generator",
	    	strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator",
	    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "SC")
	    )
	    private String screenId;

	    @ManyToOne
	    @JoinColumn(name = "theatre_id", nullable = false)
	    private Theatre theatre;

	    @Column(nullable = false)
	    private String name;
	    
	    @Column(nullable = false)
	    private int totalSeats;
      
	    
	    
	    
	}


