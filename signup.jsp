<%-- 
    Document   : signup
    Created on : Sep 15, 2024, 9:42:58 PM
    Author     : HP ELITEBOOK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
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

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            text-align: left;
            color: #000; /* Black text for labels */
            font-weight: bold; /* Bold text for labels */
            margin-bottom: 5px; /* Space below label */
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 96%; /* Full width input fields */
            padding: 12px;
            border: 1px solid rgba(255, 255, 255, 0.0); /* Transparent border for input fields */
            border-radius: 18px; /* Rounded input fields */
            background: rgba(255, 255, 255, 0.2); /* Slightly transparent background for input fields */
            color: #000; /* Black text color for input fields */
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

        p {
            color: #fff; /* White text for additional info */
        }

        a {
            color: #4CAF50; /* Green link color */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Signup Form -->
        <h2>Signup</h2>
        <form action="SignUpServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Signup">
            <p>Already have an account? <a href="signin.jsp">Sign in</a></p>
        </form>
    </div>
</body>
</html>
