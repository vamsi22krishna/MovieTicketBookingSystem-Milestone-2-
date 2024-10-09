package com.crimsonlogic.movieticketbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.crimsonlogic.movieticketbookingsystem.entity.Payment;
import com.crimsonlogic.movieticketbookingsystem.service.PaymentService;

import java.util.List;
import java.util.Optional;

/**
 * PaymentController.java
 * 
 * Version: 1.0
 * 
 * Revision Date: 2024-09-18
 * 
 * Author: vamsi c
 * 
 * Since: 2024-09-11
 */
@Controller
@RequestMapping("/payments")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;

	/**
	 * Retrieves and displays all payments.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying all payments
	 */
	// method for getting all payments
	@GetMapping
	public String getAllPayments(Model model) {
		List<Payment> payments = paymentService.getAllPayments();
		model.addAttribute("payments", payments);
		return "payments"; 
	}

	/**
	 * Retrieves and displays a payment by its ID.
	 *
	 * @param id    the ID of the payment
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying payment details
	 */
	// method to get payment by id
	@GetMapping("/{id}")
	public String getPaymentById(@PathVariable String id, Model model) {
		Optional<Payment> payment = paymentService.getPaymentById(id);
		model.addAttribute("payment", payment.orElse(null));
		return "payment";
	}

	/**
	 * Creates a new payment and redirects to the payments list.
	 *
	 * @param payment the payment object to be created
	 * @param model   the model to pass attributes to the view
	 * @return a redirect to the payments list after successful creation
	 */
	// method to create payment
	@PostMapping
	public String createPayment(@ModelAttribute Payment payment, Model model) {
		Payment newPayment = paymentService.createPayment(payment);
		model.addAttribute("payment", newPayment);
		return "redirect:/payments";
	}

}
