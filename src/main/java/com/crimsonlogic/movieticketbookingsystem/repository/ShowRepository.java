package com.crimsonlogic.movieticketbookingsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Show;

@Repository
public interface ShowRepository extends JpaRepository<Show, String>{
	 List<Show> findByScreen(Screen screen);
	 
	 // List<Show> findShowsByScreenId(String screenId);

//	List<Show> findByScreenId(String screenId);
	 
//	 List<Show> findByScreen(Screen screen);
}
