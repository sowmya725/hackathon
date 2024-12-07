<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Spring Boot Portal</title>
    <style>
        /* General body styles */
        body {
            background-color: #34495E; /* Darker Blue */
            font-family: Arial, sans-serif;
            color: #BFA181; /* Gold */
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        /* Navbar styles */
        .navbar {
            display: flex;
            justify-content: center;
            background-color: #2C3E50; /* Dark Blue */
            padding: 10px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar a, .dropdown-btn {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }

        .navbar a:hover, .dropdown:hover .dropdown-btn {
            background-color: #BFA181; /* Gold */
            color: #34495E; /* Darker Blue */
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #2C3E50; /* Dark Blue */
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            font-size: 16px;
        }

        .dropdown-content a:hover {
            background-color: #BFA181; /* Gold */
            color: #34495E; /* Darker Blue */
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Container for main content */
        .content-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #34495E; /* Darker Blue */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Heading styles */
        h1 {
            color: #BFA181; /* Gold */
            font-size: 32px;
            margin-bottom: 20px;
        }

        /* Paragraph styles */
        p {
            color: #BFA181; /* Gold */
            font-size: 18px;
            line-height: 1.6;
        }

        /* Button styles */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #178582; /* Turquoise */
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #BFA181; /* Gold */
            color: #34495E; /* Darker Blue */
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="home.jsp">Home</a>
        <a href="aboutus.jsp">About Us</a>
        <a href="contact.jsp">Contact Us</a>
        <a href="faq.jsp">FAQ</a>
        <div class="dropdown">
            <button class="dropdown-btn">Login</button>
            <div class="dropdown-content">
                <a href="adminlogin.jsp">Admin</a>
                <a href="studentlogin.jsp">Student</a>
                <a href="placementlogin.jsp">Placement Cell</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="dropdown-btn">Register</button>
            <div class="dropdown-content">
                <a href="studentregister.jsp">Student</a>
                <a href="placementregister.jsp">Placement Cell</a>
            </div>
        </div>
    </div>

    <!-- Main content container -->
    <div class="content-container">
        <h1>Welcome to the Spring Boot Portal</h1>
        <p>This is the home page of the portal. Use the navigation menu above to explore different sections, including login and registration for students, placement cells, and administrators.</p>
        <p>If you’re new here, feel free to register and access the services we offer to help you succeed in your academic and professional journey.</p>
        <a href="adminlogin" class="btn">Get Started</a>
    </div>

</body>
</html>
