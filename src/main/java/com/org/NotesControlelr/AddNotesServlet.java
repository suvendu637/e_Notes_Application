package com.org.NotesControlelr;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.Notes;
import com.org.dto.User;

@WebServlet("/addnotes")
public class AddNotesServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetch details from form
		String title = req.getParameter("title");
		String description=req.getParameter("description");
		//create notes add set details
		Notes note=new Notes();
		note.setTitle(title);
		note.setDescription(description);
		
		//get User object   as we use session from there we get our user
		HttpSession session= req.getSession();
		User user = (User) session.getAttribute("userObj");
		
		//add notes to list
		List<Notes> list=new ArrayList<Notes>();
		list.add(note);
		
		//set  user has many notes
		user.setNotes(list);
		
		//setNotes as one user
		note.setUser(user);
		
		UserDao dao=new UserDao();
		dao.SaveUser(user);
		
		
		session.setAttribute("Success", "Notes Added successfully");
		
		resp.sendRedirect("UserHome.jsp");
		
		
		//here we need to save notes,as we are using cascading when we save user ,notes automatically saved
		
	}

}
