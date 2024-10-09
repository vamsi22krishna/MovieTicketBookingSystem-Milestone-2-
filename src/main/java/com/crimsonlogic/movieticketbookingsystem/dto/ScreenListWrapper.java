package com.crimsonlogic.movieticketbookingsystem.dto;

import java.util.List;

import com.crimsonlogic.movieticketbookingsystem.entity.Screen;

import lombok.Data;

@Data
public class ScreenListWrapper {
    private List<Screen> screens;
}