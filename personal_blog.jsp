<%@page import="applicationdevelopment.contentmanagementsystem.models.Video"%>
<%@page import="applicationdevelopment.contentmanagementsystem.models.Image"%>
<%@page import="applicationdevelopment.contentmanagementsystem.models.Article"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    List<Article> articles = (List<Article>) request.getAttribute("articles");
    List<Image> images = (List<Image>) request.getAttribute("images");
    List<Video> videos = (List<Video>) request.getAttribute("videos");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Personal Blog</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Styles go here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease;
            background: linear-gradient(45deg, #ff7e5f, #feb47b, #86e3ce, #5e60ce, #c77dff);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1 {
            text-align: center;
            color: #fff; /* White text for contrast against the background */
            margin-top: 20px;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #0056b3;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Three equal columns */
            gap: 20px;
        }

        .form-section, .content-section {
            background: rgba(255, 255, 255, 0.8); /* Set transparent background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px; /* Increased gap for better separation */
        }

        input[type="text"], textarea, input[type="file"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        textarea {
            resize: none;
            height: 150px;
        }

        button {
            background-color: #dc3545; /* Red Button */
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px; /* Adjusted padding for a better look */
            cursor: pointer;
             width: 20%;
            transition: background-color 0.3s;
            font-size: 16px; /* Increased font size for better readability */
        }

        button:hover {
            background-color: #c82333;
        }

        .post {
            border: 1px solid #eaeaea;
            border-radius: 8px;
            padding: 15px;
            transition: transform 0.2s;
            text-align: center;
        }

        .post:hover {
            transform: scale(1.02);
        }

        .post img, .post video {
            max-width: 100%;
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #fff; /* White text for contrast */
            grid-column: span 3; /* Span all columns for headings */
            margin-top: 30px; /* Add some space above headings */
        }

        .social-media {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 20px;
        }

        .social-media a {
            color: #007bff;
            text-decoration: none;
            padding: 15px;
            border-radius: 50%;
            font-size: 24px;
            transition: background-color 0.3s;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .social-media a:hover {
            background-color: #0056b3;
            color: white;
        }

        .slider {
            position: relative;
            overflow: hidden;
            width: 100%;
            max-width: 800px;
            margin: auto;
        }

        .slides {
            display: flex;
            transition: transform 0.5s ease;
        }

        .slide {
            min-width: 100%;
            box-sizing: border-box;
            padding: 20px;
        }

        .slide video {
            max-width: 100%;
            border-radius: 8px;
        }

        .controls {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
        }

        .control-btn {
            background: rgba(255, 255, 255, 0.7);
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 50%;
        }
        
        .red-text {
    color: red; /* Set text color to red */
}














@keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        h2 {
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
            margin-top: 20px;
            font-weight: bold;
        }

        
        
        
         @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

/* Popup Styles */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.5);
            padding: 20px;
            z-index: 2000;
            animation: fadeInPopup 0.5s ease-in-out;
            max-width: 80%;
            max-height: 80%;
            overflow-y: auto;
        }

        @keyframes fadeInPopup {
            from { opacity: 0; transform: translate(-50%, -60%); }
            to { opacity: 1; transform: translate(-50%, -50%); }
        }

        .popup h2 {
            margin-top: 0;
        }

        .close-btn {
            background-color: #ff4c4c;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            float: right;
        }
        















    </style>
</head>
<body>

    <nav>
        <a href="HomeServlet"><i class="fas fa-home"></i> Home</a>
        <a href="postPrivately.jsp"><i class="fas fa-sign-out-alt"></i> Post On Your Blog</a>
    </nav>

   
