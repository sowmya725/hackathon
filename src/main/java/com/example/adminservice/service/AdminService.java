package com.example.adminservice.service;

import com.example.adminservice.model.Admin;
import com.example.adminservice.model.Job;
import com.example.adminservice.model.PlacementCell;
import com.example.adminservice.model.Student;

public interface AdminService {
    public Admin checkadminlogin(String uname, String pwd);
	
	public String addplacementcell(PlacementCell p);
	public String addjob(Job j);
	public String addstudent(Student s);
}
