<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        /* Common styles for consistency */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

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
            color: #333;
            margin-bottom: 2rem;
            font-size: 2rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        input[type="email"] {
            width: 100%;
            padding: 1rem;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
        }

        input[type="email"]:focus {
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

        .back-to-login {
            margin-top: 1rem;
            font-size: 0.9rem;
        }

        .back-to-login a {
            color: #764ba2;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .back-to-login a:hover {
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <form action="ForgotPasswordServlet" method="post">
            <label for="email">Enter your email address</label>
            <input type="email" id="email" name="email" required>
            <button type="submit">Submit</button>
        </form>
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>
        <div class="back-to-login">
            <a href="Login.jsp">Back to Login</a>
        </div>
    </div>
</body>
</html>
