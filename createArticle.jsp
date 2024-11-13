<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Article</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(90deg, #f0f8ff, #e6f7ff);
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .navigation {
            display: flex;
            justify-content: space-around;
            width: 100%;
            background: rgba(255, 255, 255, 0.9);
            padding: 10px 0;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navigation a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s;
        }

        .navigation a:hover {
            color: #0056b3;
        }

        .container {
            max-width: 600px;
            width: 100%;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.5s ease-in-out;
            margin-top: 20px;
        }

        @keyframes slideIn {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-weight: bold;
        }

        label {
            font-size: 18px;
            margin-top: 10px;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
            transition: background-color 0.3s, transform 0.2s;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <div class="navigation">
        <a href="HomeServlet"><i class="fas fa-home"></i> Home</a>
        <a href="createVideo.jsp"><i class="fas fa-video"></i> Post a Video</a>
        <a href="createImage.jsp"><i class="fas fa-image"></i> Post an Image</a>
    </div>

    <div class="container">
        <h1><i class="fas fa-pencil-alt"></i> Create a new Public Post</h1>
        <form action="CreateArticleServlet" method="post">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" required>

            <label for="content">Content</label>
            <textarea id="content" name="content" rows="5" required></textarea>

            <div class="toggle-label">
                <label for="isPrivate">Wanna Make it Private?</label>
                <input type="checkbox" id="isPrivate" name="isPrivate" value="true">Yes
            </div>

            <input type="submit" value="Post">
        </form>
    </div>

</body>
</html>
