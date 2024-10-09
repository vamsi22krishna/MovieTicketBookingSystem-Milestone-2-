package com.crimsonlogic.movieticketbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.crimsonlogic.movieticketbookingsystem.dto.ScreenListWrapper;
import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;
import com.crimsonlogic.movieticketbookingsystem.exception.ResourceNotFoundException;
import com.crimsonlogic.movieticketbookingsystem.repository.ScreenRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.TheatreRepository;
import com.crimsonlogic.movieticketbookingsystem.service.ScreenService;
import com.crimsonlogic.movieticketbookingsystem.service.TheatreService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
/**
 * TheatreController.java
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
@RequestMapping("/theatres")
public class TheatreController {

	@Autowired
	private TheatreService theatreService;

	@Autowired
	private ScreenService screenService;

	@Autowired
	private TheatreRepository theatreRepository;

	@Autowired
	private ScreenRepository screenRepository;
	/**
     * Displays the list of all theatres.
     *
     * @param model the model to pass attributes to the view
     * @return the view name for displaying all theatres
     */
	// view for theatres
	@GetMapping("/viewtheatres")
	public String viewTheatres(Model model) {
		List<Theatre> theatres = theatreService.getAllTheatres();
		model.addAttribute("theatres", theatres);
		return "viewtheatres"; 
	}
	/**
     * Displays the list of all screens.
     *
     * @param model the model to pass attributes to the view
     * @return the view name for displaying all screens
     */
	// view from screens
	@GetMapping("/viewscreens")
	public String viewScreens(Model model) {
		List<Screen> screen = screenService.getAllScreens();
		model.addAttribute("screens", screen);

		return "viewScreens"; 
	}
	/**
     * Retrieves and displays a theatre by its ID.
     *
     * @param id the ID of the theatre
     * @param model the model to pass attributes to the view
     * @return the view name for displaying theatre details
     */
    //get theatre by Id
	@GetMapping("/{id}")
	public String getTheatreById(@PathVariable String id, Model model) {
		Optional<Theatre> theatre = theatreService.getTheatreById(id);
		model.addAttribute("theatre", theatre.orElse(null));
		return "theatre";
	}
	/**
     * Creates a new theatre and redirects to the list of theatres.
     *
     * @param theatre the theatre object to be created
     * @param model the model to pass attributes to the view
     * @return a redirect to the list of theatres after successful creation
     */
	//add the theatre
	@PostMapping("/addtheatre")
	public String createTheatre(@ModelAttribute Theatre theatre, Model model) {
		Theatre newTheatre = theatreService.createTheatre(theatre);
		model.addAttribute("theatre", newTheatre);
		return "redirect:/theatres/viewtheatres"; 
	}
	 /**
     * Displays the form for adding a new theatre.
     *
     * @param model the model to pass attributes to the view
     * @return the view name for the add theatre form
     */
    
	//add theatre view
	@GetMapping("/addtheatre")
	public String showAddTheatreForm(Model model) {
		model.addAttribute("theatre", new Theatre());
		return "addTheatre";
	}
	/**
     * Adds screens to a specific theatre.
     *
     * @param theatreId the ID of the theatre
     * @param screenListWrapper a wrapper containing a list of screens to be added
     * @param model the model to pass attributes to the view
     * @return a redirect to the view screens page for the specified theatre
     * @throws ResourceNotFoundException if the theatre is not found
     */
	//add screens
	@PostMapping("/{theatreId}/addscreens")
	public String addScreens(@PathVariable String theatreId, @ModelAttribute ScreenListWrapper screenListWrapper,
			Model model) throws ResourceNotFoundException {
		Optional<Theatre> existingTheatre = theatreService.getTheatreById(theatreId);
		if (!existingTheatre.isPresent()) {
			throw new ResourceNotFoundException("No theater found");
		}
		Theatre theatreEntity = existingTheatre.get();
		for (Screen screen : screenListWrapper.getScreens()) {
			screen.setTheatre(theatreEntity);
			screenService.createScreen(screen);
		}
		return "redirect:/theatres/" + theatreId + "/viewscreens"; 
	}
	 /**
     * Displays the screens for a specific theatre.
     *
     * @param theatreId the ID of the theatre
     * @param model the model to pass attributes to the view
     * @return the view name for displaying the screens of the theatre
     * @throws ResourceNotFoundException if the theatre is not found
     */
	//view screens for that theatre
	@GetMapping("/{theatreId}/viewscreens")
	public String viewScreens(@PathVariable String theatreId, Model model) throws ResourceNotFoundException {
		Optional<Theatre> existingTheatre = theatreService.getTheatreById(theatreId);
		if (!existingTheatre.isPresent()) {
			throw new ResourceNotFoundException("No theater found");
		}
		Theatre theatre = existingTheatre.get();
		List<Screen> screens = screenService.getScreensByTheatreId(theatreId);
		model.addAttribute("screens", screens);
		model.addAttribute("theatre", theatre);
		return "viewScreens"; 
	}

	/**
     * Displays the form for adding screens to a specific theatre.
     *
     * @param theatreId the ID of the theatre
     * @param totalScreens the total number of screens to add
     * @param model the model to pass attributes to the view
     * @return the view name for the add screens page
     */
	//add screens
	@GetMapping("/{theatreId}/addscreens")
	public String showAddScreensForm(@PathVariable String theatreId, @RequestParam int totalScreens, Model model) {
		model.addAttribute("theatreId", theatreId);
		model.addAttribute("totalScreens", totalScreens);
		return "addScreen"; 
	}

}
