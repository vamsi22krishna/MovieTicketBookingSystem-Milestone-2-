package com.crimsonlogic.movieticketbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.crimsonlogic.movieticketbookingsystem.entity.User;
import com.crimsonlogic.movieticketbookingsystem.service.UserService;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * UserController.java
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
@RequestMapping("/users")
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * Displays the list of all users.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying all users
	 */
	// getting all users
	@GetMapping
	public String getAllUsers(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "users";
	}

	/**
	 * Retrieves and displays a user by its ID.
	 *
	 * @param id    the ID of the user
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying user details
	 */
	// getting user by Id
	@GetMapping("/{id}")
	public String getUserById(@PathVariable String id, Model model) {
		Optional<User> user = userService.getUserById(id);
		model.addAttribute("user", user.orElse(null));
		return "user";
	}

	/**
	 * Displays the registration form for users.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for the registration form
	 */
	// show registration form to user
	@GetMapping("/register")
	public String showRegistrationForm(Model model) {

		model.addAttribute("user", new User());
		return "register";
	}

	/**
	 * Registers a new user.
	 *
	 * @param user  the user object to be created
	 * @param model the model to pass attributes to the view
	 * @return a redirect to the login page after successful registration
	 */
	@PostMapping("/register")
	public String createUser(@ModelAttribute User user, Model model) {
		if (userService.checkUserByPhoneNumber(user.getPhone())) {
			model.addAttribute("error", "User with this phone number already exists.");
			return "register";
		}
		if (userService.findByEmail(user.getEmail()).isPresent()) {
			model.addAttribute("error", "Email already exists. Please try a different email.");
			return "register";
		}

		User newUser = userService.createUser(user);
		model.addAttribute("user", newUser);
		return "redirect:/users/login";
	}

	/**
	 * Deactivates a user by ID.
	 *
	 * @param id the ID of the user to be deleted
	 * @return a redirect to the list of users
	 */
	// deactivate user
	@DeleteMapping("/{id}")
	public String deleteUser(@PathVariable String id) {
		userService.deleteUser(id);
		return "redirect:/users";
	}

	/**
	 * Checks if a user exists by phone number.
	 *
	 * @param phone the phone number to check
	 * @param model the model to pass attributes to the view
	 * @return the view name for checking user existence
	 */
	// check by phone number
	@GetMapping("/checkByPhone")
	public String checkUserByPhoneNumber(@RequestParam String phone, Model model) {
		boolean exists = userService.checkUserByPhoneNumber(phone);
		model.addAttribute("exists", exists);
		return "checkUserByPhone";
	}

	/**
	 * Displays the login form for users.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for the login form
	 */
	// show login
	@GetMapping("/login")
	public String showLoginForm(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}

	/**
	 * Displays the admin dashboard.
	 *
	 * @param session the HTTP session
	 * @param model   the model to pass attributes to the view
	 * @return the view name for the admin dashboard
	 */
	// profile page
	@GetMapping("/dashboard")
	public String adminDashboard(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			model.addAttribute("user", user);
			return "admin";
		} else {
			return "redirect:/users/login";
		}
	}

	/**
	 * Displays the customer home page.
	 *
	 * @return the view name for the customer home page
	 */
	// Customer home page mapping
	@GetMapping("/home")
	public String customerHome() {
		return "customer/home";
	}

	/**
	 * Displays the customer dashboard.
	 *
	 * @param session the HTTP session
	 * @param model   the model to pass attributes to the view
	 * @return the view name for the customer dashboard
	 */
	// customer dashboard
	@GetMapping("/customerdashboard")
	public String customerDashboard(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			model.addAttribute("user", user);
			return "customer";
		} else {
			return "redirect:/users/login";
		}
	}

	/**
	 * Handles user login.
	 *
	 * @param user    the user object containing login credentials
	 * @param model   the model to pass attributes to the view
	 * @param session the HTTP session
	 * @return a redirect based on the user role or back to login with an error
	 */
	// login's the user
	@PostMapping("/login")
	public String loginUser(@ModelAttribute User user, Model model, HttpSession session) {
		Optional<User> existingUser = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (existingUser.isPresent()) {
			User loggedInUser = existingUser.get();
			session.setAttribute("user", loggedInUser);
			model.addAttribute("user", loggedInUser);

			if ("admin".equals(loggedInUser.getRole())) {
				return "redirect:/users/dashboard";
			} else if ("customer".equals(loggedInUser.getRole())) {
				return "redirect:/users/customerdashboard";
			} else {
				model.addAttribute("error", "Unknown role");
				return "login";
			}
		} else {
			model.addAttribute("error", "Invalid username or password");
			return "login";
		}
	}

	/**
	 * Logs out the user.
	 *
	 * @param request the HTTP request
	 * @return a redirect to the login page
	 */
	// user logout
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/users/login";
	}

	/**
	 * Displays the forgot password form.
	 *
	 * @return the view name for the forgot password form
	 */
	// forgot password
	@GetMapping("/forgotpassword")
	public String showForgotPasswordForm() {
		return "forgetPassword";
	}

	/**
	 * Displays the contact form.
	 *
	 * @return the view name for the contact form
	 */
	// contact form
	@GetMapping("/contact")
	public String contactForm() {
		return "contact";
	}

	/**
	 * Handles password reset.
	 *
	 * @param email    the email of the user
	 * @param password the new password
	 * @param model    the model to pass attributes to the view
	 * @return a redirect to the login page after successful reset or back to the
	 *         form with an error
	 */
	// Handle password reset
	@PostMapping("/resetpassword")
	public String resetPassword(@RequestParam String email, @RequestParam String password, Model model) {

		Optional<User> user = userService.findByEmail(email);
		if (user.isPresent()) {
			userService.updatePassword(user.get(), password);
			model.addAttribute("message", "Your password has been reset successfully.");
			return "redirect:/users/login";
		} else {
			model.addAttribute("error", "Invalid request.");
			return "forgotPassword";
		}
	}

}
