package com.crimsonlogic.movieticketbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.movieticketbookingsystem.entity.User;
import com.crimsonlogic.movieticketbookingsystem.exception.ResourceNotFoundException;
import com.crimsonlogic.movieticketbookingsystem.repository.UserRepository;

import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;
 
    public boolean checkUserByPhoneNumber(String phone) {
        Optional<User> userOpt = userRepository.findByPhone(phone);
        if (userOpt.isPresent()) {
            return true;
        }
        return false;
    }
    
//
//    public boolean checkUserByEmail(String email) {
//        Optional<User> userOpt = userRepository.findByEmail(email);
//        return userOpt.isPresent();
//    }



    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserById(String userId) {
        return userRepository.findById(userId);
    }

    public User createUser(User user) {
    	String password=user.getPassword();
    	  String encryptedPassword = Base64.getEncoder().encodeToString(password.getBytes());
    	  user.setPassword(encryptedPassword);
        return userRepository.save(user);
    }

    public void deleteUser(String userId) {
        userRepository.deleteById(userId);
    }
    
    public Optional<User> findByUsernameAndPassword(String username, String password) {
    	String encryptedPassword = Base64.getEncoder().encodeToString(password.getBytes());
        return userRepository.findByUsernameAndPassword(username, encryptedPassword);
    }


    public String getUserRole(String username) {
        User user = userRepository.findByUsername(username);
        if (user != null) {
            return user.getRole();
        }
        return "USER"; // Default role if user is not found
        
     
    
}
    
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // Method to update user's password
    public void updatePassword(User user, String newPassword) {
        user.setPassword(Base64.getEncoder().encodeToString(newPassword.getBytes())); // Encode password
        userRepository.save(user);
    }
}
