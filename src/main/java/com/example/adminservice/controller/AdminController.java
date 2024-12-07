package com.example.adminservice.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.adminservice.service.AdminService;
import com.example.adminservice.service.PlacementCellService;
import com.example.adminservice.service.StudentService;
import com.example.adminservice.model.Admin;
import com.example.adminservice.model.Job;
import com.example.adminservice.model.PlacementCell;
import com.example.adminservice.model.Student;
import com.example.adminservice.repository.JobRepository;
import com.example.adminservice.repository.PlacementCellRepository;
import com.example.adminservice.repository.StudentRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller

@RequestMapping("/")
public class AdminController {

    @Autowired
    private AdminService adminService;
 // Admin Login
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }
    // Admin Login
    @GetMapping("adminlogin")
    public ModelAndView adminlogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminlogin");
        return mv;
    }
    // Admin Login Check
    @PostMapping("checkadminlogin")
    public ModelAndView checkadminlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String auname = request.getParameter("auname");
        String apwd = request.getParameter("apwd");

        Admin admin = adminService.checkadminlogin(auname, apwd);

        if (admin != null) {
        	HttpSession session = request.getSession();
         	session.setAttribute("admin",admin);//employee is session variable
         	
         	session.setMaxInactiveInterval(3000);
            mv.setViewName("adminhome");
        } else {
            mv.setViewName("adminloginfail");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }

    // Admin Home
    @GetMapping("adminhome")
    public ModelAndView adminhome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminhome");
        return mv;
    }

    // Admin Logout
    @GetMapping("adminlogout")
    public ModelAndView adminlogout(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminlogin");
        HttpSession session = request.getSession();
		
session.removeAttribute("admin");
        return mv;
	}/*
		 * @GetMapping("addstudent") public String addstudent(Model m) {
		 * m.addAttribute("student", new Student()); return "addstudent"; }
		 * 
		 * @GetMapping("addplacementcell") public String addplacementcell(Model m) {
		 * m.addAttribute("placementcell", new PlacementCell()); return
		 * "addplacementcell"; //addcustomer.jsp }
		 * 
		 * @GetMapping("addjob") public String addjob(Model m) { m.addAttribute("job",
		 * new Job()); return "addjob"; //addcustomer.jsp }
		 */
    


    @Autowired
    private StudentRepository studentRepository;

    // Display the registration form
    @GetMapping("/addStudents")
    public String showRegistrationForm(Model model) {
        model.addAttribute("student", new Student());
        return "addstudent"; // Directs to the addstudent.jsp form page
    }
    @PostMapping("/registerStudent")
    public String registerStudent(@RequestParam("studentName") String studentName,
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
            return "addstudent";
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
            return "addstudent";
        }


        // Convert profilePic to bytes and set it if provided
        if (profilePic != null && !profilePic.isEmpty()) {
            try {
                student.setProfilePic(profilePic.getBytes());
                System.out.println("Profile picture uploaded successfully.");
            } catch (IOException e) {
                model.addAttribute("errorMessage", "Error saving profile picture");
                return "addstudent";
            }
        }

        // Convert resume to bytes and set it
        try {
            student.setResume(resume.getBytes());
        } catch (IOException e) {
            model.addAttribute("errorMessage", "Error saving resume");
            return "addstudent";
        }

        // Save the student to the repository
        studentRepository.save(student);

        // Redirect to success page
        model.addAttribute("successMessage", "Successfully registered!");
        return "redirect:/registrationSuccess";
    }


    // Mapping for registration success page
    @GetMapping("/registrationSuccess")
    public String registrationSuccess(Model model) {
        model.addAttribute("successMessage", "Successfully registered!");
        return "registrationSuccess"; // Shows registrationSuccess.jsp
    }

    
    @GetMapping("/listStudents")
    public String getAllStudents(Model model) {
        List<Student> students = studentRepository.findAll(); // Fetch students from the database
        model.addAttribute("students", students); // Add the students list to the model
        return "liststudents"; // Return the name of the JSP page
    }



    // Get student by ID
    @GetMapping("/viewStudents/{id}")
    public String getStudentById(@PathVariable Long id, Model model) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            model.addAttribute("student", student.get());
            return "viewstudent";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Show the update form
    @GetMapping("/updateStudents/{id}")
    public String showUpdateStudentForm(@PathVariable Long id, Model model) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            model.addAttribute("student", student.get());
            return "updatestudent";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Handle update student form submission
    @PostMapping("/updateStudents/{id}")
    public String updateStudent(@PathVariable Long id,
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
            return "redirect:/updatestudentsuccess";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Delete student by ID
    @GetMapping("/deleteStudents/{id}")
    public String deleteStudent(@PathVariable Long id, Model model) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            studentRepository.delete(student.get());
            return "redirect:/deletestudentsuccess";
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";
        }
    }

    // Success page for update
    @GetMapping("/updatestudentsuccess")
    public String updateSuccess(Model model) {
        model.addAttribute("successMessage", "Student updated successfully!");
        return "updatestudentsuccess";
    }

    // Success page for delete
    @GetMapping("/deletestudentsuccess")
    public String deleteSuccess(Model model) {
        model.addAttribute("successMessage", "Student deleted successfully!");
        return "deletestudentsuccess";
    }
    @Autowired
    private PlacementCellRepository placementCellRepository;
    @Autowired
    private PlacementCellService placementCellService;

 // Placement Cell Login Page
    @GetMapping("/placementcelllogin")
    public ModelAndView placementCellLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("placementcelllogin");
        return mv;
    }

    // Check Placement Cell Login
    @PostMapping("/checkplacementcelllogin")
    public ModelAndView checkPlacementCellLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PlacementCell placementCell = placementCellService.checkplacemenetcelllogin(email, password);

        if (placementCell != null) {
        	HttpSession session = request.getSession();
         	session.setAttribute("placementcell",placementCell);//employee is session variable
         	
         	session.setMaxInactiveInterval(3000);
            mv.setViewName("placementcellhome");
        } else {
            mv.setViewName("placementcellloginfail");
            mv.addObject("message", "Invalid Email or Password");
        }
        return mv;
    }

    // Placement Cell Home Page
    @GetMapping("/placementcellhome")
    public ModelAndView placementCellHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("placementcellhome");
        return mv;
    }
    // Admin Logout
    @GetMapping("placementcelllogout")
    public ModelAndView placementcelllogout(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("placementcelllogin");

        HttpSession session = request.getSession();
		
session.removeAttribute("placementcell");
        return mv;
	}
    @GetMapping("studentlogout")
    public ModelAndView studentlogout(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentlogin");

        HttpSession session1 = request.getSession();
		
session1.removeAttribute("student");
        return mv;
	}
    // Display the add placement cell form
    @GetMapping("/addPlacementCell")
    public String showAddPlacementCellForm(Model model) {
        model.addAttribute("placementCell", new PlacementCell());
        return "addplacementcell";  // Directs to the addplacementcell.jsp form page
    }

    // Add a new placement cell
    @PostMapping("/addPlacementCell")
    public String addPlacementCell(@RequestParam("companyName") String companyName,
                                   @RequestParam("website") String website,
                                   @RequestParam("password") String password,
                                   @RequestParam("email") String email,
                                   @RequestParam("phone") String phone,
                                   @RequestParam("address") String address,
                                   Model model) {

        // Add any necessary validation
        if (companyName == null || companyName.isEmpty()) {
            model.addAttribute("errorMessage", "Company name cannot be empty");
            return "addplacementcell";  // Return to form with error message
        }

        // Create and set up a new PlacementCell object
        PlacementCell placementCell = new PlacementCell();
        placementCell.setCompanyName(companyName);
        placementCell.setWebsite(website);
        placementCell.setPassword(password);
        placementCell.setEmail(email);
        placementCell.setPhone(phone);
        placementCell.setAddress(address);

        // Save the placement cell to the repository
        placementCellRepository.save(placementCell);

        // Redirect to the success page with a success message
        model.addAttribute("successMessage", "Placement cell added successfully!");
        return "redirect:/registrationsuccessplacementcell";  // Redirect to the success page
    }

    // Mapping for success page
    @GetMapping("/registrationsuccessplacementcell")
    public String placementCellSuccess(Model model) {
        model.addAttribute("successMessage", "Placement cell added successfully!");
        return "registrationsuccessplacementcell";  // Shows placementCellSuccess.jsp
    }

    // List all placement cells
    @GetMapping("/listPlacementCells")
    public String getAllPlacementCells(Model model) {
        // Fetch all placement cells from DB
        List<PlacementCell> placementCells = placementCellRepository.findAll();
        model.addAttribute("placementCells", placementCells);  // Add the placement cells to the model
        return "listplacementcell";  // Return the listplacementcells.jsp page
    }

    // Get placement cell by ID
    @GetMapping("/viewPlacementCell/{id}")
    public String getPlacementCellById(@PathVariable Long id, Model model) {
        Optional<PlacementCell> placementCell = placementCellRepository.findById(id);
        if (placementCell.isPresent()) {
            model.addAttribute("placementCell", placementCell.get());
            return "viewplacementcell";  // Return the page to view the placement cell's details
        } else {
            model.addAttribute("errorMessage", "Placement cell not found");
            return "error";  // Return to error page if placement cell not found
        }
    }

    // Show the update form
    @GetMapping("/updatePlacementCell/{id}")
    public String showUpdatePlacementCellForm(@PathVariable Long id, Model model) {
        Optional<PlacementCell> placementCell = placementCellRepository.findById(id);
        if (placementCell.isPresent()) {
            model.addAttribute("placementCell", placementCell.get());
            return "updateplacementcell";  // Return to the update form page
        } else {
            model.addAttribute("errorMessage", "Placement cell not found");
            return "error";  // Return to error page if placement cell not found
        }
    }

    // Handle update placement cell form submission
    @PostMapping("/updatePlacementCell/{id}")
    public String updatePlacementCell(@PathVariable Long id,
                                      @RequestParam("companyName") String companyName,
                                      @RequestParam("website") String website,
                                      @RequestParam("password") String password,
                                      @RequestParam("email") String email,
                                      @RequestParam("phone") String phone,
                                      @RequestParam("address") String address,
                                      Model model) {

        // Find the placement cell by ID
        Optional<PlacementCell> existingPlacementCell = placementCellRepository.findById(id);
        if (existingPlacementCell.isPresent()) {
            PlacementCell placementCell = existingPlacementCell.get();

            // Update placement cell details
            placementCell.setCompanyName(companyName);
            placementCell.setWebsite(website);
            placementCell.setPassword(password);
            placementCell.setEmail(email);
            placementCell.setPhone(phone);
            placementCell.setAddress(address);

            // Save the updated placement cell details to the repository
            placementCellRepository.save(placementCell);

            // Redirect to the update success page
            return "redirect:/updatePlacementCellSuccess";
        } else {
            model.addAttribute("errorMessage", "Placement cell not found");
            return "error";  // Return to error page if placement cell not found
        }
    }

    // Delete placement cell by ID
    @GetMapping("/deletePlacementCell/{id}")
    public String deletePlacementCell(@PathVariable Long id, Model model) {
        Optional<PlacementCell> placementCell = placementCellRepository.findById(id);
        if (placementCell.isPresent()) {
            placementCellRepository.delete(placementCell.get());
            model.addAttribute("successMessage", "Placement cell deleted successfully!");
            return "redirect:/deletePlacementCellSuccess";  // Redirect to delete success page
        } else {
            model.addAttribute("errorMessage", "Placement cell not found");
            return "error";  // Return to error page if placement cell not found
        }
    }

    // Success page for update
    @GetMapping("/updatePlacementCellSuccess")
    public String updatePlacementCellSuccess(Model model) {
        model.addAttribute("successMessage", "Placement cell updated successfully!");
        return "updateplacementcellsuccess";  // Ensure this matches the JSP file name
    }

    @GetMapping("/deletePlacementCellSuccess")
    public String deletePlacementCellSuccess(Model model) {
        model.addAttribute("successMessage", "Placement cell deleted successfully!");
        return "deleteplacementcellsuccess"; 
    }

    @GetMapping("/companydropdown")
    public String showCompanyDropdown(Model model) {
        // Fetch all companies from the database
        List<PlacementCell> placementCells = placementCellRepository.findAll(); // Use repository directly
        
        // Add companies to the model
        model.addAttribute("placementCells", placementCells);
        
        return "companydropdown"; // Return the companydropdown.jsp page
    }
    @Autowired
    private JobRepository jobRepository;

    // Display the form to add a new job
    @GetMapping("/addJob")
    public String showAddJobForm(Model model) {
        model.addAttribute("job", new Job());
        return "addjob";  // Directs to the addjob.jsp form page
    }

    // Create a new job
    @PostMapping("/createJob")
    public String createJob(@RequestParam("designation") String designation,
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
        return "redirect:/registrationsuccessjob";
    }
    @GetMapping("/registrationsuccessjob")
    public String registrationSuccessjob(Model model) {
        model.addAttribute("successMessage", "Job registration successful!");
        return "registrationsuccessjob";  // Ensure this matches the JSP file name
    }

    // List all jobs
    @GetMapping("/listJobs")
    public String getAllJobs(Model model) {
        List<Job> jobs = jobRepository.findAll();  // Fetch all jobs from DB
        model.addAttribute("jobs", jobs);  // Add jobs to the model
        return "listjobs";  // Return to the listjobs.jsp page
    }

    // Get a specific job by ID
    @GetMapping("/viewJob/{id}")
    public String getJobById(@PathVariable Long id, Model model) {
        Optional<Job> job = jobRepository.findById(id);
        if (job.isPresent()) {
            model.addAttribute("job", job.get());
            return "viewjob";  // Return the page to view the job's details
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Show the update form for the job
    @GetMapping("/updateJob/{id}")
    public String showUpdateJobForm(@PathVariable Long id, Model model) {
        Optional<Job> job = jobRepository.findById(id);
        if (job.isPresent()) {
            model.addAttribute("job", job.get());
            return "updatejob";  // Return to the update job form page
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Handle the job update form submission
    @PostMapping("/updateJob/{id}")
    public String updateJob(@PathVariable Long id,
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
            return "redirect:/updatejobsuccess";
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Delete a job by ID
    @GetMapping("/deleteJob/{id}")
    public String deleteJob(@PathVariable Long id, Model model) {
        Optional<Job> job = jobRepository.findById(id);
        if (job.isPresent()) {
            jobRepository.delete(job.get());
            model.addAttribute("successMessage", "Job deleted successfully!");
            return "redirect:/deletejobsuccess";  // Redirect to job list after deletion
        } else {
            model.addAttribute("errorMessage", "Job not found");
            return "error";  // Return to error page if job not found
        }
    }

    // Success page for updating a job
    @GetMapping("/updatejobsuccess")
    public String updateJobSuccess(Model model) {
    	model.addAttribute("successMessage", "Job updated successfully!");
        return "updatejobsuccess";  // Ensure this matches the JSP file name
    }

    // Success page for deleting a job
    @GetMapping("/deletejobsuccess")
    public String deleteJobSuccess(Model model) {
        model.addAttribute("successMessage", "Job deleted successfully!");
        return "deletejobsuccess";  // Ensure this matches the JSP file name
    }
    @Autowired
    private StudentService studentService;

    // Placement Cell Login Page
    @GetMapping("/studentlogin")
    public ModelAndView studentLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentlogin");
        return mv;
    }

    // Check Placement Cell Login
    @PostMapping("/checkstudentlogin")
    public ModelAndView checkStudentLogin(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        String emails = request.getParameter("emails");
        String passwords = request.getParameter("passwords");

        // Authenticate the student using email and password
        Student student = studentService.checkstudentlogin(emails, passwords);

        if (student != null) {

        	HttpSession session1 = request.getSession();
         	session1.setAttribute("student",student);//employee is session variable
         	
         	session1.setMaxInactiveInterval(3000);
            // Store the student's name and ID in the session
            session.setAttribute("username", student.getStudentName());
            session.setAttribute("studentId", student.getId());

            // Redirect to the student home page
            mv.setViewName("studenthome");
        } else {
            // Invalid login, return to login page with error message
            mv.setViewName("studentloginfail");
            mv.addObject("message", "Invalid Email or Password");
        }
        return mv;
    }

    // Placement Cell Home Page
    @GetMapping("/studenthome")
    public ModelAndView studentHome(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        // Retrieve the student's name from the session to display on the navbar
        String username = (String) session.getAttribute("username");

        if (username != null) {
            mv.addObject("username", username); // Add the username to the model
            mv.setViewName("studenthome");
        } else {
            mv.setViewName("studentlogin"); // Redirect to login page if no username in session
        }

        return mv;
    }

    @GetMapping("/studentprofile")
    public ModelAndView studentProfile(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        // Retrieve the student ID from the session
        Long studentId = (Long) session.getAttribute("studentId");

        if (studentId != null) {
            // Fetch the student details from the database using the student ID
            Student student = studentService.getStudentById(studentId);

            if (student != null) {
                mv.addObject("student", student); // Add student data to the model
                mv.setViewName("studentprofile"); // Profile page view
            } else {
                mv.setViewName("studenthome"); // Redirect to home if student data not found
            }
        } else {
            mv.setViewName("studentlogin"); // Redirect to login page if no student ID in session
        }

        return mv;
    }
    @GetMapping("adminsessionexpiry")
	  public ModelAndView adminsessionexpiry()
	  {
	    ModelAndView mv=new ModelAndView();
	    mv.setViewName("adminsessionexpiry");
	    return mv;
	  }
    @GetMapping("placementcellsessionexpiry")
	  public ModelAndView placementcellsessionexpiry()
	  {
	    ModelAndView mv=new ModelAndView();
	    mv.setViewName("placementcellsessionexpiry");
	    return mv;
	  }
    @GetMapping("studentsessionexpiry")
	  public ModelAndView studentsessionexpiry()
	  {
	    ModelAndView mv=new ModelAndView();
	    mv.setViewName("studentsessionexpiry");
	    return mv;
	  }
    }
