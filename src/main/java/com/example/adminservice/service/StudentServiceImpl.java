package com.example.adminservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.adminservice.model.Student;
import com.example.adminservice.repository.StudentRepository;
@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
    private StudentRepository studentRepository;
	@Override
	public Student checkstudentlogin(String emails, String passwords) {
		return studentRepository.checkStudentLogin(emails, passwords);
	}
	// Get student by ID
    public Student getStudentById(Long studentId) {
        return studentRepository.findById(studentId).orElse(null); // Return null if not found
    }
    public Student getStudentByEmail(String emails) {
        return studentRepository.findByEmail(emails);
    }

}
