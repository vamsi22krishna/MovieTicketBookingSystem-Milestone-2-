package com.crimsonlogic.movieticketbookingsystem.entity;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Movie.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a movie entity in the multiplex ticket
 * booking system. It includes details such as movie ID, title, genre, duration,
 * releasedate, rating, ticket price, image url , director, amount.
 * 
 * Author:vamsi c
 * 
 * Since: 2024-09-11
 */
@Data
@NoArgsConstructor
@Entity
@Table(name = "Movies")
public class Movie {
	@Id
	@GeneratedValue(generator = "custom-prefix-generator")
	@GenericGenerator(name = "custom-prefix-generator", strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator", parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "MV"))
	private String movieId;

	@Column(nullable = false)
	private String title;

	@Column(nullable = false)
	private String genre;

	@Column(nullable = false)
	private int duration;

	@Column(nullable = false)
	private Date releaseDate;

	@Column(nullable = true)
	private BigDecimal rating;

	@Column(nullable = false)
	private BigDecimal ticketPrice;

	@Column(nullable = true)
	private String imageUrl;

	@Column(nullable = true)
	private String directorName;

	@Column(nullable = true)
	private String about;

}
