package com.crimsonlogic.movieticketbookingsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.Movie;

@Repository
public interface MovieRepository extends JpaRepository<Movie, String> {
	
    List<Movie> findByTitle(String title);
   
    List<Movie> findByGenre(String genre);
}
