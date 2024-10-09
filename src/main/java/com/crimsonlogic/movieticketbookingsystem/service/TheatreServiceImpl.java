package com.crimsonlogic.movieticketbookingsystem.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.movieticketbookingsystem.entity.Theatre;
import com.crimsonlogic.movieticketbookingsystem.repository.TheatreRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TheatreServiceImpl implements TheatreService {

    @Autowired
    private TheatreRepository theatreRepository;

    public List<Theatre> getAllTheatres() {
        return theatreRepository.findAll();
    }

    public Optional<Theatre> getTheatreById(String theatreId) {
        return theatreRepository.findById(theatreId);
    }

    public Theatre createTheatre(Theatre theatre) {
        return theatreRepository.save(theatre);
    }

    public void deleteTheatre(String theatreId) {
        theatreRepository.deleteById(theatreId);
    }
}
