<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <style>
        /* Common styling for all pages */
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 2.5rem;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 1rem;
            color: #333;
        }

        label {
            margin-bottom: 0.5rem;
            color: #555;
            display: block;
            text-align: left;
        }

        input[type="password"] {
            width: 100%;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border: 2px solid #ddd;
            border-radius: 6px;
        }

        button {
            padding: 1rem;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 6px;
            width: 100%;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .error-message {
            color: #ff4444;
            font-size: 0.875rem;
            margin-top: 1rem;
        }

        .back-link {
            margin-top: 1rem;
            font-size: 0.9rem;
        }

        .back-link a {
            color: #764ba2;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link a:hover {
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reset Password</h2>
        <form action="ResetPasswordServlet" method="post">
            <label for="password">New Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Reset Password</button>
        </form>
    
        <div class="back-link">
            <a href="Login.jsp">Back to Login</a>
        </div>
    </div>
</body>
</html>
