package com.crimsonlogic.movieticketbookingsystem.repository;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.movieticketbookingsystem.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	  Optional<User> findByPhone(String phone);
	  Optional<User> findByUsernameAndPassword(String username, String password);
	User findByUsername(String username);
	Optional<User> findByEmail(String email);
	
	
	 @Transactional
	    @Modifying
	    @Query("UPDATE User u SET u.password = ?2 WHERE u.userId = ?1")
	public void updatePassword(User user, String newPassword);
}
