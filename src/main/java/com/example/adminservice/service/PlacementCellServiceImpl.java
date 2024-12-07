package com.example.adminservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.adminservice.model.Job;
import com.example.adminservice.model.PlacementCell;
import com.example.adminservice.model.Student;
import com.example.adminservice.repository.JobRepository;
import com.example.adminservice.repository.PlacementCellRepository;
import com.example.adminservice.repository.StudentRepository;
@Service
public class PlacementCellServiceImpl implements PlacementCellService {
	@Autowired
    private StudentRepository studentRepository;
    @Autowired
    private PlacementCellRepository placementcellRepository;
    @Autowired
    private JobRepository jobRepository;
	public String addstudentbyplacement(Student sp) {
		// TODO Auto-generated method stub
		studentRepository.save(sp);
		return null;
	}

	@Override
	public String addjobbyplacement(Job jp) {
		// TODO Auto-generated method stub
		jobRepository.save(jp);
		return null;
	}
	@Override
	public PlacementCell checkplacemenetcelllogin(String email, String password) {
        return placementcellRepository.checkPlacementCellLogin(email, password);
	}

}
