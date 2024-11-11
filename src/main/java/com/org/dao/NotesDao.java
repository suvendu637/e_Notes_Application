package com.org.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.org.dto.Notes;
import com.org.utilities.Helper;


public class NotesDao {
	 public Notes getNoteById(int noteId) {
	        EntityManagerFactory emf = Helper.getEMF();
	        EntityManager em = emf.createEntityManager();
	        Notes note = em.find(Notes.class, noteId); // Find the note by ID
	        return note; // Return the found note or null if not found
	    }
	 
	 public void updateNote(Notes note) {
		    EntityManagerFactory emf = Helper.getEMF();
		    EntityManager em = emf.createEntityManager();
		    EntityTransaction et = em.getTransaction();
		    
		 
		        et.begin();
		        em.merge(note); // Update the note
		        et.commit();
		}
	 public void deleteNotesById(int id) {
		 EntityManagerFactory emf = Helper.getEMF();
		    EntityManager em = emf.createEntityManager();
		    EntityTransaction et = em.getTransaction();
		    
		    Notes note=em.find(Notes.class, id);
		    
		    et.begin();
		    em.remove(note);
		    et.commit();
	 }
	 public int getNotesCountByUserId(int userId) {
	        EntityManagerFactory emf = Helper.getEMF();
	        EntityManager em = emf.createEntityManager();
	        int count = 0;

	        try {
	            Query query = em.createQuery("SELECT COUNT(n) FROM Notes n WHERE n.user.id = :userId");
	            query.setParameter("userId", userId);
	            count = ((Long) query.getSingleResult()).intValue();
	        } finally {
	            em.close();
	        }

	        return count;
	    }


}
