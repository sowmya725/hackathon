package com.example.adminservice.service;

import java.util.List;

import com.example.adminservice.model.Job;
import com.example.adminservice.model.PlacementCell;
import com.example.adminservice.model.Student;

public interface PlacementCellService {
    public PlacementCell checkplacemenetcelllogin(String email, String password);
	
	public String addstudentbyplacement(Student sp);
	public String addjobbyplacement(Job jp);

	public static List<PlacementCell> getAllPlacementCells() {
		// TODO Auto-generated method stub
		return null;
	}
}
