package com.crimsonlogic.movieticketbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;
import com.crimsonlogic.movieticketbookingsystem.entity.Show;
import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;
import com.crimsonlogic.movieticketbookingsystem.repository.ScreenRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.ShowRepository;
import com.crimsonlogic.movieticketbookingsystem.repository.TheatreRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ShowServiceImpl implements ShowService {

    @Autowired
    private ShowRepository showRepository;

    @Autowired
    private TheatreRepository theatreRepository;

    @Autowired
    private ScreenRepository screenRepository;
    
    public List<Show> getAllShows() {
        return showRepository.findAll();
    }

    public Optional<Show> getShowById(String showId) {
        return showRepository.findById(showId);
    }

    public Show createShow(Show show) {
        return showRepository.save(show);
    }

    public void deleteShow(String showId) {
        showRepository.deleteById(showId);
    }
    
//    public List<Show> getShowsByScreenId(String screenId) {
//        return showRepository.findByScreenId(screenId);
//    }
    
    
   
    @Override
    public List<Theatre> getAllTheatres() {
        return theatreRepository.findAll();
    }

    @Override
    public List<Screen> getAllScreens() {
        return screenRepository.findAll();
    }
}

