
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
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
            max-width: 1100px;
            margin-top: 100px;
            padding: 20px;
            text-align: center;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        h1 {
            margin: 0;
        }

        .add-student-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .add-student-button:hover {
            background-color: #218838;
        }

        table {
            margin: 0 auto;
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .view-button, .update-button, .delete-button {
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: bold;
            text-align: center;
            transition: background-color 0.3s ease;
            display: inline-block;
            text-decoration: none;
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
    <%@ include file="placementcellnavbar.jsp" %>

    <div class="container">
        <div class="header-container">
            <h1>All Students</h1>
            <a href="${pageContext.request.contextPath}/addStudentsByPlacementCell" class="add-student-button">Add Student</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Branch</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.studentName}</td>
                        <td>${student.id}</td>
                        <td>${student.email}</td>
                        <td>${student.branch}</td>
                        <td>
                            <div class="action-buttons">
                                <a href="${pageContext.request.contextPath}/viewStudentsByPlacementCell/${student.id}" class="view-button">View</a>
                                <a href="${pageContext.request.contextPath}/updateStudentsByPlacementCell/${student.id}" class="update-button">Update</a>
                                <a href="${pageContext.request.contextPath}/deleteStudentsByPlacementCell/${student.id}" class="delete-button">Delete</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
