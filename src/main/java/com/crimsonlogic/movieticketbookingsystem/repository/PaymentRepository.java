package com.crimsonlogic.movieticketbookingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.Payment;
 
@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {

}
