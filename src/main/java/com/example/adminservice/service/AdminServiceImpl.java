package com.example.adminservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.adminservice.model.Admin;
import com.example.adminservice.model.Job;
import com.example.adminservice.model.PlacementCell;
import com.example.adminservice.model.Student;
import com.example.adminservice.repository.AdminRepository;
import com.example.adminservice.repository.JobRepository;
import com.example.adminservice.repository.PlacementCellRepository;
import com.example.adminservice.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private PlacementCellRepository placementcellRepository;
    @Autowired
    private JobRepository jobRepository;
    @Override
    public Admin checkadminlogin(String uname, String pwd) {
        return adminRepository.checkadminlogin(uname, pwd);
        
    }
	@Override
	public String addplacementcell(PlacementCell p) {
		placementcellRepository.save(p);
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String addstudent(Student s) {
		// TODO Auto-generated method stub
		studentRepository.save(s);
		return null;
	}
	@Override
	public String addjob(Job j) {
		// TODO Auto-generated method stub
		jobRepository.save(j);
		return null;
	}
}
