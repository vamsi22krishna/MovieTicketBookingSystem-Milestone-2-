package com.crimsonlogic.movieticketbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.crimsonlogic.movieticketbookingsystem.entity.Booking;
import com.crimsonlogic.movieticketbookingsystem.entity.Ticket;
import com.crimsonlogic.movieticketbookingsystem.service.BookingService;
import com.crimsonlogic.movieticketbookingsystem.service.TicketService;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BarcodeQRCode;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

/**
 * TicketController.java
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
@RequestMapping("/tickets")
public class TicketController {

	@Autowired
	private TicketService ticketService;

	@Autowired
	private BookingService bookingService;

	/**
	 * Fetches all tickets and adds them to the model for display.
	 *
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying all tickets
	 */
	// Fetches all tickets and adds them to the model for display.
	@GetMapping
	public String getAllTickets(Model model) {
		List<Ticket> tickets = ticketService.getAllTickets();
		model.addAttribute("tickets", tickets);
		return "tickets";
	}

	/**
	 * Fetches a ticket by its ID and adds it to the model for display.
	 *
	 * @param id    the ID of the ticket
	 * @param model the model to pass attributes to the view
	 * @return the view name for displaying ticket details
	 */
	// Fetches a ticket by its ID and adds it to the model for display
	@GetMapping("/{id}")
	public String getTicketById(@PathVariable String id, Model model) {
		Optional<Ticket> ticket = ticketService.getTicketById(id);
		model.addAttribute("ticket", ticket.orElse(null));
		return "ticket";
	}

	/**
	 * Creates a new ticket and redirects to the ticket list page.
	 *
	 * @param ticket the ticket object to be created
	 * @param model  the model to pass attributes to the view
	 * @return a redirect to the list of tickets after successful creation
	 */
// Creates a new ticket and redirects to the ticket list page.
	@PostMapping
	public String createTicket(@ModelAttribute Ticket ticket, Model model) {
		Ticket newTicket = ticketService.createTicket(ticket);
		model.addAttribute("ticket", newTicket);
		return "redirect:/tickets";
	}

	/**
	 * Deletes a ticket by its ID and redirects to the ticket list page.
	 *
	 * @param id the ID of the ticket to be deleted
	 * @return a redirect to the list of tickets after deletion
	 */
//Deletes a ticket by its ID and redirects to the ticket list page.
	@DeleteMapping("/{id}")
	public String deleteTicket(@PathVariable String id) {
		ticketService.deleteTicket(id);
		return "redirect:/tickets";
	}

	/**
	 * Generates and downloads a PDF containing tickets associated with current
	 * bookings.
	 *
	 * @param session the HTTP session containing current booking IDs
	 * @return a ResponseEntity containing the generated PDF as an
	 *         InputStreamResource
	 * @throws IOException       if an I/O error occurs
	 * @throws DocumentException if an error occurs while creating the PDF document
	 */
//Generates and downloads a PDF containing tickets associated with current bookings
	@GetMapping("/downloadTicket")
	public ResponseEntity<InputStreamResource> downloadTickets(HttpSession session)
			throws IOException, DocumentException {

		List<String> currentBookingIds = (List<String>) session.getAttribute("currentBookingIds");

		List<Ticket> tickets = new ArrayList<>();
		for (String bookingId : currentBookingIds) {
			Optional<Booking> bookingOpt = bookingService.getBookingById(bookingId);
			if (bookingOpt.isPresent()) {
				Booking booking = bookingOpt.get();
				tickets.addAll(ticketService.getTicketsByBookingId(bookingId));
			} else {
				// Handle the case where the booking is not found
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
			}
		}

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, baos);

		document.open();

		for (Ticket ticket : tickets) {

			PdfPTable headerTable = new PdfPTable(1);
			PdfPCell headerCell = new PdfPCell(new Phrase("Your Movie Ticket",
					FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, BaseColor.WHITE)));
			headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			headerCell.setBackgroundColor(BaseColor.DARK_GRAY);
			headerCell.setPadding(10);
			headerCell.setBorder(Rectangle.NO_BORDER);
			headerTable.addCell(headerCell);
			document.add(headerTable);

			document.add(new Paragraph("-------------------------------------------------",
					FontFactory.getFont(FontFactory.HELVETICA, 12)));

			Font detailFontBold = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
			Font detailFont = FontFactory.getFont(FontFactory.HELVETICA, 12);

			document.add(new Paragraph("Ticket ID: " + ticket.getTicketId(), detailFontBold));
			document.add(new Paragraph(
					"Show Date: " + new SimpleDateFormat("dd MMM yyyy").format(ticket.getShow().getShowDate()),
					detailFont));
			document.add(new Paragraph("Show Time: " + ticket.getShow().getShowTime(), detailFont));
			document.add(new Paragraph("Screen Name: " + ticket.getShow().getScreen().getName(), detailFont));
			document.add(new Paragraph("Theatre Name: " + ticket.getTheatre().getName(), detailFont));
			document.add(new Paragraph("Movie Name: " + ticket.getShow().getMovie().getTitle(), detailFont));

			// Add seat numbers
			document.add(new Paragraph("Seat Number: " + ticket.getBooking().getSeatNumber(), detailFont));

			// Add a decorative line
			document.add(new Paragraph("-------------------------------------------------",
					FontFactory.getFont(FontFactory.HELVETICA, 12)));

			// Add a static QR code
			BarcodeQRCode qrCode = new BarcodeQRCode("https://www.cineconnect.com", 150, 150, null);
			Image qrCodeImage = qrCode.getImage();
			qrCodeImage.setAlignment(Element.ALIGN_CENTER);
			document.add(qrCodeImage);

			// Add a footer with a background color
			PdfPTable footerTable = new PdfPTable(1);
			PdfPCell footerCell = new PdfPCell(new Phrase("Thank you for booking with us! Enjoy the show!",
					FontFactory.getFont(FontFactory.HELVETICA, 10, BaseColor.WHITE)));
			footerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			footerCell.setBackgroundColor(BaseColor.DARK_GRAY);
			footerCell.setPadding(10);
			footerCell.setBorder(Rectangle.NO_BORDER);
			footerTable.addCell(footerCell);
			footerTable.setSpacingBefore(10);
			document.add(footerTable);

			document.newPage();
		}

		document.close();

		ByteArrayInputStream bis = new ByteArrayInputStream(baos.toByteArray());

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=tickets.pdf");

		return ResponseEntity.ok().headers(headers).contentLength(baos.size()).contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(bis));
	}

}
