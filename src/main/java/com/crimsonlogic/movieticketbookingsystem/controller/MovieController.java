package com.crimsonlogic.movieticketbookingsystem.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.crimsonlogic.movieticketbookingsystem.entity.Movie;
import com.crimsonlogic.movieticketbookingsystem.entity.User;
import com.crimsonlogic.movieticketbookingsystem.exception.ResourceNotFoundException;
import com.crimsonlogic.movieticketbookingsystem.repository.MovieRepository;
import com.crimsonlogic.movieticketbookingsystem.service.MovieService;
import com.crimsonlogic.movieticketbookingsystem.service.ScreenService;
import com.crimsonlogic.movieticketbookingsystem.service.UserService;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

/**
 * MovieController.java
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
@RequestMapping("/movies")
public class MovieController {

	@Autowired
	private MovieService movieService;

	@Autowired
	private ScreenService screenService;

	@Autowired
	private UserService userService;

	@Autowired
	private MovieRepository movieRepository;

	private static final Logger LOG = LoggerFactory.getLogger(MovieController.class);

	private static final String UPLOADED_FOLDER = "postures/";

	/**
	 * Retrieves and displays all movies.
	 *
	 * @param model   the model to pass attributes to the view
	 * @param session the HTTP session to retrieve user information
	 * @return the view name for displaying all movies
	 */
	// method to get all movies
	@GetMapping
	public String getAllMovies(Model model, HttpSession session) {
		List<Movie> movies = movieService.getAllMovies();
		model.addAttribute("movies", movies);
		model.addAttribute("users", new User());
		User user = (User) session.getAttribute("user");
		String userRole = user.getRole();
		model.addAttribute("userRole", userRole);
		return "movies";
	}

	/**
	 * Retrieves and displays a list of movies for customers.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for the customer movie list
	 */
	// method to get movielist
	@GetMapping("movielist")
	public String getAMovies(Model model) {
		List<Movie> movies = movieService.getAllMovies();
		model.addAttribute("movies", movies);
		return "customerList";
	}

	/**
	 * Retrieves and displays a movie by its ID.
	 *
	 * @param id      the ID of the movie
	 * @param model   the model to pass attributes to the view
	 * @param session the HTTP session to retrieve user information
	 * @return the view name for displaying movie details
	 */
	// method getting by Id
	@GetMapping("/{id}")
	public String getMovieById(@PathVariable String id, Model model, HttpSession session) {
		Movie movie = movieService.getMovieById(id).orElse(null);
		model.addAttribute("movie", movie);
		User user = (User) session.getAttribute("user");
		String userRole = user.getRole();
		model.addAttribute("userRole", userRole);
		model.addAttribute("user", user);
		return "movieDetails";
	}

	/**
	 * Displays the form for creating a new movie.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for the movie creation form
	 */
	// method for getting the form for adding the movie
	@GetMapping("/new")
	public String showCreateMovieForm(Model model) {
		model.addAttribute("screens", screenService.getAllScreens());
		model.addAttribute("movie", new Movie());
		return "createMovie";
	}

	/**
	 * Adds a new movie based on the provided parameters.
	 *
	 * @param params the request parameters for the new movie
	 * @param model  the model to pass attributes to the view
	 * @return a redirect to the movie list after successful addition
	 */
//method to add the movie
	@PostMapping("/add")
	public String addMovie(@RequestParam Map<String, String> params, Model model) {
		params.forEach((key, value) -> System.out.println(key + " : " + value));

		String title = params.get("title");
		String genre = params.get("genre");
		String imageUrl = params.get("imageUrl");
		int duration = Integer.parseInt(params.get("duration"));

		String directorName = params.get("director");
		String description = params.get("description");
		BigDecimal price = new BigDecimal(params.get("price"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		try {
			utilDate = dateFormat.parse(params.get("releaseDate"));
		} catch (ParseException e) {
			e.printStackTrace();
			model.addAttribute("message", "Invalid date format");
			return "createMovie";
		}

		Date sqlDate = new Date(utilDate.getTime());

		Movie movie = new Movie();
		movie.setTitle(title);
		movie.setGenre(genre);
		movie.setDuration(duration);
		movie.setReleaseDate(sqlDate);
		movie.setDirectorName(directorName);
		movie.setAbout(description);

		movie.setImageUrl(imageUrl);
		movie.setTicketPrice(price);
		System.out.println("image added successfully");
		movieService.createMovie(movie);
		model.addAttribute("message", "Movie added successfully");

		return "redirect:/movies";
	}

	/**
	 * Deletes a movie by its ID.
	 *
	 * @param id the ID of the movie to delete
	 * @return a redirect to the movie list after deletion
	 */
	// deactivate movie by id
	@GetMapping("/delete/{id}")
	public String deleteMovie(@PathVariable String id) {
		movieService.deleteMovie(id);
		return "redirect:/movies";
	}

	/**
	 * Searches and displays movies by their title.
	 *
	 * @param title the title to search for
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying movies
	 */
	// find movies by there title
	@GetMapping("/search/title")
	public String findMoviesByTitle(@RequestParam String title, Model model) {
		List<Movie> movies = movieService.findMoviesByTitle(title);
		model.addAttribute("movies", movies);
		return "movies";
	}

	/**
	 * Searches and displays movies by their genre.
	 *
	 * @param genre the genre to search for
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying movies
	 */
	// find movies by genre
	@GetMapping("/search/genre")
	public String findMoviesByGenre(@RequestParam String genre, Model model) {
		List<Movie> movies = movieService.findMoviesByGenre(genre);
		model.addAttribute("movies", movies);
		return "movies";
	}
}
