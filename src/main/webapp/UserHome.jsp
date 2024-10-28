<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.org.dto.User" %>
<%@ page import="com.org.dto.Notes" %>
<%@ page import="com.org.dao.UserDao" %>

<%
    HttpSession session2 = request.getSession();
    User user = (User) session2.getAttribute("userObj");
    
    if (user == null) {
        response.sendRedirect("Login.jsp"); // Redirect to login if user is not logged in
        return;
    }

    UserDao dao = new UserDao();
    List<Notes> userNotes = dao.getNotesByUserId(user.getId()); // Fetch user's notes
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Home</title>
    <style>
        /* Navbar Styles */
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 15px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 95%;
            top: 0;
            z-index: 1000;
            position: fixed;
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

        /* Main Content Styles */
        .container {
            max-width: 800px;
            margin: 100px auto 50px auto; /* Added margin for fixed navbar */
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(118, 75, 162, 0.1);
        }

        h1, h2 {
            color: #764ba2;
            text-align: center;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background: #f9f9f9;
            margin: 10px 0;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .action-btn {
            text-decoration: none;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
            border: none;
        }

        .update-btn {
            background-color: #28a745; /* Green for update */
        }

        .delete-btn {
            background-color: #dc3545; /* Red for delete */
        }

        .action-btn:hover {
            opacity: 0.8;
        }

        a {
            display: block;
            text-align: center;
            margin: 20px 0;
            text-decoration: none;
            color: #764ba2;
            font-weight: bold;
            padding: 10px 15px;
            border: 2px solid #764ba2;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #764ba2;
            color: white;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="index.jsp" class="logo">eNotes</a>
        <div class="nav-buttons">
            <a href="index.jsp" class="nav-btn">Home</a>
            <a href="UserHome.jsp" class="nav-btn">Profile</a>
            <a href="LogoutServlet" class="nav-btn">Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h1>Welcome, <%= user.getName() %></h1>
        <h2>Your Notes:</h2>
        
        <ul>
            <%
                if (userNotes != null && !userNotes.isEmpty()) {
                    for (Notes note : userNotes) {
            %>
                <li>
                    <strong><%= note.getTitle() %></strong>: <%= note.getDescription() %>
                    <div class="action-buttons">
                        <form action="UpdateNotes.jsp" method="get">
                            <input type="hidden" name="noteId" value="<%= note.getId() %>">
                            <button type="submit" class="action-btn update-btn">Update</button>
                        </form>
                        <form action="deleteNoteServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this note?');">
                            <input type="hidden" name="noteId" value="<%= note.getId() %>">
                            <button type="submit" class="action-btn delete-btn">Delete</button>
                        </form>
                    </div>
                </li>
            <%
                    }
                } else {
            %>
                <li>No notes found.</li>
            <%
                }
            %>
        </ul>
        
        <a href="addNotes.jsp">Add New Note</a>
         <%
        String successMessage = (String) session2.getAttribute("Success");
        if (successMessage != null) {
            out.println("<script>alert('" + successMessage + "');</script>");
            session2.removeAttribute("Success");
        }

        String errorMessage = (String) session2.getAttribute("Error");
        if (errorMessage != null) {
            out.println("<script>alert('" + errorMessage + "');</script>");
            session2.removeAttribute("Error");
        }
    %>
    </div>
    
</body>
</html>
