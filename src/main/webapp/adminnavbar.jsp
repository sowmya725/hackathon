<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.adminservice.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Admin admin = (Admin) session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Placement Portal</title>
    <style>
        /* General body styles */
        body {
            background-color: #F0F4F8;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }

        /* Header section - full width */
        .header {
            width: 100%;
            background-color: #34495E; /* Darker Header */
            color: white;
            padding: 15px 20px;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            height: 50px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        /* Centered title text */
        .header .header-title {
            font-size: 20px;
            font-weight: bold;
            color: #ecf0f1;
        }

        /* Right-aligned welcome message */
        .header .welcome-message {
            position: absolute;
            right: 80px; /* Reduced the right value to shift it left */
            font-size: 16px;
        }

        /* Sidebar styles */
        .sidebar {
            width: 200px;
            background-color: #1A5276; /* Darker Blue for sidebar */
            color: white;
            position: fixed;
            top: 60px; /* Moved down to avoid overlap with header */
            left: 0;
            height: calc(100% - 60px);
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

        /* Dropdown menu container */
        .dropdown {
            position: relative;
        }

        /* Dropdown content (hidden by default) */
        .dropdown-content {
            display: none;
            background-color: #1A5276; /* Same as sidebar background */
            padding-left: 20px;
        }

        /* Show dropdown on hover */
        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Sub-links for dropdown items */
        .dropdown-content a {
            font-size: 14px;
            padding: 10px 20px;
            display: block;
        }

        /* Main content */
        .main-content {
            margin-left: 220px; /* Adjusted for sidebar width */
            margin-top: 80px; /* Space for the header */
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
        <div class="header-title">Admin Portal</div>
        <div class="welcome-message">Welcome | Administrator</div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="dashboard.jsp">Dashboard</a>

        <!-- Dropdown for Students -->
        <div class="dropdown">
            <a href="#">Students</a>
            <div class="dropdown-content">
                <a href="addStudents">Add Student</a>
                <a href="listStudents">View Students</a>
            </div>
        </div>

        <!-- Dropdown for Companies -->
        <div class="dropdown">
            <a href="#">Placement Cells</a>
            <div class="dropdown-content">
                <a href="addPlacementCell">Add Placement Cell</a>
                <a href="listPlacementCells">View Placement Cells</a>
            </div>
        </div>

        <!-- Dropdown for Openings -->
        <div class="dropdown">
            <a href="#">Jobs</a>
            <div class="dropdown-content">
                <a href="companydropdown">Add Job</a>
                <a href="listJobs">View Jobs</a>
            </div>
        </div>
        <a href="#">Selected Students</a>
        <a href="#">College Info</a>
        <a href="#">Change Password</a>
        <a href="adminlogout">Logout</a>
    </div>
</body>
</html>
