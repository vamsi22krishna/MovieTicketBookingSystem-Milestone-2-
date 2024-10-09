package com.crimsonlogic.movieticketbookingsystem.service;

import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.Movie;

public interface MovieService {
	public List<Movie> getAllMovies();
	public Optional<Movie> getMovieById(String movieId);
	public Movie createMovie(Movie movie);
	public void deleteMovie(String movieId);
	public List<Movie> findMoviesByTitle(String title);
	public List<Movie> findMoviesByGenre(String genre);

}
