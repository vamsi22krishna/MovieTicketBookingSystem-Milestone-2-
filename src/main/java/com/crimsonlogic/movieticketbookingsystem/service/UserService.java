package com.crimsonlogic.movieticketbookingsystem.service;

import java.util.List;
import java.util.Optional;

import com.crimsonlogic.movieticketbookingsystem.entity.User;

public interface UserService {
    public List<User> getAllUsers();
    public Optional<User> getUserById(String userId);
    public User createUser(User user);
    public void deleteUser(String userId);
    public boolean checkUserByPhoneNumber(String phone);
    public Optional<User> findByUsernameAndPassword(String username, String password);
//	public User findByUsername(String name);
	public String getUserRole(String name);
	
	 public Optional<User> findByEmail(String email);
	 public void updatePassword(User user, String newPassword);
	
}
