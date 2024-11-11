<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.org.dto.User" %>
<%@ page import="com.org.dao.UserDao" %>
<%@ page import="com.org.dao.NotesDao" %>

<%
    // Get the user object from the session
    HttpSession ses = request.getSession();
    User user = (User) ses.getAttribute("userObj");

    if (user == null) {
        response.sendRedirect("Login.jsp"); // Redirect to login if user is not logged in
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
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
            width: 100%;
            max-width: 550px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            animation: slideUp 0.5s ease forwards;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
            width:450px;
        }

        .form-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .form-group input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 16px;
        }

        .form-group input:focus {
            border-color: #667eea;
            outline: none;
        }

        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            margin-left:205px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            width: 140px;
            font-size: 16px;
        }
        .btn2{
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Update Your Profile</h2>
        
        <form action="UpdateProfileServlet" method="POST">
            <div class="form-group">
                <input type="text" id="fullName" name="fullName" value="<%= user.getName() %>" required>
                <i class="fas fa-user"></i>
            </div>
            
            <div class="form-group">
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                <i class="fas fa-envelope"></i>
            </div>
            
            <div class="form-group">
                <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
                <i class="fas fa-lock"></i>
            </div>
            
            <button type="submit" class="btn">Update Profile</button>
        </form>

        <div class="back-link">
            <a href="Profile.jsp" class="btn2">Back to Profile</a>
        </div>
    </div>

</body>
</html>
