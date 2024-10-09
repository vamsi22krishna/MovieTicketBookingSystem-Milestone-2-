package com.crimsonlogic.movieticketbookingsystem.service;

import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;

public interface TheatreService {
	public List<Theatre> getAllTheatres();
	public Optional<Theatre> getTheatreById(String theatreId);

	public Theatre createTheatre(Theatre theatre);
	public void deleteTheatre(String theatreId);
}
