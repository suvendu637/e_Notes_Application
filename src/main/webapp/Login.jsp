<!-- Login.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* Your existing styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Navbar styles */
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 15px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
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

        /* Adjust body for fixed navbar */
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 80px; /* Add padding for navbar */
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 2.5rem;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .logo {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo-circle {
            width: 70px;
            height: 70px;
            background: linear-gradient(to right, #667eea, #764ba2);
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }

        .logo-circle i {
            color: white;
            font-size: 2rem;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
        }

        .login-error {
            color: #ff0000;
            text-align: center;
            margin-bottom: 1rem;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 1rem;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input:focus {
            outline: none;
            border-color: #764ba2;
            box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
        }

        button {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(to right, #667eea, #764ba2);
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 1rem;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .forgot-password {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .forgot-password a {
            color: #764ba2;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        .forgot-password a:hover {
            color: #667eea;
        }

        .register-link {
            text-align: center;
            color: #666;
            font-size: 0.9rem;
        }

        .register-link a {
            color: #764ba2;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .register-link a:hover {
            color: #667eea;
        }

        .error {
            color: #ff4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }

        @media (max-width: 480px) {
            .container {
                margin: 1rem;
                padding: 1.5rem;
            }
        }
        [Rest of your existing styles...]
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

    <!-- Your existing login container -->
    <div class="container">
       <div class="logo">
            <div class="logo-circle">
                <i>👤</i>
            </div>
        </div>
        <h2>Welcome Back</h2>
        
        <%-- Check for error message in session --%>
        <% 
            String errorMsg = (String) session.getAttribute("failed");
            if (errorMsg != null) {
        %>
            <div class="login-error">Invalid Credentials</div>
        <%
                // Remove the error message from session after displaying
                session.removeAttribute("failed");
            }
        %>

        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
                <div class="error" id="emailError"></div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
                <div class="error" id="passwordError"></div>
            </div>

            <div class="forgot-password">
                <a href="ForgotPassword.jsp">Forgot your password?</a>
            </div>

            <button type="submit">Log In</button>

            <div class="register-link">
                Don't have an account? <a href="Register.jsp">Sign Up</a>
            </div>
        </form>
    </div>
</body>
</html>