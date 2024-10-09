package com.crimsonlogic.movieticketbookingsystem.entity;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Booking.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a booking entity in the movie ticket
 * booking system. It includes details such as booking ID, user, show, screen,
 * theatre, seat number, booking time, total price, show date, and payment.
 * 
 * Author: vamsi c
 * 
 * Since: 2024-09-11
 */

@Data
@NoArgsConstructor
@Entity
@Table(name = "Bookings")
public class Booking {
	@Id
	@GeneratedValue(generator = "custom-prefix-generator")
	@GenericGenerator(name = "custom-prefix-generator", strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator", parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "BK"))
	private String bookingId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	@ManyToOne
	@JoinColumn(name = "show_id", nullable = false)
	private Show show;

	@ManyToOne
	@JoinColumn(name = "screen_id", nullable = false)
	private Screen screen;

	@ManyToOne
	@JoinColumn(name = "theatre_id", nullable = false)
	private Theatre theatre;

	@Column(name = "seat_number", nullable = false)
	private int seatNumber;

	@Column(nullable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Timestamp bookingTime;

	@Column(nullable = false)
	private BigDecimal totalPrice;

	@Column(nullable = false)
	private Date showDate;

	@ManyToOne
	@JoinColumn(name = "payment_id")
	private Payment payment;

	@PrePersist
	protected void onCreate() {
		bookingTime = new Timestamp(System.currentTimeMillis());
	}

}
