<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.org.dto.User" %>
<%@ page import="com.org.dao.NotesDao" %>

<%
    // Assuming user session is already set up
    HttpSession ses = request.getSession();
    User user = (User) ses.getAttribute("userObj");

    if (user == null) {
        response.sendRedirect("Login.jsp"); // Redirect to login if user is not logged in
        return;
    }

    // Fetch the note count for the user
    NotesDao notesDao = new NotesDao();
    int notesCount = notesDao.getNotesCountByUserId(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: 600;
        }

        .profile-info {
            text-align: left;
            margin-top: 20px;
        }

        .profile-info p {
            font-size: 18px;
            color: #333;
            line-height: 1.6;
            margin: 10px 0;
        }

        .profile-info span {
            font-weight: bold;
            color: #667eea;
        }

        .btn-container {
            margin-top: 30px;
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .btn {
            padding: 10px 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            text-decoration: none;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Profile</h2>

        <div class="profile-info">
            <p><span>Full Name:</span> <%= user.getName() %></p>
            <p><span>Email:</span> <%= user.getEmail() %></p>
            <p><span>Password:</span> <%= user.getPassword() %></p>
            <p><span>Number of Notes:</span> <%= notesCount %></p>
        </div>

        <div class="btn-container">
            <a href="updateProfile.jsp" class="btn">Edit Profile</a>
            <a href="UserHome.jsp" class="btn">Back to Home</a>
        </div>
    </div>
</body>
</html>
