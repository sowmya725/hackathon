package com.example.adminservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.adminservice.model.Admin;

import jakarta.transaction.Transactional;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String> {

    // Query to check if admin login credentials are correct
    @Query("select a from Admin a where a.username = ?1 and a.password = ?2")
    public Admin checkadminlogin(String uname, String pwd);

    // Query to delete a placement cell by its contact field
    
}
