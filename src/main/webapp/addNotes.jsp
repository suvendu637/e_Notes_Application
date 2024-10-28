<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%
    HttpSession session2 = request.getSession(false); // Get the current session, do not create a new one

    // Check if the session is null or if the user is not logged in
    if (session2 == null || session2.getAttribute("userObj") == null) {
        response.sendRedirect("Login.jsp"); // Redirect to the login page
        return; // Stop further processing
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
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

/* Form Styles */
.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
}

.notes-form {
    background: white;
    padding: 30px;
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

textarea.form-control {
    min-height: 200px;
    resize: vertical;
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

/* Adding some decorative elements */
.decoration-circle {
    position: fixed;
    width: 300px;
    height: 300px;
    border-radius: 50%;
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
    z-index: -1;
}

.circle-1 {
    top: -100px;
    right: -100px;
}

.circle-2 {
    bottom: -100px;
    left: -100px;
}
</style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="index.jsp" class="logo">eNotes</a>
        <div class="nav-buttons">
            <a href="index.jsp" class="nav-btn">Home</a>
            <a href="Login.jsp" class="nav-btn">Profile</a>
            <a href="Register.jsp" class="nav-btn">Logout</a>
        </div>
    </div>

    <!-- Decorative circles -->
    <div class="decoration-circle circle-1"></div>
    <div class="decoration-circle circle-2"></div>

    <!-- Main Content -->
    <div class="container">
        <form class="notes-form" action="addnotes" method="post">
            <h2 class="form-title">Add Your Notes</h2>
            
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="Enter note title" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" placeholder="Enter your note description" required></textarea>
            </div>
            
            <button type="submit" class="submit-btn">Save Note</button>
        </form>
    </div>
</body>
</html>