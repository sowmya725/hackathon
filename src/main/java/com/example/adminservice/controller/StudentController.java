package com.example.adminservice.controller;

import com.example.adminservice.model.Job;
import com.example.adminservice.model.Student;
import com.example.adminservice.repository.JobRepository;
import com.example.adminservice.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/")
public class StudentController {

    @Autowired
    private JobRepository jobRepository;
	 // List all jobs
    @GetMapping("/listJobsByStudent")
    public String getAllJobsByStudent(Model model) {
        List<Job> jobs = jobRepository.findAll();  // Fetch all jobs from DB
        model.addAttribute("jobs", jobs);  // Add jobs to the model
        return "listjobsbystudent";  // Return to the listjobs.jsp page
    }

    // Get a specific job by ID
    @GetMapping("/viewJobByStudent/{id}")
    public String getJobByIdByStudent(@PathVariable Long id, Model model) {
        Optional<Job> job = jobRepository.findById(id);
        if (job.isPresent()) {
            model.addAttribute("job", job.get());
            return "viewjobbystudent";  // Return the page to view the job's details
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }
}
