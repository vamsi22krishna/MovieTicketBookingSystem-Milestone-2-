package com.crimsonlogic.movieticketbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.service.ScreenService;
import com.crimsonlogic.movieticketbookingsystem.service.TheatreService;

import java.util.List;
import java.util.Optional;

/**
 * ScreenController.java
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
@RequestMapping("/screens")
public class ScreenController {

    @Autowired
    private ScreenService screenService;

    @Autowired
    private TheatreService theatreService;
    
    /**
     * Retrieves and displays all screens.
     *
     * @param model the model to pass attributes to the view
     * @return the view name for displaying all screens
     */
    //method to get all screens
    @GetMapping
    public String getAllScreens(Model model) {
        List<Screen> screens = screenService.getAllScreens();
        model.addAttribute("screens", screens);      
        return "viewScreens"; 
    }
    /**
     * Shows the form to add a new screen.
     *
     * @param model the model to pass attributes to the view
     * @return the view name for the add screen form
     */
    //method to add the screen
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("screen", new Screen());
        model.addAttribute("theatres", theatreService.getAllTheatres());
        return "addScreen";
    }
    /**
     * Shows the edit form for an existing screen.
     *
     * @param screenId the ID of the screen to edit
     * @param model the model to pass attributes to the view
     * @return the view name for the edit screen form
     */
    //method to show the edit form of screen
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String screenId, Model model) {
        Screen screen = screenService.getScreenById(screenId).orElseThrow(() -> new IllegalArgumentException("Invalid screen Id:" + screenId));
        model.addAttribute("screen", screen);
        model.addAttribute("theatres", theatreService.getAllTheatres());
        return "editScreen";
    }
    /**
     * Updates the details of an existing screen.
     *
     * @param screenId the ID of the screen to update
     * @param screen the updated screen object
     * @return a redirect to the list of screens after the update
     */
    //edit the screen of movie
    @PostMapping("/edit/{id}")
    public String updateScreen(@PathVariable("id") String screenId, @ModelAttribute Screen screen) {
        screen.setScreenId(screenId);
        screenService.createScreen(screen);
        return "redirect:/screens";
    }
    /**
     * Retrieves and displays a screen by its ID.
     *
     * @param id the ID of the screen
     * @param model the model to pass attributes to the view
     * @return the view name for displaying screen details
     */
    //find  the screen by Id
    @GetMapping("/{id}")
    public String getScreenById(@PathVariable String id, Model model) {
        Optional<Screen> screen = screenService.getScreenById(id);
        model.addAttribute("screen", screen.orElse(null));
        return "screen"; 
    }
    /**
     * Creates a new screen and redirects to the list of screens.
     *
     * @param screen the screen object to be created
     * @param model the model to pass attributes to the view
     * @return a redirect to the list of screens after successful creation
     */
    //add the screen 
    @PostMapping("/add")
    public String createScreen(@ModelAttribute Screen screen, Model model) {
        Screen newScreen = screenService.createScreen(screen);
        model.addAttribute("screen", newScreen);
        return "redirect:/screens"; 
    }


}
