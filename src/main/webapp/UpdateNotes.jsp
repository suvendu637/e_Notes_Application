<%@page import="com.org.dao.NotesDao"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.org.dto.Notes" %>
<%@ page import="com.org.dao.UserDao" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession session2 = request.getSession();
    User user = (User) session.getAttribute("userObj");

    if (user == null) {
        response.sendRedirect("Login.jsp"); // Redirect to login if user is not logged in
        return;
    }

    // Get the note ID from request parameter
    int noteId = Integer.parseInt(request.getParameter("noteId"));
    
    UserDao dao = new UserDao();
    NotesDao dao1=new NotesDao();
    Notes note = dao1.getNoteById(noteId); // Fetch note by ID
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Note</title>
    <style>
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 15px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 95%;
            top: 0;
            z-index: 1000;
        }

        .logo {
            color: white;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
        }

        .nav-buttons {
            display: flex;
            gap: 20px;
        }

        .nav-btn {
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border: 2px solid white;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .nav-btn:hover {
            background-color: white;
            color: #764ba2;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(118, 75, 162, 0.1);
        }

        .form-title {
            color: #764ba2;
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            color: #764ba2;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 2px solid #e1e1e1;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #764ba2;
            box-shadow: 0 0 0 2px rgba(118, 75, 162, 0.1);
        }

        .submit-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(118, 75, 162, 0.3);
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp" class="logo">eNotes</a>
        <div class="nav-buttons">
            <a href="index.jsp" class="nav-btn">Home</a>
            <a href="Login.jsp" class="nav-btn">Profile</a>
            <a href="LogoutServlet" class="nav-btn">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2 class="form-title">Update Your Note</h2>
        <form action="updateNote" method="post">
            <input type="hidden" name="noteId" value="<%= note.getId() %>"/>
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="<%= note.getTitle() %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" required><%= note.getDescription() %></textarea>
            </div>
            <button type="submit" class="submit-btn">Update Note</button>
        </form>
    </div>
</body>
</html>
