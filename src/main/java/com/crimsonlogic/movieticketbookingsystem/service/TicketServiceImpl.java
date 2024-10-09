package com.crimsonlogic.movieticketbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.movieticketbookingsystem.entity.Ticket;
import com.crimsonlogic.movieticketbookingsystem.repository.TicketRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TicketServiceImpl implements TicketService{

    @Autowired
    private TicketRepository ticketRepository;

    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll();
    }

    public Optional<Ticket> getTicketById(String ticketId) {
        return ticketRepository.findById(ticketId);
    }

    public Ticket createTicket(Ticket ticket) {
        return ticketRepository.save(ticket);
    }

    public void deleteTicket(String ticketId) {
        ticketRepository.deleteById(ticketId);
    }
    
    public List<Ticket> getTicketsByBookingId(String bookingId) {
        return ticketRepository.findByBookingId(bookingId);
    }
}
