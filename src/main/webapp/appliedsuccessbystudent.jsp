<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Applied Successfully</title>
    <style>
		body {
				           font-family: Arial, sans-serif;
				           background-color: #f8f9fa; /* Light background */
				           color: #333; /* Primary text color */
				           display: flex;
				           justify-content: center;
				           align-items: center;
				           height: 100vh;
				           margin: 0;
				       }
				       .message-container {
				           background-color: #ffffff; /* White background for the container */
				           padding: 20px;
				           border-radius: 8px;
				           box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
				           max-width: 500px;
				           width: 100%;
				           text-align: center;
				       }
				       .message-container h1 {
				           color: #333; /* Primary text color */
				           font-size: 24px;
				           margin-bottom: 10px;
				       }
				       .success-message {
				           color: #333; /* Primary text color */
				           font-size: 18px;
				           margin-bottom: 20px;
				       }
				       .button {
				           background-color: #007bff; /* Button background color */
				           color: #ffffff; /* White text */
				           padding: 10px 20px;
				           border: none;
				           border-radius: 4px;
				           cursor: pointer;
				           font-size: 16px;
				           text-decoration: none;
				       }
				       .button:hover {
				           background-color: #0056b3; /* Button background color on hover */
				       }

    </style>
</head>
<body>
	<%@ include file="studentnavbar.jsp" %>
    <div class="message-container">
        <h1>Student Successfully Applied for this Job</h1>
        <p class="success-message">${successMessage}</p>
        <a href="/listJobsByStudent" class="button">View All Jobs</a>
    </div>

</body>
</html>
