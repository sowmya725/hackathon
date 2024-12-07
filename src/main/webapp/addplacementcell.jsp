
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Placement Cell</title>
    <style>
        /* General page styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 800px; /* Increased width */
            background-color: #ffffff;
            padding: 30px; /* Increased padding */
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 130px;
            margin-left: 90px;
        }

        h1 {
            text-align: center;
            color: #2C3E50;
            margin-bottom: 20px;
            margin-top: 0;
            font-size: 26px; /* Slightly bigger */
        }

        .form-container {
            padding: 10px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap; /* Allow wrapping */
            margin-bottom: 20px;
        }

        .form-group {
            width: 48%; /* Make form groups take 48% of the row */
            margin-right: 4%; /* Margin between the fields */
        }

        .form-group:last-child {
            margin-right: 0;
        }

        .form-row label {
            font-weight: bold;
            color: #2C3E50;
            font-size: 14px;
            margin-bottom: 8px; /* Increased margin */
        }

        .form-row input,
        .form-row select,
        .form-row textarea {
            width: 100%; /* Ensure full width */
            padding: 10px; /* Increased padding */
            border-radius: 6px; /* Rounded borders */
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            font-size: 14px; /* Slightly bigger text */
            color: #333;
        }

        .form-row textarea {
            resize: vertical;
            height: 80px; /* Adjusted height */
        }

        .form-button-container {
            text-align: center;
            margin-top: 30px;
        }

        .form-button-container button {
            padding: 12px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .form-button-container button:hover {
            background-color: #2980b9;
        }

        .success-message,
        .error-message {
            text-align: center;
            padding: 12px;
            margin-top: 20px;
            border-radius: 6px;
        }

        .success-message {
            background-color: #4CAF50;
            color: white;
        }

        .error-message {
            background-color: #f44336;
            color: white;
        }

    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <div class="container">
        <h1>Add Placement Cell</h1>
        <form action="/addPlacementCell" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label for="companyName">Company Name:</label>
                    <input type="text" id="companyName" name="companyName" required>
                </div>
                <div class="form-group">
                    <label for="website">Website:</label>
                    <input type="text" id="website" name="website">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group" style="width: 100%; margin-right: 0;">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group" style="width: 100%; margin-right: 0;">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address"></textarea>
                </div>
            </div>
            <div class="form-button-container">
                <button type="submit">Add Placement Cell</button>
            </div>
        </form>
    </div>
</body>
</html>
