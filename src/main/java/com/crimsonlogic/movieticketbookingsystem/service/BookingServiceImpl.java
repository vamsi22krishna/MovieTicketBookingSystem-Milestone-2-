package com.crimsonlogic.movieticketbookingsystem.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.movieticketbookingsystem.entity.Booking;
import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Show;
import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;
import com.crimsonlogic.movieticketbookingsystem.entity.User;
import com.crimsonlogic.movieticketbookingsystem.repository.BookingRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.ScreenRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.ShowRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.TheatreRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.TicketRepository;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class BookingServiceImpl implements BookingService {
	
	    @Autowired
	    private BookingRepository bookingRepository;
	

	    @Autowired
	    private TicketRepository ticketRepository;

	    @Autowired
	    private TheatreRepository theatreRepository;

	    @Autowired
	    private ScreenRepository screenRepository;

	    @Autowired
	    private ShowRepository showRepository;
	    
	    public List<Booking> getAllBookings() {
	        return bookingRepository.findAll();
	    }

	    public Optional<Booking> getBookingById(String bookingId) {
	        return bookingRepository.findById(bookingId);
	    }

	    public Booking createBooking(Booking booking) {
	    	
	        return bookingRepository.save(booking);
	        
	    	
	    }

	    public void deleteBooking(String bookingId) {
	        bookingRepository.deleteById(bookingId);
	    }
	    public List<Booking> getBookingsByScreenAndShow(String screenId, String showId) {
	        return bookingRepository.findByScreenIdAndShowId(screenId, showId);
	    }
	    
	    
	    
	    public List<Booking> getBookingsByScreenShowAndDate(String screenId, String showId, Date showDate) {
	        // Implemented this method to fetch bookings based on screenId, showId, and showDate
	        return bookingRepository.findByScreenIdAndShowIdAndShowDate(screenId, showId, showDate);
	    }
	    
	    public List<Booking> getBookingsByUserId(String userId) {
	    	   return bookingRepository.findBookingsByUserId(userId);
	    }


			    
	    
	    
	    
		
	}


