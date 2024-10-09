package com.crimsonlogic.movieticketbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.repository.ScreenRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ScreenServiceImpl implements ScreenService {

    @Autowired
    private ScreenRepository screenRepository;

    public List<Screen> getAllScreens() {
        return screenRepository.findAll();
    }

    public Optional<Screen> getScreenById(String screenId) {
        return screenRepository.findById(screenId);
    }

    public Screen createScreen(Screen screen) {
        return screenRepository.save(screen);
    }

    public void deleteScreen(String screenId) {
        screenRepository.deleteById(screenId);
    }
    public List<Screen> getScreensByTheatreId(String theatreId) {
        return screenRepository.findByTheatre_TheatreId(theatreId);
    }
}
