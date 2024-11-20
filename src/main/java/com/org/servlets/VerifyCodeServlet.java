// VerifyCodeServlet.java
package com.org.servlets;

import com.org.dao.UserDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String email = (String) request.getSession().getAttribute("resetEmail");

        UserDao userDao = new UserDao();
        if (userDao.verifyCode(email, code)) {
            response.sendRedirect("ResetPassword.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid verification code.");
            request.getRequestDispatcher("VerifyCode.jsp").forward(request, response);
        }
    }
}
