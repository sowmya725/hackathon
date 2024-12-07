<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Jobs</title>
    <style>
        /* General page styles */
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
        }

        header {
            width: 100%;
            background-color: #007bff;
            color: #ffffff;
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
            max-width: 1100px;
            margin-top: 100px; /* Space for the fixed header */
            padding: 20px;
        }

        .header-container {
            display: flex;
            justify-content: space-between; /* Align items on both ends */
            align-items: center; /* Vertically align items */
            margin-bottom: 20px;
        }

        h1 {
            margin: 0;
        }

        .add-button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .add-button:hover {
            background-color: #218838;
        }

        table {
            margin: 0 auto;
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .view-button, .update-button, .delete-button {
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: bold;
            text-align: center;
            transition: background-color 0.3s ease;
            display: inline-block;
            text-decoration: none;
            margin-right: 10px;
        }

        .view-button {
            background-color: #007bff;
            color: white;
        }

        .view-button:hover {
            background-color: #0056b3;
        }

        .update-button {
            background-color: #007bff;
            color: white;
        }

        .update-button:hover {
            background-color: #0056b3;
        }

        .delete-button {
            background-color: #dc3545;
            color: white;
        }

        .delete-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %> <!-- Include navbar file -->

    <div class="container">
        
        
        <table>
            <thead>
                <tr>
                    <th>Designation</th>
                    <th>Experience</th>
                    <th>Graduation GPA</th>
                    <th>Seats Available</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over the 'jobs' list passed from the controller -->
                <c:forEach var="job" items="${jobs}">
                    <tr>
                        <td>${job.designation}</td>
                        <td>${job.experience}</td>
                        <td>${job.graduationGPA}</td>
                        <td>${job.numberOfSeats}</td>
                        <td>
                            <!-- View, Update, Delete buttons -->
                            <a href="${pageContext.request.contextPath}/viewJobByStudent/${job.id}" class="view-button">View</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
