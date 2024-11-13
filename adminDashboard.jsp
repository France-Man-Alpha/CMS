<%@page import="applicationdevelopment.contentmanagementsystem.models.Video"%>
<%@page import="applicationdevelopment.contentmanagementsystem.models.Image"%>
<%@page import="applicationdevelopment.contentmanagementsystem.models.Article"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            color: #333;
            padding: 20px;
        }
        
        h1, h2 {
            text-align: center;
            color: #fff;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #ff6f61;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #ffe0e0;
        }

        tr:hover {
            background-color: #ffb3b3;
        }

        .delete-button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .delete-button:hover {
            background-color: #e60000;
        }

        .popup {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            z-index: 1000;
        }

        .popup h2 {
            color: #333;
        }

        .popup button {
            background-color: #ff6f61;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .popup button:hover {
            background-color: #ff4d4d;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.7);
            z-index: 999;
        }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>

    <script>
        function showPopup(message) {
            var popup = document.getElementById("popup");
            var overlay = document.getElementById("overlay");
            document.getElementById("popupMessage").innerText = message;
            popup.style.display = "block";
            overlay.style.display = "block";
        }

        function closePopup() {
            var popup = document.getElementById("popup");
            var overlay = document.getElementById("overlay");
            popup.style.display = "none";
            overlay.style.display = "none";
        }

        window.onload = function() {
            var message = '<%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %>';
            if (message) {
                showPopup(message);
            }
        }
    </script>

    <!-- Overlay for popup -->
    <div id="overlay" class="overlay" onclick="closePopup()"></div>

    <!-- Popup for success message -->
    <div id="popup" class="popup">
        <h2>Success!</h2>
        <p id="popupMessage"></p>
        <button onclick="closePopup()">Close</button>
    </div>

    <!-- Section to display articles -->
    <h2>Articles Posted by Users</h2>
    <table>
        <tr>
            <th>Title</th>
            <th>Content</th>
            <th>Posted By</th>
            <th>Date Posted</th>
            <th>Action</th>
        </tr>
        <c:forEach var="article" items="${publicArticles}">
            <tr>
                <td>${article.title}</td>
                <td>${article.content}</td>
                <td>${article.username}</td>
                <td>${article.datePosted}</td>
                <td>
                    <form method="post" action="DeleteServlet" style="display:inline;">
                        <input type="hidden" name="type" value="article" />
                        <input type="hidden" name="id" value="${article.id}" />
                        <input type="hidden" name="username" value="${article.username}" />
                        <input type="hidden" name="title" value="${article.title}" />
                        <input type="hidden" name="content" value="${article.content}" />
                        <input type="hidden" name="datePosted" value="${article.datePosted}" />
                        <input type="submit" value="Delete" class="delete-button" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- Section to display images -->
    <h2>Images Posted by Users</h2>
    <table>
        <tr>
            <th>Image</th>
            <th>Caption</th>
            <th>Posted By</th>
            <th>Date Posted</th>
            <th>Action</th>
        </tr>
        <c:forEach var="image" items="${publicImages}">
            <tr>
                <td><img src="${image.filename}" alt="${image.caption}" width="100px"/></td>
                <td>${image.caption}</td>
                <td>${image.username}</td>
                <td>${image.datePosted}</td>
                <td>
                    <form method="post" action="DeleteServlet" style="display:inline;">
                        <input type="hidden" name="type" value="image" />
                        <input type="hidden" name="id" value="${image.id}" />
                        <input type="hidden" name="username" value="${image.username}" />
                        <input type="hidden" name="filename" value="${image.filename}" />
                        <input type="hidden" name="caption" value="${image.caption}" />
                        <input type="hidden" name="datePosted" value="${image.datePosted}" />
                        <input type="submit" value="Delete" class="delete-button" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- Section to display videos -->
    <h2>Videos Posted by Users</h2>
    <table>
        <tr>
            <th>Video</th>
            <th>Caption</th>
            <th>Posted By</th>
            <th>Date Posted</th>
            <th>Action</th>
        </tr>
        <c:forEach var="video" items="${publicVideos}">
            <tr>
                <td>
                    <video width="100" controls>
                        <source src="${video.filename}" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                </td>
                <td>${video.caption}</td>
                <td>${video.username}</td>
                <td>${video.datePosted}</td>
                <td>
                    <form method="post" action="DeleteServlet" style="display:inline;">
                        <input type="hidden" name="type" value="video" />
                        <input type="hidden" name="id" value="${video.id}" />
                        <input type="hidden" name="username" value="${video.username}" />
                        <input type="hidden" name="filename" value="${video.filename}" />
                        <input type="hidden" name="caption" value="${video.caption}" />
                        <input type="hidden" name="datePosted" value="${video.datePosted}" />
                        <input type="submit" value="Delete" class="delete-button" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
