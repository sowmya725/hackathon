
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Placement Cell</title>
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
            margin-top: 200px; /* Space for the fixed header */
            padding: 20px;
            overflow-y: auto;
            margin-left: 150px; /* Allow vertical scrolling within the container if needed */
        }

        h1 {
            text-align: center;
            color: #007bff; /* Blue color for headings */
            margin-bottom: 20px;
        }

        .placement-cell-details {
            background-color: #ffffff; /* White background for the details container */
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            max-height: calc(100vh - 200px); /* Adjust the height to fit content */
            overflow-y: auto; /* Allows scrolling only for the placement details section if needed */
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
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>

    <div class="container">
        <h1>View Placement Cell</h1>
        <div class="placement-cell-details">
            <!-- Placement Cell Details -->
            <div class="details-row">
                <label>Company Name:</label>
                <span>${placementCell.companyName}</span>
            </div>
            <div class="details-row">
                <label>Website:</label>
                <span>${placementCell.website}</span>
            </div>
            <div class="details-row">
                <label>Email:</label>
                <span>${placementCell.email}</span>
            </div>
            <div class="details-row">
                <label>Phone:</label>
                <span>${placementCell.phone}</span>
            </div>
            <div class="details-row">
                <label>Address:</label>
                <span>${placementCell.address}</span>
            </div>
        </div>

        <div class="button-container">
            <a href="${pageContext.request.contextPath}/listPlacementCells">Back to List</a>
        </div>
    </div>

</body>
</html>
