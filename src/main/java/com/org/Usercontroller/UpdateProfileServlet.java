package com.org.Usercontroller;

import com.org.dao.UserDao;
import com.org.dto.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user details from form
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Get user from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userObj");

        if (user != null) {
            // Update user object with new details
            user.setName(fullName);
            user.setEmail(email);
            user.setPassword(password);

            // Update user in the database
            UserDao userDao = new UserDao();
            userDao.SaveUser(user);

         
                session.setAttribute("userObj", user);
                response.sendRedirect("Profile.jsp"); // Redirect back to the profile page
//          
//                request.setAttribute("error", "Failed to update profile");
//                request.getRequestDispatcher("updateProfile.jsp").forward(request, response); // Show error message
            
        } 
    }
}
