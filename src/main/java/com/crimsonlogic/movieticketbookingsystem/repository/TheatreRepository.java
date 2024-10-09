package com.crimsonlogic.movieticketbookingsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;

@Repository
public interface TheatreRepository extends JpaRepository<Theatre, String>{
// @Query("SELECT DISTINCT t FROM Theatre t JOIN t.screens s JOIN s.shows sh WHERE sh.movie.movieId = :movieId")
//	    List<Theatre> findTheatresByMovieId(@Param("movieId") String movieId);
	
}
