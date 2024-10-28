<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eNotes - Take Notes Online</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
    }

    /* Navbar Styles */
    .navbar {
        background-color: #00796b;
        padding: 15px 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
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
        color: #00796b;
    }

    /* Main Content Styles */
    .main-content {
        padding: 50px;
        text-align: center;
    }

    .main-title {
        font-size: 36px;
        color: #333;
        margin-bottom: 20px;
    }

    .main-subtitle {
        font-size: 18px;
        color: #666;
        margin-bottom: 50px;
    }

    /* Feature Cards */
    .features {
        display: flex;
        justify-content: center;
        gap: 30px;
        flex-wrap: wrap;
        padding: 20px;
    }

    .feature-card {
        background-color: white;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        width: 300px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        transition: transform 0.3s ease;
    }

    .feature-card:hover {
        transform: translateY(-5px);
    }

    .feature-title {
        font-size: 20px;
        color: #00796b;
        margin-bottom: 10px;
    }

    .feature-text {
        color: #666;
        line-height: 1.5;
    }

    /* Footer */
    .footer {
        background-color: #f5f5f5;
        text-align: center;
        padding: 20px;
        position: fixed;
        bottom: 0;
        width: 100%;
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
        .navbar {
            padding: 15px 20px;
            flex-direction: column;
            gap: 15px;
        }

        .nav-buttons {
            width: 100%;
            justify-content: center;
        }

        .main-content {
            padding: 30px 20px;
        }

        .main-title {
            font-size: 28px;
        }

        .feature-card {
            width: 100%;
            max-width: 300px;
        }
    }
</style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="index.jsp" class="logo">eNotes</a>
        <div class="nav-buttons">
            <a href="index.jsp" class="nav-btn">Home</a>
            <a href="Login.jsp" class="nav-btn">Login</a>
            <a href="Register.jsp" class="nav-btn">Register</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1 class="main-title">Welcome to eNotes</h1>
        <p class="main-subtitle">Your Digital Notebook for Seamless Note-Taking</p>

        <!-- Feature Cards -->
        <div class="features">
            <div class="feature-card">
                <h2 class="feature-title">Create Notes</h2>
                <p class="feature-text">Create and organize your notes efficiently with our user-friendly interface.</p>
            </div>

            <div class="feature-card">
                <h2 class="feature-title">Access Anywhere</h2>
                <p class="feature-text">Access your notes from any device, anytime, anywhere.</p>
            </div>

            <div class="feature-card">
                <h2 class="feature-title">Secure Storage</h2>
                <p class="feature-text">Your notes are securely stored and protected with us.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 eNotes. All rights reserved.</p>
    </div>
</body>
</html>