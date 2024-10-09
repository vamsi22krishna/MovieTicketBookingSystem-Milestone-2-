package com.crimsonlogic.movieticketbookingsystem.repository;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.Booking;


@Repository
public interface BookingRepository extends JpaRepository<Booking, String>{
	@Query("SELECT b FROM Booking b WHERE b.screen.screenId = :screenId AND b.show.showId = :showId")
    List<Booking> findByScreenIdAndShowId(@Param("screenId") String screenId, @Param("showId") String showId);
	

	
	@Query("SELECT b FROM Booking b JOIN b.show s WHERE b.screen.id = :screenId AND s.id = :showId AND b.showDate = :showDate")
    List<Booking> findByScreenIdAndShowIdAndShowDate(@Param("screenId") String screenId, @Param("showId") String showId, @Param("showDate") Date showDate);
	
	@Query("SELECT b FROM Booking b WHERE b.user.userId = :userId")
    List<Booking> findBookingsByUserId(@Param("userId") String userId);
   

}
