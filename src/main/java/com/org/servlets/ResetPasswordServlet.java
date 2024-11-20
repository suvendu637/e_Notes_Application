// ResetPasswordServlet.java
package com.org.servlets;

import com.org.dao.UserDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String email = (String) request.getSession().getAttribute("resetEmail");

        UserDao userDao = new UserDao();
        userDao.updatePassword(email, password);
        response.sendRedirect("Login.jsp");
    }
}
