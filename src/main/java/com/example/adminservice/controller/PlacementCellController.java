package com.example.adminservice.controller;

import com.example.adminservice.model.Job;
import com.example.adminservice.model.PlacementCell;
import com.example.adminservice.model.Student;
import com.example.adminservice.repository.JobRepository;
import com.example.adminservice.repository.PlacementCellRepository;
import com.example.adminservice.repository.StudentRepository;
import com.example.adminservice.service.PlacementCellService;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/")
public class PlacementCellController {

    @Autowired
    private StudentRepository studentRepository;

    // Display the registration form
    @GetMapping("/addStudentsByPlacementCell")
    public String showRegistrationFormByPlacementCell(Model model) {
        model.addAttribute("student", new Student());
        return "addstudentbyplacementcell"; // Directs to the addstudent.jsp form page
    }
    @PostMapping("/registerStudentByPlacementCell")
    public String registerStudentByPlacementCell(@RequestParam("studentName") String studentName,
                                  @RequestParam("address") String address,
                                  @RequestParam("gender") String gender,
                                  @RequestParam("email") String email,
                                  @RequestParam("dateOfBirth") String dateOfBirth,
                                  @RequestParam("phoneNumber") String phoneNumber,
                                  @RequestParam("branch") String branch,
                                  @RequestParam("password") String password,
                                  @RequestParam("confirmPassword") String confirmPassword,
                                  @RequestParam(value = "profilePic", required = false) MultipartFile profilePic,
                                  @RequestParam("resume") MultipartFile resume,
                                  Model model) throws IOException {

        // Validate that passwords match
        if (!password.equals(confirmPassword)) {
            model.addAttribute("errorMessage", "Passwords do not match");
            return "addstudentbyplacementcell";
        }

        // Create and set up a new student object
        Student student = new Student();
        student.setStudentName(studentName);
        student.setAddress(address);
        student.setGender(gender);
        student.setEmail(email);
        student.setPhoneNumber(phoneNumber);
        student.setBranch(branch);
        student.setPassword(password);
        student.setConfirmPassword(confirmPassword);
        try {
            LocalDate parsedDateOfBirth = LocalDate.parse(dateOfBirth);
            student.setDateOfBirth(parsedDateOfBirth);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Invalid date format for date of birth");
            return "addstudentbyplacementcell";
        }


        // Convert profilePic to bytes and set it if provided
        if (profilePic != null && !profilePic.isEmpty()) {
            try {
                student.setProfilePic(profilePic.getBytes());
                System.out.println("Profile picture uploaded successfully.");
            } catch (IOException e) {
                model.addAttribute("errorMessage", "Error saving profile picture");
                return "addstudentbyplacementcell";
            }
        }

        // Convert resume to bytes and set it
        try {
            student.setResume(resume.getBytes());
        } catch (IOException e) {
            model.addAttribute("errorMessage", "Error saving resume");
            return "addstudentbyplacementcell";
        }

        // Save the student to the repository
        studentRepository.save(student);

        // Redirect to success page
        model.addAttribute("successMessage", "Successfully registered!");
        return "redirect:/registrationSuccessByPlacementCell";
    }


    // Mapping for registration success page
    @GetMapping("/registrationSuccessByPlacementCell")
    public String registrationSuccessByPlacementCell(Model model) {
        model.addAttribute("successMessage", "Successfully registered!");
        return "registrationSuccessByPlacementCell"; // Shows registrationSuccess.jsp
    }

    
    @GetMapping("/listStudentsByPlacementCell")
    public String getAllStudentsByPlacementCell(Model model) {
        List<Student> students = studentRepository.findAll(); // Fetch students from the database
        model.addAttribute("students", students); // Add the students list to the model
        return "liststudentsbyplacementcell"; // Return the name of the JSP page
    }



