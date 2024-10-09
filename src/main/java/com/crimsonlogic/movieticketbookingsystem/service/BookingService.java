package com.crimsonlogic.movieticketbookingsystem.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.Booking;
import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Show;
import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;

public interface BookingService {

	public List<Booking> getAllBookings();

	public Optional<Booking> getBookingById(String bookingId);

	public Booking createBooking(Booking booking);

	public void deleteBooking(String bookingId);

	List<Booking> getBookingsByScreenAndShow(String screenId, String showId);

	List<Booking> getBookingsByScreenShowAndDate(String screenId, String showId, Date showDate);

	List<Booking> getBookingsByUserId(String userId);

}
