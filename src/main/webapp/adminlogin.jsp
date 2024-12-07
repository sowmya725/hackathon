<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        /* General page styles */
        body {
            font-family: 'Helvetica Neue', sans-serif;
            background-image: url('/images/login.png'); /* Updated Background Image */
            background-size: cover; /* Cover the full page */
            background-position: center;
            color: #333; /* Dark Text */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            background-attachment: fixed;
        }

        /* Transparent container form */
        .container {
            width: 100%;
            max-width: 400px; /* Adjusted width for compact form */
            background-color: rgba(255, 255, 255, 0.3); /* More transparent background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3); /* Light shadow */
            text-align: center;
            opacity: 0; /* Initially hidden */
            transform: scale(0.8); /* Starting small */
            animation: scaleUp 0.8s ease-out forwards; /* Motion effect */
            backdrop-filter: blur(5px); /* Apply a slight blur effect */
        }

        h1 {
            color: #2C3E50; /* Dark Blue */
            margin-bottom: 20px;
            font-size: 24px; /* Adjusted font size */
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

        .form-group input {
            width: 100%; /* Full width for text inputs */
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
            display: flex;
            justify-content: space-between; /* Space between buttons */
        }

        .form-button-container button {
            width: 48%; /* Equal button width */
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-button-container .submit-button {
            background-color: #3498db; /* Blue */
            color: #fff;
        }

        .form-button-container .submit-button:hover {
            background-color: #2980b9; /* Darker Blue */
        }

        .form-button-container .reset-button {
            background-color: #e74c3c; /* Red */
            color: #fff;
        }

        .form-button-container .reset-button:hover {
            background-color: #c0392b; /* Darker Red */
        }			/* Animation for scale-up effect */
			        @keyframes scaleUp {
			            0% {
			                opacity: 0;
			                transform: scale(0.8); /* Start small */
			            }
			            100% {
			                opacity: 1;
			                transform: scale(1); /* End at normal size */
			            }
			        }
			    </style>
			</head>
			<body>
			    <%@ include file="mainnavbar.jsp" %> <!-- Including Navbar -->
			    <div class="container">
			        <h1>Admin Login</h1>
			        <form method="post" action="checkadminlogin">
			            <div class="form-group">
			                <label for="auname">Enter Username:</label>
			                <input type="text" id="auname" name="auname" required>
			            </div>
			            <div class="form-group">
			                <label for="apwd">Enter Password:</label>
			                <input type="password" id="apwd" name="apwd" required>
			            </div>
			            <div class="form-button-container">
			                <button type="submit" class="submit-button">Login</button>
			                <button type="reset" class="reset-button">Clear</button>
			            </div>
			        </form>
			    </div>
			</body>
			</html>