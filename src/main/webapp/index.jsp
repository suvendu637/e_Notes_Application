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
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #333;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    /* Navbar Styles */
    .navbar {
        background-color: #00796b;
        padding: 15px 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Added 3D effect */
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    .logo {
        color: white;
        text-decoration: none;
        font-size: 24px;
        font-weight: bold;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3); /* Text 3D effect */
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
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2); /* Added button shadow */
    }

    .nav-btn:hover {
        background-color: white;
        color: #00796b;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* Hover 3D effect */
    }

    /* Main Content Styles */
    .main-content {
        padding: 50px;
        text-align: center;
    }

    .main-title {
        font-size: 36px;
        color: #fff;
        margin-bottom: 20px;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Title shadow */
    }

    .main-subtitle {
        font-size: 18px;
        color: #ddd;
        margin-bottom: 50px;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2); /* Subtitle shadow */
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
        background: linear-gradient(145deg, #ffffff, #e6e6e6);
        border-radius: 10px;
        padding: 20px;
        width: 300px;
        box-shadow: 8px 8px 15px rgba(0, 0, 0, 0.2), -4px -4px 10px rgba(255, 255, 255, 0.7); /* 3D effect */
        transition: all 0.3s ease;
    }

    .feature-card:hover {
        transform: translateY(-8px); /* Hover lift effect */
        box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.3), -6px -6px 15px rgba(255, 255, 255, 0.9); /* Enhanced hover shadow */
    }

    .feature-title {
        font-size: 20px;
        color: #00796b;
        margin-bottom: 10px;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2); /* Feature title shadow */
    }

    .feature-text {
        color: #666;
        line-height: 1.5;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* Feature text shadow */
    }

    /* Footer */
    .footer {
        background-color: rgba(255, 255, 255, 0.8);
        text-align: center;
        padding: 20px;
        box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1); /* Footer shadow */
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
