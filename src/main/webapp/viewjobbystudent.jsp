<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Job Details</title>
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
            max-width: 800px;
            margin-top: 100px; /* Space for the fixed header */
            padding: 20px;
            overflow-y: auto;
        }

        h1 {
            text-align: center;
            color: #007bff; /* Blue color for headings */
            margin-bottom: 20px;
        }

        .job-details {
            background-color: #ffffff; /* White background for the details container */
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .details-row {
            margin-bottom: 15px;
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
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button-container a:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
   <%@ include file="studentnavbar.jsp" %>

    <div class="container">
        <h1>Job Details</h1>
        <div class="job-details">
            <!-- Job Details -->
            <div class="details-row">
                <label>Designation:</label>
                <span>${job.designation}</span>
            </div>
            <div class="details-row">
                <label>Description:</label>
                <span>${job.description}</span>
            </div>
            <div class="details-row">
                <label>Experience Required:</label>
                <span>${job.experience} years</span>
            </div>
            <div class="details-row">
                <label>12th Percentage:</label>
                <span>${job.percentage12th}%</span>
            </div>
            <div class="details-row">
                <label>Graduation GPA:</label>
                <span>${job.graduationGPA}</span>
            </div>
            <div class="details-row">
                <label>Number of Seats:</label>
                <span>${job.numberOfSeats}</span>
            </div>
            <div class="details-row">
                <label>Salary Package:</label>
                <span>${job.salaryPackage} INR</span>
            </div>

            <!-- Back Button -->
            <div class="button-container">
                <a href="${pageContext.request.contextPath}/listJobsByStudent">Apply</a>
				<a href="${pageContext.request.contextPath}/listJobsByStudent">Not interested</a>
            </div>
        </div>
    </div>

</body>
</html>
