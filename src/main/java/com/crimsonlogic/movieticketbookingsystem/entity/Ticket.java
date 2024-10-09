package com.crimsonlogic.movieticketbookingsystem.entity;

import java.math.BigDecimal;

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
 * Payment.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a Ticket entity in the movie ticket
 * booking system. It includes details such as ticket ID, booking, show,
 * theatre.
 * 
 * Author:Vamsi c
 * 
 * Since: 2024-09-11
 */
@Data
@NoArgsConstructor
@Entity
@Table(name = "Tickets")
public class Ticket {
	@Id
	@GeneratedValue(generator = "custom-prefix-generator")
	@GenericGenerator(name = "custom-prefix-generator", strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator", parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "TK"))
	private String ticketId;

	@ManyToOne
	@JoinColumn(name = "booking_id", nullable = false)
	private Booking booking;

	@ManyToOne
	@JoinColumn(name = "show_id", nullable = false)
	private Show show;

	@ManyToOne
	@JoinColumn(name = "theatre_id", nullable = false)
	private Theatre theatre;

}
