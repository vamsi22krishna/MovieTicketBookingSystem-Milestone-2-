package com.crimsonlogic.movieticketbookingsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;


@Repository
public interface ScreenRepository extends JpaRepository<Screen, String> {

	 List<Screen> findByTheatre_TheatreId(String theatreId);
	// List<Screen> findScreensByTheatreId(String theatreId);
	// List<Screen> findByTheater(Theatre theatre);
}
		
