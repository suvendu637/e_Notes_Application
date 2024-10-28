package com.org.Usercontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	
	UserDao dao=new UserDao();
	User user = dao.LoginUser(email, password);
	
	HttpSession ses=req.getSession();
	if(user != null)
	{
		ses.setAttribute("userObj", user);
		resp.sendRedirect("UserHome.jsp");
	}
	else {
		ses.setAttribute("failed", "msg");
		resp.sendRedirect("Login.jsp");
	}
}
}
