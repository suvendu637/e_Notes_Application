<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
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
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }

        .background-squares span {
            position: absolute;
            pointer-events: none;
            background: rgba(255, 255, 255, 0.1);
            animation: animate 10s linear infinite;
        }

        @keyframes animate {
            0% {
                transform: scale(0) translateY(0) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: scale(1) translateY(-1000%) rotate(360deg);
                opacity: 0;
            }
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
            position: relative;
            overflow: hidden;
            transform: translateY(20px);
            animation: slideUp 0.5s ease forwards;
        }

        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            position: relative;
        }

        h2:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: linear-gradient(to right, #667eea, #764ba2);
            border-radius: 3px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            transition: 0.3s;
        }

        .form-group input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s;
            background: rgba(255, 255, 255, 0.9);
        }

        .form-group input:focus {
            border-color: #667eea;
            outline: none;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-group input:focus + i {
            color: #667eea;
        }

        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .btn:before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                120deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .btn:hover:before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .message {
            margin-top: 20px;
            text-align: center;
            color: #666;
            font-size: 14px;
            line-height: 1.6;
        }

        .back-link {
            display: inline-block;
            text-align: center;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
            position: relative;
        }

        .back-link:after {
            content: '';
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: -2px;
            left: 0;
            background: linear-gradient(to right, #667eea, #764ba2);
            transform: scaleX(0);
            transition: 0.3s;
        }

        .back-link:hover:after {
            transform: scaleX(1);
        }

        .error-message {
            background: #fff1f1;
            color: #dc3545;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            border-left: 4px solid #dc3545;
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        .success-message {
            display: none;
            text-align: center;
            padding: 20px;
            background: #d4edda;
            color: #155724;
            border-radius: 10px;
            margin-bottom: 20px;
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <!-- Background Animation -->
    <div class="background-squares">
        <% for(int i = 0; i < 10; i++) { %>
            <span style="
                width: <%= (int)(Math.random() * 50 + 10) %>px;
                height: <%= (int)(Math.random() * 50 + 10) %>px;
                left: <%= (int)(Math.random() * 100) %>%;
                animation-delay: <%= Math.random() * 2 %>s;
                animation-duration: <%= Math.random() * 5 + 5 %>s;
            "></span>
        <% } %>
    </div>

    <div class="container">
        <h2>Forgot Password</h2>
        
        <div id="successMessage" class="success-message">
            Password reset link has been sent to your email!
        </div>
        
        <% 
            String error = request.getParameter("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i>
                <%= error %>
            </div>
        <% } %>
        
        <form action="forgotPasswordAction.jsp" method="POST" onsubmit="return validateForm()" id="resetForm">
            <div class="form-group">
                <input type="email" id="email" name="email" required 
                       placeholder="Enter your registered email">
                <i class="fas fa-envelope"></i>
            </div>
            
            <button type="submit" class="btn" id="submitBtn">
                Reset Password
            </button>
            
            <div class="message">
                <i class="fas fa-info-circle"></i>
                We'll send you a link to reset your password.
                Please check your email after submission.
            </div>
        </form>
        
        <div style="text-align: center;">
            <a href="Login.jsp" class="back-link">
                <i class="fas fa-arrow-left"></i> Back to Login
            </a>
        </div>
    </div>


</body>
</html>