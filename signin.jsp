<%-- 
    Document   : signin
    Created on : Sep 15, 2024, 9:43:38 PM
    Author     : HP ELITEBOOK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signin</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file for styling -->
    <style>
        /* Additional inline styles for the page */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('bg3.jpg') no-repeat center center/cover; /* Background image */
            margin: 0;
        }

        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.3); /* More transparent background for the form */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 30px; /* Rounded corners */
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #fff; /* White text for visibility */
        }

        /* GIF styling */
        .gif-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .gif-container img {
            max-width: 100%;
            height: 130px;
            border-radius: 20px; /* Rounded corners for GIF */
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

       label {
            text-align: left;
            color: #fff; /* Black text for labels */
            font-weight: bold; /* Bold text for labels */
            margin-bottom: 5px; /* Space below label */
        }

        input[type="text"],
        input[type="password"] {
            width: 96%; /* Full width input fields */
            padding: 12px;
            border: 1px solid rgba(255, 255, 255, 0.0); /* Light border for input fields */
            border-radius: 18px; /* Rounded input fields */
            background: rgba(255, 255, 255, 0.0); /* Transparent background for input fields */
            
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 18px; /* Rounded submit button */
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- GIF Section -->
        <div class="gif-container">
            <img src="https://cliply.co/wp-content/uploads/2019/02/371901180_INSTALIKES_400.gif" alt="Content Creation GIF">
        </div>

        <!-- Sign-in Form -->
        <h2>Sign In</h2>
        
        <form action="SignInServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Sign In">
            <p>No Account? <a href="signup.jsp">Create account</a></p>
        </form>
    </div>
</body>
</html>
