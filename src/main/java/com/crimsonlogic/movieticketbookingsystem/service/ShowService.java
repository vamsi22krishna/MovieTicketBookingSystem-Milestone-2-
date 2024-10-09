package com.crimsonlogic.movieticketbookingsystem.service;

import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Show;
import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;

public interface ShowService {
	public List<Show> getAllShows();
	public Optional<Show> getShowById(String showId);
	public Show createShow(Show show);
	public void deleteShow(String showId);
	//public List<Show> getShowsByScreenId(String screenId);
	
	 
	  public  List<Theatre> getAllTheatres();
	   public List<Screen> getAllScreens();
	 
	

}
