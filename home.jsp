<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(90deg, #f58529, #f77737, #d62976, #962fbf, #4f5bd5);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 15px 30px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
            display: flex;
            align-items: center;
            transition: color 0.3s;
        }
        nav a:hover {
            color: #6e8efb;
        }
        nav i {
            margin-right: 5px;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }

        .content-section {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
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
            padding: 5px 10px;
            cursor: pointer;
            float: right;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /* Filter Buttons */
        .filter-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .filter-buttons button {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .filter-buttons button:hover {
            background-color: #0056b3;
        }

        .filter-buttons button.active {
            background-color: #0056b3;
        }

        /* Content visibility */
        .hidden {
            display: none;
        }

        /* Horizontal slider container */
        .slider-container {
            display: flex;
            align-items: center;
        }

        .slider {
            display: flex;
            overflow-x: hidden;
            scroll-behavior: smooth;
            width: calc(100% - 60px); /* Adjust width for buttons */
        }

        .slider-content {
            display: flex;
            width: 100%;
        }

        .slider-item {
            flex: 0 0 calc(33.33% - 20px); /* Show 3 items at a time */
            margin-right: 20px;
            background: white;
            padding: 10px;
            border: 1px solid #eaeaea;
            border-radius: 8px;
        }

        .slider-item img,
        .slider-item video {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        /* Slider navigation buttons */
        .slider-btn {
            font-size: 1.5em;
            background-color: rgba(0, 0, 0, 0.3);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        .slider-btn:disabled {
            cursor: not-allowed;
            opacity: 0.5;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <a href="createArticle.jsp"><i class="fas fa-pencil-alt"></i>Create Article</a>
        <a href="createImage.jsp"><i class="fas fa-image"></i>Create Image</a>
        <a href="createVideo.jsp"><i class="fas fa-video"></i>Create Video</a>
        <a href="PersonalBlogServlet?username=${sessionScope.username}">
    <i class="fas fa-blog"></i> My Personal Blog
</a>
    </nav>

    <h1>Public Content</h1>

    <!-- Filter Buttons -->
    <div class="filter-buttons">
        <button onclick="filterContent('all')" class="active">All</button>
        <button onclick="filterContent('articles')">Articles</button>
        <button onclick="filterContent('images')">Images</button>
        <button onclick="filterContent('videos')">Videos</button>
        <button onclick="filterContent('date')">Date</button>
    </div>

    <div class="content-section">

        <!-- Articles Section -->
        <div id="articles-section">
            <h2>Articles</h2>
            <c:forEach var="article" items="${publicArticles}">
                <div class="post">
                    <div class="post-content">
                        <h3 class="post-title">${article.title}</h3>
                        <p class="post-description">${article.content}</p>
    <p class="post-meta">Posted by: <span style="color: red;">${article.username}</span> on ${article.datePosted}</p>

                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Images Slider -->
        <div id="images-section">
            <h2>Images</h2>
            <div class="slider-container">
                <button class="slider-btn" onclick="scrollSlider('image-slider', -1)">&#10094;</button>
                <div class="slider" id="image-slider">
                    <div class="slider-content">
                        <c:forEach var="image" items="${publicImages}">
                            <div class="slider-item">
                                <img src="${image.filename}" alt="${image.caption}" />
                                <p class="post-description">${image.caption}</p>
                                
    <p class="post-meta">Posted by: <span style="color: red;">${image.username}</span> on ${image.datePosted}</p>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <button class="slider-btn" onclick="scrollSlider('image-slider', 1)">&#10095;</button>
            </div>
        </div>

        <!-- Videos Slider -->
        <div id="videos-section">
            <h2>Videos</h2>
            <div class="slider-container">
                <button class="slider-btn" onclick="scrollSlider('video-slider', -1)">&#10094;</button>
                <div class="slider" id="video-slider">
                    <div class="slider-content">
                        <c:forEach var="video" items="${publicVideos}">
                            <div class="slider-item">
                                <video controls>
                                    <source src="${video.filename}" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                                <p class="post-description">${video.caption}</p>
                                <p class="post-meta">Posted by: ${video.username} on ${video.datePosted}</p>
    <p class="post-meta">Posted by: <span style="color: red;">${video.username}</span> on ${video.datePosted}</p>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <button class="slider-btn" onclick="scrollSlider('video-slider', 1)">&#10095;</button>
            </div>
        </div>

    </div>
    
    
    <!-- Popup for Posting Guidelines -->
    <div class="popup" id="guidelines-popup">
        <button class="close-btn" onclick="closePopup()">X</button>
        <h2>Posting Guidelines For This Platform</h2>
        <h3>Content Visibility:</h3>
        <p>You have the option to post your content either publicly or privately on your private blog page. If you choose to post privately, you can return later to publish your content publicly when you are ready.</p>
        <h3>No Anonymity:</h3>
        <p>All posts must be made under your registered username; anonymous posting is not allowed. Please be aware that your activity is being monitored by the admin.</p>
        <h3>Content Monitoring:</h3>
        <p>The admin will review all your posts, except for those made in your private blog. This ensures that all shared content adheres to community standards.</p>
        <h3>Explicit Content Policy:</h3>
        <p>Posts containing explicit content will be deleted immediately upon detection. Please ensure that all submissions comply with our content guidelines to avoid any removal.</p>
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
    <script>
        // Function to scroll the slider
        function scrollSlider(sliderId, direction) {
            const slider = document.getElementById(sliderId);
            const sliderWidth = slider.offsetWidth;
            slider.scrollBy({
                left: direction * sliderWidth / 3, // Scroll by 1 item at a time (1/3 of the slider width)
                behavior: 'smooth'
            });
        }

        // Filter content based on selected type
function filterContent(type) {
    // Get all sections
    const articlesSection = document.getElementById('articles-section');
    const imagesSection = document.getElementById('images-section');
    const videosSection = document.getElementById('videos-section');

    // Hide all sections initially
    articlesSection.classList.add('hidden');
    imagesSection.classList.add('hidden');
    videosSection.classList.add('hidden');

    // Show only the selected section
    if (type === 'articles') {
        articlesSection.classList.remove('hidden');
    } else if (type === 'images') {
        imagesSection.classList.remove('hidden');
    } else if (type === 'videos') {
        videosSection.classList.remove('hidden');
    } else {
        // If "All" is selected, show all sections
        articlesSection.classList.remove('hidden');
        imagesSection.classList.remove('hidden');
        videosSection.classList.remove('hidden');
    }

    // Update active button
    const buttons = document.querySelectorAll('.filter-buttons button');
    buttons.forEach(btn => btn.classList.remove('active'));
    document.querySelector([onclick="filterContent('${type}')"]).classList.add('active');
}
    </script>

</body>
</html>