<h1 class="red-text">This Content Is Only Seen By You, ${sessionScope.username}</h1> <!-- Include username -->



    <div class="container">
        
        
        
         <h2>Articles</h2>
        <c:forEach var="article" items="${articles}">
            <div class="post">
                <h3>${article.title}</h3>
                <p>${article.content}</p>
                <form action="DeletePrivateContentServlet" method="post">
                    <input type="hidden" name="articleTitle" value="${article.title}" />
                    <input type="hidden" name="type" value="article" />
                    <input type="hidden" name="id" value="${article.id}" /> <!-- Include article ID -->
                    <input type="hidden" name="id" value="${article.content}" />
                    <input type="hidden" name="username" value="${sessionScope.username}"/>
                    <button type="submit">Delete</button>
                </form>
                <br>
                <form action="CreateArticleServlet" method="post">
                    <input type="hidden" name="username" value="${sessionScope.username}"/>
                    <input type="hidden" name="title" value="${article.title}"/>
                    <input type="hidden" name="content" value="${article.content}"/>
                    <input type="hidden" name="id" value="${article.id}"/> <!-- Include article ID -->
                    <button type="submit">Publish</button>
                </form><br><!-- comment -->
                
                <form action="CreateArticleServlet" method="post">
                    <input type="hidden" name="username" value="${sessionScope.username}"/>
                    <input type="hidden" name="title" value="${article.title}"/>
                    <input type="hidden" name="content" value="${article.content}"/>
                    <input type="hidden" name="id" value="${article.id}"/> <!-- Include article ID -->
                    <button type="submit">Edit</button>
                </form>
                
                
                
                
                
            </div>
        </c:forEach>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <!-- Display Images -->
        <h2>Images</h2>
        <c:forEach var="image" items="${images}">
            <div class="post">
                <img src="uploads/${image.imageFilename}" alt="${image.imageCaption}" />
                <p>${image.imageCaption}</p>
                <form action="DeletePrivateContentServlet" method="post">
                    <input type="hidden" name="imageFilename" value="${image.imageFilename}" />
                    <input type="hidden" name="imageCaption" value="${image.imageCaption}" />
                    <input type="hidden" name="type" value="image" /> <!-- Ensure the type is set -->
                    <input type="hidden" name="id" value="${image.id}" /> <!-- Ensure the ID is set -->
                    <input type="hidden" name="username" value="${sessionScope.username}" /> <!-- Add username here -->
                    <button type="submit">Delete</button>
                </form>
                <br>
                <form action="PublishPrivateContentServlet" method="post" enctype="multipart/form-data">        
                    <input type="hidden" name="imageFilename" value="${image.imageFilename}" />
                    <input type="hidden" name="imageCaption" value="${image.imageCaption}" />
                    <input type="hidden" name="type" value="image" /> <!-- Ensure the type is set -->
                    <input type="hidden" name="id" value="${image.id}" /> <!-- Ensure the ID is set -->
                    <input type="hidden" name="username" value="${sessionScope.username}" />  <!-- Add username here -->
                    <button type="submit">Publish</button>
                </form>
            </div>
        </c:forEach>

        <h2>Videos</h2>
        <c:forEach var="video" items="${videos}">
            <div class="post">
                <video controls>
                    <source src="uploads/${video.videoFilePath}" type="video/mp4" />
                    Your browser does not support the video tag.
                </video>
                <p>${video.videoCaption}</p>

                <!-- Form for publishing the displayed video -->
                <form action="PublishPrivateContentServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="username" value="${sessionScope.username}"/>
                    <input type="hidden" name="videoFilePath" value="${video.videoFilePath}"/>
                    <input type="hidden" name="videoCaption" value="${video.videoCaption}"/>
                    <input type="hidden" name="id" value="${video.id}"/> <!-- Include video ID -->
                    <button type="submit">Publish</button>
                </form>
                <br>
                <!-- Form for deleting the displayed video -->
                <form action="DeletePrivateContentServlet" method="post">
                    <input type="hidden" name="username" value="${sessionScope.username}"/>
                    <input type="hidden" name="videoFilePath" value="${video.videoFilePath}"/>
                    <input type="hidden" name="videoCaption" value="${video.videoCaption}"/>
                    <input type="hidden" name="id" value="${video.id}"/> <!-- Include video ID -->
                    <input type="hidden" name="type" value="video" />
                    <button type="submit">Delete</button>
                </form>
            </div>
        </c:forEach>

        
        
        
        
       
    </div>
        
        
        <!-- Popup for Posting Guidelines -->
    <div class="popup" id="guidelines-popup">
        <button class="close-btn" onclick="closePopup()">X</button>
        <h2>REMINDER</h2>
        <h3>Content Visibility:</h3>
        <p>The Content You Posted Here Is Only Visible To You,You Can Publish It Anytime To Make it Visible</p>
       
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<script>
        // Function to show the popup
        // Function to close the popup
        function closePopup() {
            document.getElementById("guidelines-popup").style.display = "none";
        }

        // Function to scroll the slider
        function scrollSlider(sliderId, direction) {
            const slider = document.getElementById(sliderId);
            const scrollAmount = slider.clientWidth * 0.8; // Scroll by 80% of the slider width
            slider.scrollLeft += direction * scrollAmount;
        }

        // Show the popup on page load
        window.onload = function() {
            document.getElementById("guidelines-popup").style.display = "block"; // Show popup on load
        };
    </script> 
        
        
        
        
        
        
        
        
        
        
        
        
        
        

    <footer class="social-media">
        <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
        <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
        <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
        <a href="#" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
    </footer>

</body>
</html>
