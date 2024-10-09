package com.crimsonlogic.movieticketbookingsystem.entity;

import java.sql.Date;
import java.sql.Time;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * Show.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a booking entity in the movie ticket
 * booking system. It includes details such as show ID, movie,
 * screen, showdate, showtime.
 * 
 * Author:Vamsi c
 * 
 * Since: 2024-09-11
 */
@Data
@NoArgsConstructor
@Entity
@Table(name = "Shows")
public class Show {
	@Id
	@GeneratedValue(generator = "custom-prefix-generator")
    @GenericGenerator(name = "custom-prefix-generator",
    	strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator",
    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "SH")
    )
	private String showId;

	 @ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "movie_id", nullable = false)
	private Movie movie;

	@ManyToOne
	@JoinColumn(name = "screen_id", nullable = false)
	private Screen screen;

	
	@Column(nullable = false)
	private Date  showDate;
	
	
	@Column(nullable = false)
	private Time  showTime;
}
