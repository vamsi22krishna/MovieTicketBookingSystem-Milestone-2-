package com.crimsonlogic.movieticketbookingsystem.service;

import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;

public interface ScreenService {
	public List<Screen> getAllScreens();
	public Optional<Screen> getScreenById(String screenId);
	public Screen createScreen(Screen screen);
	public void deleteScreen(String screenId);
	public List<Screen> getScreensByTheatreId(String theatreId);
	
}
