package com.crimsonlogic.movieticketbookingsystem.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crimsonlogic.movieticketbookingsystem.entity.Booking;
import com.crimsonlogic.movieticketbookingsystem.entity.Movie;
import com.crimsonlogic.movieticketbookingsystem.entity.Payment;
import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Show;
import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;
import com.crimsonlogic.movieticketbookingsystem.entity.Ticket;
import com.crimsonlogic.movieticketbookingsystem.entity.User;
import com.crimsonlogic.movieticketbookingsystem.service.BookingService;
import com.crimsonlogic.movieticketbookingsystem.service.MovieService;
import com.crimsonlogic.movieticketbookingsystem.service.PaymentService;
import com.crimsonlogic.movieticketbookingsystem.service.ScreenService;
import com.crimsonlogic.movieticketbookingsystem.service.ShowService;
import com.crimsonlogic.movieticketbookingsystem.service.TheatreService;
import com.crimsonlogic.movieticketbookingsystem.service.TicketService;
import com.crimsonlogic.movieticketbookingsystem.service.UserService;

/**
 * BookingController.java
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
@RequestMapping("/bookings")
public class BookingController {

	@Autowired
	private BookingService bookingService;

	@Autowired
	private TheatreService theatreService;

	@Autowired
	private ScreenService screenService;

	@Autowired
	private ShowService showService;

	@Autowired
	private UserService userService;

	@Autowired
	private MovieService movieService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private TicketService ticketservice;

	/**
	 * Displays available theatres, screens, and shows for a selected movie.
	 *
	 * @param movieId the ID of the selected movie
	 * @param model   the model to pass attributes to the view
	 * @param session the HTTP session to retrieve user information
	 * @return the view name for booking selection
	 */
	// method to select the theatrescreenshow
	@GetMapping("/select")
	public String selectTheatreScreenShow(@RequestParam("movieId") String movieId, Model model, HttpSession session) {
		model.addAttribute("theatres", showService.getAllTheatres());

		List<Screen> allScreens = showService.getAllScreens();
		// Filter shows based on the movie ID
		List<Show> shows = showService.getAllShows().stream()
				.filter(show -> show.getMovie().getMovieId().equals(movieId)).collect(Collectors.toList());

		model.addAttribute("shows", shows);

		// Filter screens based on filtered shows
		List<Screen> filteredScreens = allScreens.stream().filter(
				screen -> shows.stream().anyMatch(show -> show.getScreen().getScreenId().equals(screen.getScreenId())))
				.collect(Collectors.toList());

		model.addAttribute("screens", filteredScreens);

		// Fetch the movie details based on movieId
		Optional<Movie> movieOpt = movieService.getMovieById(movieId);
		if (movieOpt.isPresent()) {
			Movie movie = movieOpt.get();
			model.addAttribute("releaseDate", movie.getReleaseDate());
		} else {

			model.addAttribute("releaseDate", "Unknown");
		}

		User user = (User) session.getAttribute("user");
		model.addAttribute("users", user);

		return "bookings";
	}

	/**
	 * Handles form submission for selecting seats based on theatre, screen, and
	 * show.
	 *
	 * @param theatreId the ID of the selected theatre
	 * @param screenId  the ID of the selected screen
	 * @param showId    the ID of the selected show
	 * @param userId    the ID of the user
	 * @param showDate  the date of the show
	 * @param model     the model to pass attributes to the view
	 * @param session   the HTTP session to maintain state
	 * @return the view name for seat selection
	 */
	// Handle form submission for selecting theatre, screen, and show
	@PostMapping("/selectSeats")
	public String selectSeats(@RequestParam("theatreId") String theatreId, @RequestParam("screenId") String screenId,
			@RequestParam("showId") String showId, @RequestParam("userId") String userId,
			@RequestParam("showDate") Date showDate, Model model, HttpSession session) {

		Screen screen = screenService.getScreenById(screenId).orElse(null);
		if (screen != null) {
			model.addAttribute("totalSeats", screen.getTotalSeats());

			model.addAttribute("theatreId", theatreId);
			model.addAttribute("screenId", screenId);
			model.addAttribute("showId", showId);
			model.addAttribute("userId", userId);

			List<Booking> bookings = bookingService.getBookingsByScreenShowAndDate(screenId, showId, showDate);
			List<Integer> bookedSeats = bookings.stream().map(Booking::getSeatNumber).collect(Collectors.toList());
			model.addAttribute("bookedSeats", bookedSeats);
			model.addAttribute("showDate", showDate);

			session.setAttribute("show", new Show());

		}
		return "selectSeats";
	}

	/**
	 * Prepares the payment form with relevant booking details.
	 *
	 * @param theatreId  the ID of the selected theatre
	 * @param userId     the ID of the user
	 * @param screenId   the ID of the selected screen
	 * @param showId     the ID of the selected show
	 * @param seatIds    the list of selected seat IDs
	 * @param totalPrice the total price for the booking
	 * @param showDate   the date of the show
	 * @param model      the model to pass attributes to the view
	 * @return the view name for the payment form
	 */
	// method to handle the payment process form
	@PostMapping("/payment")
	public String payment(@RequestParam("theatreId") String theatreId, @RequestParam("userId") String userId,
			@RequestParam("screenId") String screenId, @RequestParam("showId") String showId,
			@RequestParam("seatId") List<Integer> seatIds, @RequestParam("totalPrice") Double totalPrice,
			@RequestParam("showDate") Date showDate, Model model) {

		model.addAttribute("theatreId", theatreId);
		model.addAttribute("userId", userId);
		model.addAttribute("screenId", screenId);
		model.addAttribute("showId", showId);
		model.addAttribute("seatId", seatIds);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("showDate", showDate);

		return "paymentForm";
	}

	/**
	 * Processes the payment and confirms the booking.
	 *
	 * @param paymentMethod the method of payment
	 * @param amount        the amount to be charged
	 * @param theatreId     the ID of the selected theatre
	 * @param userId        the ID of the user
	 * @param screenId      the ID of the selected screen
	 * @param showId        the ID of the selected show
	 * @param seatIds       the list of selected seat IDs
	 * @param showDate      the date of the show
	 * @param session       the HTTP session to maintain state
	 * @param model         the model to pass attributes to the view
	 * @return the view name for booking confirmation or an error page
	 */
	// method to process payment
	@PostMapping("/processPayment")
	public String processPayment(@RequestParam("paymentMethod") String paymentMethod,
			@RequestParam("amount") Double amount, @RequestParam("theatreId") String theatreId,
			@RequestParam("userId") String userId, @RequestParam("screenId") String screenId,
			@RequestParam("showId") String showId, @RequestParam("seatId") List<Integer> seatIds,
			@RequestParam("showDate") Date showDate, HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		Optional<Theatre> theatreOpt = theatreService.getTheatreById(theatreId);
		Optional<Screen> screenOpt = screenService.getScreenById(screenId);
		Optional<Show> showOpt = showService.getShowById(showId);

		if (theatreOpt.isPresent() && screenOpt.isPresent() && showOpt.isPresent()) {
			Theatre theatre = theatreOpt.get();
			Screen screen = screenOpt.get();
			Show show = showOpt.get();

			Payment payment = new Payment();
			payment.setPaymentMethod(paymentMethod);
			payment.setPaymentDate(LocalDateTime.now());
			payment.setAmount(amount);
			paymentService.createPayment(payment);

			List<Booking> bookings = new ArrayList<>();
			List<String> currentBookingIds = new ArrayList<>();
			for (Integer seatId : seatIds) {
				Booking booking = new Booking();
				booking.setUser(user);
				booking.setTheatre(theatre);
				booking.setScreen(screen);
				booking.setShow(show);
				booking.setSeatNumber(seatId);
				booking.setTotalPrice(BigDecimal.valueOf(amount / seatIds.size()));
				booking.setShowDate(showDate);
				booking.setPayment(payment);
				bookingService.createBooking(booking);

				bookings.add(booking);
				currentBookingIds.add(booking.getBookingId());

				Ticket ticket = new Ticket();
				ticket.setBooking(booking);
				ticket.setShow(show);
				ticket.setTheatre(theatre);
				ticketservice.createTicket(ticket);

				model.addAttribute("booking", booking);
				model.addAttribute("ticket", ticket);
			}

			payment.setBookings(bookings); 
			session.setAttribute("currentBookingIds", currentBookingIds);
			model.addAttribute("payment", payment);
			model.addAttribute("seatNumbers", seatIds);

			return "bookingConfirmation";
		} else {

			return "errorPage";
		}
	}

	/**
	 * Confirms the booking after payment processing.
	 *
	 * @param theatreId  the ID of the selected theatre
	 * @param userId     the ID of the user
	 * @param screenId   the ID of the selected screen
	 * @param showId     the ID of the selected show
	 * @param seatIds    the list of selected seat IDs
	 * @param totalPrice the total price for the booking
	 * @param session    the HTTP session to maintain state
	 * @param model      the model to pass attributes to the view
	 * @return the view name for booking confirmation or an error page
	 */