    // Get student by ID
    @GetMapping("/viewStudentsByPlacementCell/{id}")
    public String getStudentByIdByPlacementCell(@PathVariable Long id, Model model) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            model.addAttribute("student", student.get());
            return "viewstudentbyplacementcell";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Show the update form
    @GetMapping("/updateStudentsByPlacementCell/{id}")
    public String showUpdateStudentFormByPlacementCell(@PathVariable Long id, Model model) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            model.addAttribute("student", student.get());
            return "updatestudentbyplacementcell";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Handle update student form submission
    @PostMapping("/updateStudentsByPlacementCell/{id}")
    public String updateStudentByPlacementCell(@PathVariable Long id,
                                @RequestParam("studentName") String studentName,
                                @RequestParam("gender") String gender,
                                @RequestParam("email") String email,
                                @RequestParam("dateOfBirth") String dateOfBirth,
                                @RequestParam("phoneNumber") String phoneNumber,
                                @RequestParam("branch") String branch,
                                @RequestParam(value = "profilePic", required = false) MultipartFile profilePic,
                                @RequestParam("resume") MultipartFile resume,
                                Model model) throws IOException {

        Optional<Student> existingStudent = studentRepository.findById(id);
        if (existingStudent.isPresent()) {
            Student student = existingStudent.get();
            student.setStudentName(studentName);
            student.setGender(gender);
            student.setEmail(email);
            student.setDateOfBirth(LocalDate.parse(dateOfBirth));
            student.setPhoneNumber(phoneNumber);
            student.setBranch(branch);

            if (profilePic != null && !profilePic.isEmpty()) {
                student.setProfilePic(profilePic.getBytes());
            }

            if (resume != null && !resume.isEmpty()) {
                student.setResume(resume.getBytes());
            }

            studentRepository.save(student);
            return "redirect:/updatestudentsuccessbyplacementcell";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Delete student by ID
    @GetMapping("/deleteStudentsByPlacementCell/{id}")
    public String deleteStudentByPlacementCell(@PathVariable Long id, Model model) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            studentRepository.delete(student.get());
            return "redirect:/deletestudentsuccessbyplacementcell";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Success page for update
    @GetMapping("/updatestudentsuccessbyplacementcell")
    public String updateSuccessByPlacementCell(Model model) {
        model.addAttribute("successMessage", "Student updated successfully!");
        return "updatestudentsuccessbyplacementcell";
    }

    // Success page for delete
    @GetMapping("/deletestudentsuccessbyplacementcell")
    public String deleteSuccessByPlacementCell(Model model) {
        model.addAttribute("successMessage", "Student deleted successfully!");
        return "deletestudentsuccessbyplacementcell";
    }

    @Autowired
    private JobRepository jobRepository;

    // Display the form to add a new job
    @GetMapping("/addJobByPlacementCell")
    public String showAddJobFormByPlacementCell(Model model) {
        model.addAttribute("job", new Job());
        return "addjobbyplacementcell";  // Directs to the addjob.jsp form page
    }

    // Create a new job
    @PostMapping("/createJobByPlacementCell")
    public String createJobByPlacementCell(@RequestParam("designation") String designation,
                            @RequestParam("description") String description,
                            @RequestParam("experience") int experience,
                            @RequestParam("percentage12th") double percentage12th,
                            @RequestParam("graduationGPA") double graduationGPA,
                            @RequestParam("numberOfSeats") int numberOfSeats,
                            @RequestParam("salaryPackage") double salaryPackage,
                            Model model) {

        // Create and set up the Job object
        Job job = new Job();
        job.setDesignation(designation);
        job.setDescription(description);
        job.setExperience(experience);
        job.setPercentage12th(percentage12th);
        job.setGraduationGPA(graduationGPA);
        job.setNumberOfSeats(numberOfSeats);
        job.setSalaryPackage(salaryPackage);
        // Save the job to the repository
        jobRepository.save(job);

        // Redirect to success page after job is created
        model.addAttribute("successMessage", "Job created successfully!");
        return "redirect:/registrationsuccessjobbyplacementcell";
    }
    @GetMapping("/registrationsuccessjobbyplacementcell")
    public String registrationSuccessjobByPlacementCell(Model model) {
        model.addAttribute("successMessage", "Job registration successful!");
        return "registrationsuccessjobbyplacementcell";  // Ensure this matches the JSP file name
    }

    // List all jobs
    @GetMapping("/listJobsByPlacementCell")
    public String getAllJobsByPlacementCell(Model model) {
        List<Job> jobs = jobRepository.findAll();  // Fetch all jobs from DB
        model.addAttribute("jobs", jobs);  // Add jobs to the model
        return "listjobsbyplacementcell";  // Return to the listjobs.jsp page
    }

    // Get a specific job by ID
    @GetMapping("/viewJobByPlacementCell/{id}")
    public String getJobByIdByPlacementCell(@PathVariable Long id, Model model) {
        Optional<Job> job = jobRepository.findById(id);
        if (job.isPresent()) {
            model.addAttribute("job", job.get());
            return "viewjobbyplacementcell";  // Return the page to view the job's details
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Show the update form for the job
    @GetMapping("/updateJobByPlacementCell/{id}")
    public String showUpdateJobFormByPlacementCell(@PathVariable Long id, Model model) {
        Optional<Job> job = jobRepository.findById(id);
        if (job.isPresent()) {
            model.addAttribute("job", job.get());
            return "updatejobbyplacementcell";  // Return to the update job form page
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Handle the job update form submission
    @PostMapping("/updateJobByPlacementCell/{id}")
    public String updateJobByPlacementCell(@PathVariable Long id,
                            @RequestParam("designation") String designation,
                            @RequestParam("description") String description,
                            @RequestParam("experience") int experience,
                            @RequestParam("percentage12th") double percentage12th,
                            @RequestParam("graduationGPA") double graduationGPA,
                            @RequestParam("numberOfSeats") int numberOfSeats,
                            @RequestParam("salaryPackage") double salaryPackage,
                            Model model) {

        // Find the job by ID
        Optional<Job> existingJob = jobRepository.findById(id);
        if (existingJob.isPresent()) {
            Job job = existingJob.get();

            // Update the job details
            job.setDesignation(designation);
            job.setDescription(description);
            job.setExperience(experience);
            job.setPercentage12th(percentage12th);
            job.setGraduationGPA(graduationGPA);
            job.setNumberOfSeats(numberOfSeats);
            job.setSalaryPackage(salaryPackage);
            // Save the updated job to the database
            jobRepository.save(job);

            // Redirect to the success page after successful update
            model.addAttribute("successMessage", "Job updated successfully!");
            return "redirect:/updatejobsuccessbyplacementcell";
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Delete a job by ID
    @GetMapping("/deleteJobByPlacementCell/{id}")
    public String deleteJobByPlacementCell(@PathVariable Long id, Model model) {
        Optional<Job> job = jobRepository.findById(id);
        if (job.isPresent()) {
            jobRepository.delete(job.get());
            model.addAttribute("successMessage", "Job deleted successfully!");
            return "redirect:/deletejobsuccessbyplacementcell";  // Redirect to job list after deletion
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Success page for updating a job
    @GetMapping("/updatejobsuccessbyplacementcell")
    public String updateJobSuccessByPlacementCell(Model model) {
    	model.addAttribute("successMessage", "Job updated successfully!");
        return "updatejobsuccessbyplacementcell";  // Ensure this matches the JSP file name
    }

    // Success page for deleting a job
    @GetMapping("/deletejobsuccessbyplacementcell")
    public String deleteJobSuccessByPlacementCell(Model model) {
        model.addAttribute("successMessage", "Job deleted successfully!");
        return "deletejobsuccessbyplacementcell";  // Ensure this matches the JSP file name
    }

    @Autowired
    private PlacementCellRepository placementCellRepository;
    @GetMapping("/companydropdownbyplacementcell")
    public String showCompanyDropdownByPlacementCell(Model model) {
        // Fetch all companies from the database
        List<PlacementCell> placementCells = placementCellRepository.findAll(); // Use repository directly
        
        // Add companies to the model
        model.addAttribute("placementCells", placementCells);
        
        return "companydropdownbyplacementcell"; // Return the companydropdown.jsp page
    }

}
