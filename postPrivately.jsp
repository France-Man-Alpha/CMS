<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Your Content Won't be Visible to AnyOne</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(270deg, #4CAF50, #2196F3, #FFC107, #FF9800, #9C27B0, #00BCD4); /* Color gradient background */
            background-size: 400% 400%; /* Size for animation */
            animation: gradient 15s ease infinite; /* Animation for background change */
            margin: 0;
            padding: 0;
            color: #333; /* Dark text color for readability */
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            20% { background-position: 20% 50%; }
            40% { background-position: 40% 50%; }
            60% { background-position: 60% 50%; }
            80% { background-position: 80% 50%; }
            100% { background-position: 100% 50%; }
        }

        header {
            background-color: rgba(74, 144, 226, 0.5); /* Semi-transparent blue header */
            color: white;
            padding: 15px 20px;
            text-align: center;
        }

        nav {
            background-color: rgba(51, 51, 51, 0.9); /* Semi-transparent dark navigation background */
            overflow: hidden;
        }

        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        nav a:hover {
            background-color: rgba(87, 87, 87, 0.8); /* Hover effect for links */
        }

        .container {
            display: flex;
            justify-content: space-around; /* Space between forms */
            flex-wrap: wrap; /* Allow wrapping on smaller screens */
            margin: 20px; /* Margin around container */
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.3); /* Semi-transparent white form background */
            border-radius: 25px; /* More rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow */
            padding: 20px;
            margin: 10px; /* Margin between forms */
            max-width: 300px; /* Max width for forms */
            flex: 1; /* Allow flex growth */
            min-width: 250px; /* Minimum width for forms */
        }

        h2 {
            text-align: center; /* Center titles */
            color: #4A90E2; /* Title color */
            margin-bottom: 15px; /* Space below titles */
        }

        label {
            display: block;
            margin: 10px 0 5px; /* Spacing for labels */
        }

        input[type="text"], textarea, input[type="file"] {
            width: 80%; /* Full width inputs */
            padding: 10px;
            border: 1px solid #ccc; /* Light border */
            border-radius: 15px; /* Rounded corners */
            margin-bottom: 15px; /* Space between inputs */
        }

        button {
            background-color: #4A90E2; /* Blue button */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%; /* Full width button */
        }

        button:hover {
            background-color: #100ABD; /* Darker blue on hover */
        }

        @media (max-width: 600px) {
            .container {
                flex-direction: column; /* Stack forms vertically on smaller screens */
                align-items: center; /* Center forms */
            }
        }
        
        
        
        
   


/* Popup Styles */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.9);
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
            padding: 5px 2px;
            cursor: pointer;
            float: right;
        }
        
        
        
       
        
        
        
        
        
        
        
    </style>
</head>
<body>
    <header>
        <h1>This Content Won't be Visible to AnyOne</h1>
    </header>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="PersonalBlogServlet?username=${sessionScope.username}">Back</a>
    </nav>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   

    <div class="container">
        <!-- Form to post an article -->
        <div class="form-container">
            <h2>Write An Article</h2>
            <form action="PersonalBlogServlet" method="post">
                <input type="hidden" name="action" value="postArticle" />
                <input type="hidden" name="username" value="${username}" />
                <label for="title">Title:</label>
                <input type="text" name="title" required />
                
                <label for="content">Content:</label>
                <textarea name="content" required></textarea>
                
                <button type="submit">Post Article</button>
            </form>
        </div>

        <!-- Form to post an image -->
        <div class="form-container">
            <h2>Post Image</h2>
            <form action="PersonalBlogServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="postImage" />
                <input type="hidden" name="username" value="${username}" />
                <label for="caption">Image Caption:</label>
                <input type="text" name="caption" required />
                
                <label for="file">Select Image:</label>
                <input type="file" name="file" accept="image/*" required />
                
                <button type="submit">Post Image</button>
            </form>
        </div>

        <!-- Form to post a video -->
        <div class="form-container">
            <h2>Post Video</h2>
            <form action="PersonalBlogServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="postVideo" />
                <input type="hidden" name="username" value="${username}" />
                <label for="caption">Video Caption:</label>
                <input type="text" name="caption" required />
                
                <label for="file">Select Video:</label>
                <input type="file" name="file" accept="video/*" required />
                
                <button type="submit">Post Video</button>
            </form>
        </div>
    </div>
                
       
                 
         <!-- Popup for Posting Guidelines -->
    <div class="popup" id="guidelines-popup">
        <button class="close-btn" onclick="closePopup()">X</button>
        <h2>REMINDER</h2>
        <h3>Content Visibility:</h3>
        <p>*The Content That You Will Post From Here Will Not Be Public But Will Be Only Be Visible To Your 
        Personal Blog.</p>
        <p>*Keep In Mind That This Platform Does Not Allow Explicit Content. </p>
       
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
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
</body>
</html>
