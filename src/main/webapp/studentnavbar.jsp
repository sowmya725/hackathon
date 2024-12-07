<%@page import="com.example.adminservice.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
if(student==null)
{
	response.sendRedirect("studentsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal Dashboard</title>
    <style>
        /* General body styles */
        body {
            background-color: #F0F4F8;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }

        /* Header section */
        .header {
            width: 100%;
            background-color: #34495E; /* Darker Header */
            color: white;
            padding: 15px 20px;
            position: fixed;
            top: 0;
            left: 0;
            height: 50px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: space-between;
            z-index: 1000;
        }

        /* Centered title text */
        .header .header-title {
            font-size: 20px;
            font-weight: bold;
            color: #ecf0f1;
            text-align: center;
            flex: 1;
        }

        /* Right-aligned welcome message */
        .header .welcome-message {
            font-size: 16px;
            margin-right: 50px;
            white-space: nowrap; /* Prevent wrapping */
            overflow: hidden; /* Ensure the text does not overflow */
            text-overflow: ellipsis; /* Add ellipsis for long text */
        }

        /* Sidebar styles */
        .sidebar {
            width: 200px;
            background-color: #1A5276; /* Darker Blue for sidebar */
            color: white;
            position: fixed;
            top: 50px; /* Below the header */
            left: 0;
            height: calc(100% - 50px);
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        /* Sidebar links */
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            display: block;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #2980B9; /* Light Blue on hover and active */
        }

        /* Main content */
        .main-content {
            margin-left: 220px; /* Adjusted for sidebar width */
            margin-top: 70px; /* Space for the header */
            padding: 20px;
        }

        /* Dashboard title */
        .dashboard-title {
            font-size: 24px;
            color: #34495E;
            margin-bottom: 20px;
            text-align: left;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <div class="header-title">Student Portal</div>
        <div class="welcome-message">Welcome, <c:out value="${sessionScope.username}" /></div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="home.jsp" class="active">Home</a>
        <a href="updateInfo.jsp">Update Info</a>
        <a href="listJobsByStudent">Openings</a>
        <a href="appliedJobs.jsp">Applied Jobs</a>
        <a href="changePassword.jsp">Change Password</a>
        <a href="studentlogin">Logout</a>
    </div>
</body>
</html>
