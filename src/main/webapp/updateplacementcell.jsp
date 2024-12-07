
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Placement Cell</title>
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
            max-width: 800px; /* Same width as the Add Placement Cell */
            background-color: #ffffff;
            padding: 30px; /* Same padding */
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
            font-size: 26px; /* Same font size */
        }

        .form-container {
            padding: 10px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .form-group {
            width: 48%;
            margin-right: 4%;
        }

        .form-group:last-child {
            margin-right: 0;
        }

        .form-row label {
            font-weight: bold;
            color: #2C3E50;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .form-row input,
        .form-row select,
        .form-row textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            font-size: 14px;
            color: #333;
        }

        .form-row textarea {
            resize: vertical;
            height: 80px;
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
        <h1>Update Placement Cell</h1>
        <form action="/updatePlacementCell/${placementCell.id}" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label for="companyName">Company Name:</label>
                    <input type="text" name="companyName" value="${placementCell.companyName}" required>
                </div>
                <div class="form-group">
                    <label for="website">Website:</label>
                    <input type="text" name="website" value="${placementCell.website}">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" value="${placementCell.password}" required>
                </div>
				<div class="form-group">
				                    <label for="phone">Phone:</label>
				                    <input type="text" name="phone" value="${placementCell.phone}">
				                </div>
            </div>
			<div class="form-row">
			    <div class="form-group" style="width: 100%; margin-right: 0;">
			        <label for="email">Email:</label>
			        <input type="email" name="email" value="${placementCell.email}" required style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid #ccc; background-color: #f9f9f9; font-size: 14px; color: #333;">
			    </div>
			</div>

            <div class="form-row">
                <div class="form-group" style="width: 100%; margin-right: 0;">
                    <label for="address">Address:</label>
                    <textarea name="address">${placementCell.address}</textarea>
                </div>
            </div>
            <div class="form-button-container">
                <button type="submit">Update Placement Cell</button>
            </div>
        </form>
    </div>
</body>
</html>
