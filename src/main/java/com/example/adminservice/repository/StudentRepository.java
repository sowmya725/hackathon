package com.example.adminservice.repository;

import com.example.adminservice.model.PlacementCell;

import com.example.adminservice.model.Student;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
	Optional<Student> findById(Long id);
	List<Student> findAll();
	@Query("SELECT a FROM Student a WHERE a.email = ?1 AND a.password = ?2")
    Student checkStudentLogin(String emails, String passwords);
	Student findByEmail(String emails);
	}
