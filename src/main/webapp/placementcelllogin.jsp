<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Placement Cell Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/login.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(5px);
            border-radius: 10px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            padding: 30px;
            text-align: center;
            opacity: 0;
            transform: scale(0.8);
            animation: scaleUp 0.8s ease-out forwards;
        }

        h1 {
            color: #34495E;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            color: #34495E;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 14px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            background-color: #F9F9F9;
        }

        .form-button-container {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .form-button-container button {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-button-container .login-button {
            background-color: #3498DB;
            color: white;
        }

        .form-button-container .login-button:hover {
            background-color: #2980B9;
        }

        .form-button-container .clear-button {
            background-color: #E74C3C;
            color: white;
        }

        .form-button-container .clear-button:hover {
            background-color: #C0392B;
        }

        @keyframes scaleUp {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <%@ include file="mainnavbar.jsp" %>
    <div class="login-container">
        <h1>Placement Cell Login</h1>
        <form method="post" action="checkplacementcelllogin">
            <div class="form-group">
                <label for="email">Enter Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Enter Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-button-container">
                <button type="submit" class="login-button">Login</button>
                <button type="reset" class="clear-button">Clear</button>
            </div>
        </form>
    </div>
</body>
</html>