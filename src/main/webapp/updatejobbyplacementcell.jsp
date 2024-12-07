<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Job</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #eef2f7;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 120px;
            margin-left: 70px;
        }

        h1 {
            text-align: center;
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 15px;
        }

        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: bold;
            font-size: 14px;
            margin-bottom: 5px;
            color: #34495e;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .form-group textarea {
            resize: none;
            height: 100px;
        }

        .form-button-container {
            display: flex;
            justify-content: center;
        }

        .form-button-container button {
            padding: 10px 20px;
            background-color: #2980b9;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-button-container button:hover {
            background-color: #1f618d;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
        }

        .message.success {
            background-color: #27ae60;
            color: #fff;
        }

        .message.error {
            background-color: #e74c3c;
            color: #fff;
        }
    </style>
</head>
<body>
    <%@ include file="placementcellnavbar.jsp" %>

    <div class="container">
        <h1>Update Job</h1>
        <form action="/updateJobByPlacementCell/${job.id}" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label for="designation">Designation</label>
                    <input type="text" id="designation" name="designation" value="${job.designation}" required>
                </div>
                <div class="form-group">
                    <label for="experience">Experience (in years)</label>
                    <input type="number" id="experience" name="experience" value="${job.experience}" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="percentage12th">12th Percentage</label>
                    <input type="number" step="0.01" id="percentage12th" name="percentage12th" value="${job.percentage12th}" required>
                </div>
                <div class="form-group">
                    <label for="graduationGPA">Graduation GPA</label>
                    <input type="number" step="0.01" id="graduationGPA" name="graduationGPA" value="${job.graduationGPA}" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="numberOfSeats">Number of Seats</label>
                    <input type="number" id="numberOfSeats" name="numberOfSeats" value="${job.numberOfSeats}" required>
                </div>
                <div class="form-group">
                    <label for="salaryPackage">Salary Package (in INR)</label>
                    <input type="number" step="0.01" id="salaryPackage" name="salaryPackage" value="${job.salaryPackage}" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="description">Job Description</label>
                    <textarea id="description" name="description" required>${job.description}</textarea>
                </div>
            </div>

            <div class="form-button-container">
                <button type="submit">Update Job</button>
            </div>
        </form>

        <%-- Success or Error Messages --%>
        <% if (request.getAttribute("success") != null) { %>
            <div class="message success"><%= request.getAttribute("success") %></div>
        <% } else if (request.getAttribute("error") != null) { %>
            <div class="message error"><%= request.getAttribute("error") %></div>
        <% } %>
    </div>
</body>
</html>
