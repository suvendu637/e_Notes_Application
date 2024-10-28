//package com.org.NotesControlelr;
//
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import com.org.dao.NotesDao;
//import com.org.dto.Notes;
//
//@WebServlet("/updateNote")
//public class UpdateNotesServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // Fetch note ID and updated details from the form
//        int noteId = Integer.parseInt(req.getParameter("noteId"));
//        String title = req.getParameter("title");
//        String description = req.getParameter("description");
//
//       
//        Notes note = new Notes();
//        note.setId(noteId); 
//        note.setTitle(title);
//        note.setDescription(description);
//        
//        
//        NotesDao notesDao = new NotesDao();
//        
//        
//        notesDao.updateNote(note);
//      
//        HttpSession session = req.getSession();
//        session.setAttribute("Success", "Note updated successfully");
//
//        // Redirect to the user home page
//        resp.sendRedirect("UserHome.jsp");
//    }
//}
//


package com.org.NotesControlelr;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.NotesDao; // Make sure to import your NotesDao
import com.org.dto.Notes;
import com.org.dto.User;

@WebServlet("/updateNote")
public class UpdateNotesServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Fetch note details from the form
        int noteId = Integer.parseInt(req.getParameter("noteId")); // Get note ID from hidden field
        String title = req.getParameter("title");
        String description = req.getParameter("description");

        // Get the current user from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("userObj");

        // Fetch the existing note from the database
        NotesDao notesDao = new NotesDao();
        Notes note = notesDao.getNoteById(noteId);

        if (note != null && user != null) {
            // Update the note's details
            note.setTitle(title);
            note.setDescription(description);
            note.setUser(user); // Set the current user to maintain the association

            // Save the updated note back to the database
            notesDao.updateNote(note);

            session.setAttribute("Success", "Note updated successfully!");
        } else {
            session.setAttribute("Error", "Note not found or user is not logged in.");
        }

        // Redirect to the user home page
        resp.sendRedirect("UserHome.jsp");
    }
}
