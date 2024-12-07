<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Success</title>
    <style>
        /* General body styles */
        body {
            background-color: #2C3E50; /* Dark Classic Blue */
            font-family: Arial, sans-serif;
            color: #BFA181; /* Gold */
            margin: 0;
            padding: 0;
            text-align: center;
        }

        /* Heading styles */
        h1 {
            color: #BFA181; /* Gold */
            font-size: 32px;
            margin-top: 50px;
        }

        /* Paragraph styles */
        p {
            color: #BFA181; /* Gold */
            font-size: 18px;
            margin-top: 20px;
        }

        /* Link styles */
        a {
            color: #BFA181; /* Gold */
            font-size: 18px;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #BFA181;
            border-radius: 5px;
            transition: background-color 0.3s;
            display: inline-block;
            margin-top: 30px;
        }

        /* Link hover effect */
        a:hover {
            background-color: #178582; /* Turquoise */
            color: #ffffff;
        }
    </style>
</head>
<body>
	<%@ include file="adminnavbar.jsp" %>
    <h1>Delete Successful</h1>
    <p>${successMessage}</p>
    <a href="/viewPlacementCell">View All Placement Cells</a>
</body>
</html>
