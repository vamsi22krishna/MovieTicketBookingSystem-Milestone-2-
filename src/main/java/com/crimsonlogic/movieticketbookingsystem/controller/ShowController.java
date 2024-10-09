package com.crimsonlogic.movieticketbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.crimsonlogic.movieticketbookingsystem.entity.Booking;
import com.crimsonlogic.movieticketbookingsystem.entity.Show;
import com.crimsonlogic.movieticketbookingsystem.entity.Ticket;
import com.crimsonlogic.movieticketbookingsystem.exception.ResourceNotFoundException;
import com.crimsonlogic.movieticketbookingsystem.repository.BookingRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.ShowRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.TheatreRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.TicketRepository;
import com.crimsonlogic.movieticketbookingsystem.service.MovieService;
import com.crimsonlogic.movieticketbookingsystem.service.ScreenService;
import com.crimsonlogic.movieticketbookingsystem.service.ShowService;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

/**
 * ShowController.java
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
@RequestMapping("/shows")
public class ShowController {

	@Autowired
	private ShowService showService;

	@Autowired
	private MovieService movieService;

	@Autowired
	private ScreenService screenService;

	@Autowired
	private ShowRepository showRepository;



	@Autowired
	private TicketRepository ticketRepository;

	@Autowired
	private BookingRepository bookingRepository;

	/**
	 * Retrieves and displays all shows.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying all shows
	 */
	// method to get all shows
	@GetMapping
	public String getAllShows(Model model) {
		List<Show> shows = showService.getAllShows();
		model.addAttribute("shows", shows);
		return "showList"; // JSP page name
	}

	/**
	 * Retrieves and displays a show by its ID.
	 *
	 * @param id    the ID of the show
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying show details
	 */
	// Getting the show by Id
	@GetMapping("/{id}")
	public String getShowById(@PathVariable String id, Model model) {
		Optional<Show> show = showService.getShowById(id);
		model.addAttribute("show", show.orElse(null));
		return "show"; // JSP page name
	}

	/**
	 * Displays the form for adding a new show.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for the add show form
	 */
	// to display the add show form
	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("show", new Show());
		model.addAttribute("movies", movieService.getAllMovies());
		model.addAttribute("screens", screenService.getAllScreens());
		return "addShows";
	}

	/**
	 * Creates a new show and redirects to the list of shows.
	 *
	 * @param show  the show object to be created
	 * @param model the model to pass attributes to the view
	 * @return a redirect to the list of shows after successful creation
	 */
	// method to create a show
	@PostMapping("/add")
	public String createShow(@ModelAttribute Show show, Model model) {
		try {
			if (show.getShowDate() == null || show.getShowTime() == null) {
				throw new ResourceNotFoundException("All fields are required to add a show.");
			}
			Show newShow = showService.createShow(show);
			model.addAttribute("show", newShow);

		} catch (ResourceNotFoundException ex) {
			model.addAttribute("error", ex.getMessage());
			return "addShows"; // Return to the add show page
		}
		
		return "redirect:/shows"; // Redirect to the list of shows
	}

	/**
	 * Displays the form for editing an existing show.
	 *
	 * @param showId the ID of the show to edit
	 * @param model  the model to pass attributes to the view
	 * @return the view name for the edit show form
	 */
	// editing the show
	@GetMapping("/edit/{id}")
	public String showEditForm(@PathVariable("id") String showId, Model model) {
		Show show = showService.getShowById(showId)
				.orElseThrow(() -> new IllegalArgumentException("Invalid show Id:" + showId));
		model.addAttribute("show", show);
		model.addAttribute("movies", movieService.getAllMovies());
		model.addAttribute("screens", screenService.getAllScreens());
		return "editShow";
	}

	/**
	 * Updates an existing show and redirects to the list of shows.
	 *
	 * @param showId the ID of the show to update
	 * @param show   the updated show object
	 * @return a redirect to the list of shows after successful update
	 */
	// upadate the show
	@PostMapping("/edit/{id}")
	public String updateShow(@PathVariable("id") String showId, @ModelAttribute Show show) {
		show.setShowId(showId);
		showService.createShow(show);
		return "redirect:/shows";
	}

	/**
	 * Deletes a show by its ID and redirects to the list of shows.
	 *
	 * @param id the ID of the show to delete
	 * @return a redirect to the list of shows after deletion
	 */
	// deleting the show
	@GetMapping("/delete/{id}")
	public String deleteShow(@PathVariable String id) {
		showService.deleteShow(id);
		return "redirect:/shows"; 
	}

}
