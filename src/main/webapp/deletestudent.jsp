<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #34495E; /* Darker Blue */
            color: #BFA181; /* Gold */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .message-container {
            background-color: #34495E; /* Darker Blue */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        .message-container h1 {
            color: #BFA181; /* Gold */
            font-size: 24px;
            margin-bottom: 10px;
        }
        .success-message {
            color: #BFA181; /* Gold */
            font-size: 18px;
            margin-bottom: 20px;
        }
        .button {
            background-color: #178582; /* Turquoise */
            color: #BFA181; /* Gold */
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }
        .button:hover {
            background-color: #BFA181; /* Gold */
            color: #34495E; /* Darker Blue */
        }
    </style>
</head>
<body>
	<%@ include file="adminnavbar.jsp" %>
    <div class="message-container">
        <h1>Student Deleted Successfully</h1>
        <p class="success-message">${successMessage}</p>
        <a href="/viewAllStudents" class="button">View All Students</a>
    </div>

</body>
</html>
