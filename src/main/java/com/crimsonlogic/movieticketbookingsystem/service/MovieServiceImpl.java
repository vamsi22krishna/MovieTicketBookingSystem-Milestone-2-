package com.crimsonlogic.movieticketbookingsystem.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.movieticketbookingsystem.entity.Movie;
import com.crimsonlogic.movieticketbookingsystem.repository.MovieRepository;

import java.util.List;
import java.util.Optional;

@Service
public class MovieServiceImpl implements MovieService{
	

	    @Autowired
	    private MovieRepository movieRepository;

	    public List<Movie> getAllMovies() {
	        return movieRepository.findAll();
	    }

	    public Optional<Movie> getMovieById(String movieId) {
	        return movieRepository.findById(movieId);
	    }

	    public Movie createMovie(Movie movie) {
	        return movieRepository.save(movie);
	    }

	    public void deleteMovie(String movieId) {
	        movieRepository.deleteById(movieId);
	    }
	    
	  
	    public List<Movie> findMoviesByTitle(String title) {
	        return movieRepository.findByTitle(title);
	    }

	   
	    public List<Movie> findMoviesByGenre(String genre) {
	        return movieRepository.findByGenre(genre);
	    }
	}



