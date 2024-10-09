package com.crimsonlogic.movieticketbookingsystem.entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Payment.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Description: This class represents a payments entity in the movie ticket
 * booking system. It includes details such as payment ID, paymentMethod,
 * paymentDate, amount, bookings.
 * 
 * Author:Vamsi c
 * 
 * Since: 2024-09-11
 */
@Entity
@Table(name = "payments")

@NoArgsConstructor
public class Payment {
	@Id
	@GeneratedValue(generator = "custom-prefix-generator")
	@GenericGenerator(name = "custom-prefix-generator", strategy = "com.crimsonlogic.movieticketbookingsystem.util.CustomPrefixIdentifierGenerator", parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "PY"))
	private String paymentId;

	@Column(nullable = false)
	private String paymentMethod;

	@Column(nullable = false)
	private LocalDateTime paymentDate;

	@Column(nullable = false)
	private Double amount;

	@OneToMany(mappedBy = "payment")
	private List<Booking> bookings;

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public LocalDateTime getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(LocalDateTime paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

}