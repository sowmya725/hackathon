<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot Portal</title>
    <style>
        /* General body styles */
        body {
            background-color: #F0F4F8; /* Light Gray */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Top Navigation Bar */
        .top-nav {
            background-color: #1A5276; /* Darker Blue */
            color: white;
            display: flex;
            justify-content: center; /* Center align the navigation links */
            align-items: center;
            flex-wrap: wrap;
            padding: 20px; /* Increased padding for larger navbar */
            position: fixed;
            top: 0;
            width: 100%;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            z-index: 100;
        }

        /* Navigation Links */
        .top-nav a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px; /* Increased font size */
            border-radius: 4px;
            transition: background-color 0.3s;
            margin: 0 10px; /* Add spacing between links */
        }

        .top-nav a:hover {
            background-color: #2980B9; /* Light Blue */
        }

        /* Dropdown in Navigation */
        .dropdown {
            position: relative;
        }

		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #1A5276;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
		    z-index: 1;
		    top: 27px; /* Reduced value to decrease the gap */
		}


        .dropdown-content a {
            color: white;
            padding: 10px;
            text-decoration: none;
            display: block;
            font-size: 16px; /* Adjusted font size for consistency */
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Main Content Area */
        .main-content {
            margin-top: 100px; /* Adjusted to accommodate larger navbar */
            padding: 20px;
        }

        /* Dashboard Title */
        .dashboard-title {
            font-size: 24px;
            color: #34495E; /* Dark Slate Blue */
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Top Navigation Bar -->
    <div class="top-nav">
        <a href="/">Home</a>

        <div class="dropdown">
            <a href="#">Login</a>
            <div class="dropdown-content">
                <a href="studentlogin">Student</a>
                <a href="placementcelllogin">Placement Cell</a>
                <a href="adminlogin">Admin</a>
            </div>
        </div>

        <div class="dropdown">
            <a href="#">Register</a>
            <div class="dropdown-content">
                <a href="registerforstudent.jsp">Student</a>
                <a href="registerforplacementcell.jsp">Placement Cell</a>
            </div>
        </div>
    </div>
</body>
</html>