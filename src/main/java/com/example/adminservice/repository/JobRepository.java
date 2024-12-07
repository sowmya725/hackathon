package com.example.adminservice.repository;

import com.example.adminservice.model.Job;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobRepository extends JpaRepository<Job, Long> {
    // You can add custom query methods here if needed
}
