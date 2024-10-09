package com.crimsonlogic.movieticketbookingsystem.service;

import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.Payment;

public interface PaymentService {
	public List<Payment> getAllPayments();
	public Optional<Payment> getPaymentById(String paymentId);
	public Payment createPayment(Payment payment);
	public void deletePayment(String paymentId);
	
	
}