//method for confirmBooking
	@PostMapping("confirmBooking")
	public String confirmBooking(@RequestParam("theatreId") String theatreId, @RequestParam("userId") String userId,
			@RequestParam("screenId") String screenId, @RequestParam("showId") String showId,
			@RequestParam("seatId") List<Integer> seatIds, @RequestParam("amount") BigDecimal totalPrice,
			HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		Optional<Theatre> theatreOpt = theatreService.getTheatreById(theatreId);
		Optional<Screen> screenOpt = screenService.getScreenById(screenId);
		Optional<Show> showOpt = showService.getShowById(showId);

		if (theatreOpt.isPresent() && screenOpt.isPresent() && showOpt.isPresent()) {
			Theatre theatre = theatreOpt.get();
			Screen screen = screenOpt.get();
			Show show = showOpt.get();

			for (Integer seatId : seatIds) {
				Booking booking = new Booking();
				booking.setUser(user);
				booking.setTheatre(theatre);
				booking.setScreen(screen);
				booking.setShow(show);
				booking.setSeatNumber(seatId);
				booking.setTotalPrice(totalPrice);
				bookingService.createBooking(booking);
				model.addAttribute("booking", booking);
			}

			return "bookingConfirmation";
		} else {

			return "errorPage";
		}
	}

	/**
	 * Displays the bookings of the logged-in user.
	 *
	 * @param model   the model to pass attributes to the view
	 * @param session the HTTP session to retrieve user information
	 * @return the view name for user bookings or a redirect to the login page
	 */
	// method to vie bookings of user by his Id
	@GetMapping("/view")
	public String viewBookings(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user"); // Retrieve user from session
		if (loggedInUser != null) {
			String userId = loggedInUser.getUserId(); // Assuming the User entity has a getId() method
			List<Booking> bookings = bookingService.getBookingsByUserId(userId);

			model.addAttribute("bookings", bookings);
			return "userBookings";
		} else {
			return "redirect:/login";
		}
	}

	/**
	 * Displays all bookings for admin review.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for admin bookings
	 */
	// method to view the all users bookings
	@GetMapping("/all")
	public String viewAllBookings(Model model) {
		List<Booking> bookings = bookingService.getAllBookings();
		model.addAttribute("bookings", bookings);
		return "adminBookings";
	}

	/**
	 * Retrieves and displays all bookings.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for bookings
	 */
	// method to get the bookings form
	@GetMapping
	public String getAllBookings(Model model) {
		List<Booking> bookings = bookingService.getAllBookings();
		model.addAttribute("bookings", bookings);
		return "bookings";
	}

	/**
	 * Retrieves a booking by its ID for detailed view.
	 *
	 * @param id    the ID of the booking
	 * @param model the model to pass attributes to the view
	 * @return the view name for the booking detail
	 */
	// method to get bookings by Id
	@GetMapping("/{id}")
	public String getBookingById(@PathVariable String id, Model model) {
		Optional<Booking> booking = bookingService.getBookingById(id);
		model.addAttribute("booking", booking.orElse(null));
		return "booking";
	}

	/**
	 * Creates a new booking.
	 *
	 * @param booking the booking details to create
	 * @param model   the model to pass attributes to the view
	 * @return a redirect to the list of bookings
	 */
	// method to create bookings
	@PostMapping
	public String createBooking(@ModelAttribute Booking booking, Model model) {
		Booking newBooking = bookingService.createBooking(booking);
		model.addAttribute("booking", newBooking);
		return "redirect:/bookings"; // Redirect to the list of bookings
	}

	/**
	 * Deletes a booking by its ID.
	 *
	 * @param id the ID of the booking to delete
	 * @return a redirect to the list of bookings
	 */
	@DeleteMapping("/{id}")
	public String deleteBooking(@PathVariable String id) {
		bookingService.deleteBooking(id);
		return "redirect:/bookings"; // Redirect to the list of bookings
	}

	/**
	 * Displays the form for selecting a theatre.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for booking selection
	 */
	// method to select the theatre
	@GetMapping("/selectTheatre")
	public String selectTheatre(Model model) {
		List<Theatre> theatres = theatreService.getAllTheatres();
		List<Screen> screens = screenService.getAllScreens();
		List<Show> shows = showService.getAllShows();
		model.addAttribute("theatres", theatres);
		model.addAttribute("screens", screens);
		model.addAttribute("shows", shows);
		return "bookings";
	}

}
