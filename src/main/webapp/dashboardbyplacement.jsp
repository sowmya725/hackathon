<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            background-color: #34495E;
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

        .header .header-title {
            font-size: 20px;
            font-weight: bold;
            color: #ecf0f1;
        }

        /* Sidebar styles */
        .sidebar {
            width: 200px;
            background-color: #1A5276;
            color: white;
            position: fixed;
            top: 60px;
            left: 0;
            height: calc(100% - 60px);
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            display: block;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #2980B9;
        }

        /* Main content */
        .main-content {
            margin-left: 220px;
            margin-top: 80px;
            padding: 20px;
        }

        .dashboard-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .dashboard-cards {
            display: flex;
            gap: 20px;
        }

        .card {
            width: 180px;
            height: 100px;
            border-radius: 8px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            flex-direction: column;
        }

        .card-blue { background-color: #3498DB; }
        .card-green { background-color: #2ECC71; }
        .card-red { background-color: #E74C3C; }
        .card-teal { background-color: #1ABC9C; }

    </style>
</head>
<body>
	<%@ include file="placementcellnavbar.jsp" %>
    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-title">Admin Dashboard</div>
        <div class="dashboard-cards">
            <div class="card card-blue">
                <div>Students</div>
                <div class="card-number">
                    <%= request.getAttribute("studentsCount") != null ? request.getAttribute("studentsCount") : 7 %>
                </div>
            </div>
            <div class="card card-green">
                <div>HODs</div>
                <div class="card-number">
                    <%= request.getAttribute("hodsCount") != null ? request.getAttribute("hodsCount") : 4 %>
                </div>
            </div>
            <div class="card card-red">
                <div>Company</div>
                <div class="card-number">
                    <%= request.getAttribute("companiesCount") != null ? request.getAttribute("companiesCount") : 4 %>
                </div>
            </div>
            <div class="card card-teal">
                <div>Selected Students</div>
                <div class="card-number">
                    <%= request.getAttribute("selectedStudentsCount") != null ? request.getAttribute("selectedStudentsCount") : 2 %>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
