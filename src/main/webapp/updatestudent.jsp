<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
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

        /* Container for the form */
        .container {
            width: 100%;
            max-width: 800px; /* Adjusted width */
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1); /* Light shadow */
            margin-top: 80px;
            margin-left: 70px;
        }

        h1 {
            text-align: center;
            color: #2C3E50; /* Dark Blue */
            margin-bottom: 20px;
            font-size: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr; /* Side by side columns */
            gap: 15px;
        }

        .form-group label {
            font-weight: bold;
            color: #2C3E50; /* Dark Blue */
            margin-bottom: 5px;
            font-size: 14px;
            display: block;
        }

        .form-group input,
        .form-group select {
            width: 100%; /* Full width for text inputs */
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd; /* Light border */
            background-color: #f9f9f9; /* Very Light Grey */
            color: #333;
            font-size: 14px;
            box-sizing: border-box;
        }

        /* Make the resume input full width */
        .form-group.full-width {
            grid-column: span 2; /* Make resume field take up full width */
        }

        .form-button-container {
            grid-column: span 2; /* Full width for the button */
            text-align: center;
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
        <h1>Update Student</h1>
        <form action="/updateStudents/${student.id}" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${student.id}">

            <div class="form-grid">
                <div class="form-group">
                    <label for="studentName">Student Name:</label>
                    <input type="text" id="studentName" name="studentName" value="${student.studentName}" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${student.address}" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select id="gender" name="gender" required>
                        <option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Other" ${student.gender == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${student.email}" required>
                </div>
                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth:</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="${student.phoneNumber}" required>
                </div>
                <div class="form-group">
                    <label for="branch">Branch:</label>
                    <input type="text" id="branch" name="branch" value="${student.branch}" required>
                </div>
                <div class="form-group">
                    <label for="profilePic">Profile Photo:</label>
                    <input type="file" id="profilePic" name="profilePic" accept="image/*">
                </div>
                <div class="form-group full-width">
                    <label for="resume">Resume (PDF):</label>
                    <input type="file" id="resume" name="resume" accept=".pdf,.doc,.docx">
                </div>
            </div>

            <div class="form-button-container">
                <button type="submit">Update Student</button>
            </div>
        </form>
    </div>
</body>
</html>
