<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc; /* Light background color */
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            overflow: hidden; /* Prevents scrolling of the entire page */
        }

        header {
            width: 100%;
            background-color: #007bff; /* Blue header */
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
        }

        .container {
            width: 90%;
            max-width: 800px; /* Limit the container width */
            margin-top: 100px; /* Space for the fixed header */
            padding: 20px;
            overflow-y: auto;
			margin-left: 150px; /* Allow vertical scrolling within the container if needed */
        }

        h1 {
            text-align: center;
            color: #007bff; /* Blue color for headings */
            margin-bottom: 20px; /* Reduced margin */
        }

        .student-details {
            background-color: #ffffff; /* White background for the details container */
            padding: 15px; /* Reduced padding */
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            max-height: calc(100vh - 200px); /* Adjust the height to fit content */
            overflow-y: auto; /* Allows scrolling only for the student details section if needed */
        }

        .profile-img {
            width: 120px; /* Reduced size */
            height: 120px; /* Reduced size */
            border-radius: 50%;
            border: 2px solid #007bff; /* Blue border around profile image */
            margin-bottom: 15px; /* Reduced bottom margin */
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .details-row {
            margin-bottom: 15px; /* Reduced space between rows */
            display: flex;
            align-items: center;
        }

        .details-row label {
            font-weight: bold;
            color: #007bff; /* Blue for label text */
            width: 150px;
        }

        .details-row span {
            color: #333; /* Dark text color for content */
        }

        .button-container {
            margin-top: 20px;
            text-align: center;
        }

        .button-container a {
            padding: 10px 20px;
            background-color: #007bff; /* Blue for main button color */
            color: white; /* White text on buttons */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button-container a:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .resume-link {
            color: #007bff;
            text-decoration: none;
        }

        .resume-link:hover {
            color: #0056b3; /* Darker blue on hover for resume link */
        }
    </style>
</head>
<body>
    <%@ include file="placementcellnavbar.jsp" %>

    <div class="container">
        <h1>Student Details</h1>
        <div class="student-details">
            <!-- Profile Picture -->
            <img src="data:image/png;base64,${student.profilePic}" alt="Profile Picture" class="profile-img" />
            
            <!-- Student Details -->
            <div class="details-row">
                <label>Student Name:</label>
                <span>${student.studentName}</span>
            </div>
            <div class="details-row">
                <label>Email:</label>
                <span>${student.email}</span>
            </div>
            <div class="details-row">
                <label>Address:</label>
                <span>${student.address}</span>
            </div>
            <div class="details-row">
                <label>Phone Number:</label>
                <span>${student.phoneNumber}</span>
            </div>
            <div class="details-row">
                <label>Branch:</label>
                <span>${student.branch}</span>
            </div>
            <div class="details-row">
                <label>Gender:</label>
                <span>${student.gender}</span>
            </div>
            <div class="details-row">
                <label>Date of Birth:</label>
                <span>${student.dateOfBirth}</span>
            </div>

            <!-- Resume Link -->
            <div class="details-row">
                <label>Resume:</label>
                <a href="${pageContext.request.contextPath}/downloadResume/${student.id}" class="resume-link">Click here to view/download resume</a>
            </div>
            
            <!-- Back Button -->
            <div class="button-container">
                <a href="${pageContext.request.contextPath}/listStudentsByPlacementCell">Back to Student List</a>
            </div>
        </div>
    </div>

</body>
</html>
