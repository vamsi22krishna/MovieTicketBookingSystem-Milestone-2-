package com.crimsonlogic.movieticketbookingsystem.service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.Booking;
import com.crimsonlogic.movieticketbookingsystem.entity.Ticket;

public interface TicketService {
	public List<Ticket> getAllTickets();
	public Optional<Ticket> getTicketById(String ticketId);
	public Ticket createTicket(Ticket ticket);
	public void deleteTicket(String ticketId);
	public List<Ticket> getTicketsByBookingId(String bookingId);
	//public Collection<? extends Ticket> getTicketsByBookingId(String bookingId);
}
