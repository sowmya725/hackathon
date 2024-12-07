
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Placement Cell List</title>
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
            max-width: 1100px; /* Limit the container width */
            margin-top: 100px; /* Space for the fixed header */
            padding: 20px;
            text-align: center; /* Center content within container */
        }

        /* Heading and Button Container */
        .header-container {
            display: flex;
            justify-content: space-between; /* Align items on both ends */
            align-items: center; /* Vertically align items */
            margin-bottom: 20px; /* Space below the header */
        }

        h1 {
            margin: 0;
        }

        .add-placementcell-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
            margin-left: 20px; /* Slightly move the button to the right */
        }

        .add-placementcell-button:hover {
            background-color: #218838;
        }

        table {
            margin: 0 auto; /* Center the table horizontally */
            width: 80%; /* Adjust the table width for a balanced look */
            border-collapse: collapse; /* Collapse borders for a clean look */
            margin-top: 20px;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd; /* Light border for table cells */
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; /* Alternate row colors */
        }

        tr:hover {
            background-color: #ddd; /* Highlight row on hover */
        }

        /* Button styles for actions */
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
    <%@ include file="adminnavbar.jsp" %> <!-- Include navbar file -->
    
    <div class="container">
        <!-- Heading and Add Placement Cell Button -->
        <div class="header-container">
            <h1>All Placement Cells</h1>
            <a href="${pageContext.request.contextPath}/addPlacementCell" class="add-placementcell-button">Add Placement Cell</a>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>Company Name</th>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over the 'placementCells' list passed from the controller -->
                <c:forEach var="placementCell" items="${placementCells}">
                    <tr>
                        <td>${placementCell.companyName}</td>
                        <td>${placementCell.id}</td>
                        <td>${placementCell.email}</td>
                        <td>
                            <!-- View details button -->
                            <a href="${pageContext.request.contextPath}/viewPlacementCell/${placementCell.id}" class="view-button">View</a>
                            <a href="${pageContext.request.contextPath}/updatePlacementCell/${placementCell.id}" class="update-button">Update</a>
                            <a href="${pageContext.request.contextPath}/deletePlacementCell/${placementCell.id}" class="delete-button">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
