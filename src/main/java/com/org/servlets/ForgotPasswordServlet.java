package com.org.servlets;

import com.org.dao.UserDao;
import com.org.utilities.EmailUtility;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email"); // User's input email
        UserDao userDao = new UserDao();
 
        // Check if email exists in the database
        if (userDao.emailExists(email)) {
            String verificationCode = userDao.generateVerificationCode(email); // Generate code for email
            try {
                // Send verification code via email
                EmailUtility.sendVerificationCode(email, verificationCode);
                request.getSession().setAttribute("resetEmail", email); // Save email in session
                response.sendRedirect("VerifyCode.jsp");
            } catch (MessagingException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to send email. Please try again.");
                request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "No such user exists.");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        }
    }
}
