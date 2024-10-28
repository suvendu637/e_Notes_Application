package com.org.NotesControlelr;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.NotesDao;

@WebServlet("/deleteNoteServlet")
public class DeleteNotesServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int noteId=Integer.parseInt(req.getParameter("noteId"));
		NotesDao dao=new NotesDao();
		dao.deleteNotesById(noteId);
		
		 HttpSession session = req.getSession();
	        session.setAttribute("Success", "Note deleted successfully!");
	        
		 resp.sendRedirect("UserHome.jsp");
	}

}
