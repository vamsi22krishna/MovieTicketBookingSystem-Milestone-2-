package com.crimsonlogic.movieticketbookingsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.Ticket;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, String> {
	@Query("SELECT t FROM Ticket t WHERE t.booking.id = :bookingId")
	  public List<Ticket> findByBookingId(@Param("bookingId") String bookingId);
}
