<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Company</title>
    <style>
        /* General page styles */
        body {
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #f4f6f9; /* Light Grey */
            color: #333; /* Dark Text */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 400px; /* Adjusted width for compact form */
            background-color: #ffffff; /* White */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1); /* Light shadow */
            text-align: center;
        }

        h1 {
            color: #2C3E50; /* Dark Blue */
            margin-bottom: 20px;
            font-size: 20px; /* Adjusted font size */
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            color: #2C3E50; /* Dark Blue */
            margin-bottom: 5px;
            font-size: 14px;
        }

        .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd; /* Light border */
            background-color: #f9f9f9; /* Very Light Grey */
            color: #333;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-button-container {
            margin-top: 20px;
        }

        .form-button-container button {
            padding: 10px 20px;
            background-color: #3498db; /* Blue */
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin: 0 5px;
            transition: background-color 0.3s ease;
        }

        .form-button-container button:hover {
            background-color: #2980b9; /* Darker Blue */
        }

    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %> <!-- Include navbar file -->
    <div class="container">
        <h1>Select a Company</h1>
        <form action="addJob" method="get">
            <div class="form-group">
                <label for="company">Choose a Company:</label>
                <select name="companyName" id="company">
                    <c:forEach var="company" items="${placementCells}">
                        <option value="${company.companyName}">${company.companyName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-button-container">
                <button type="submit">Add Job</button>
            </div>
        </form>
    </div>
</body>
</html>