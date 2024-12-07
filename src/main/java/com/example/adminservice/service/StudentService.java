package com.example.adminservice.service;

import com.example.adminservice.model.PlacementCell;
import com.example.adminservice.model.Student;

public interface StudentService {
    public Student checkstudentlogin(String emails, String passwords);

    public Student getStudentById(Long studentId);
    public Student getStudentByEmail(String emails);
}
