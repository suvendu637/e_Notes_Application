package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.org.dto.Notes;
import com.org.dto.User;
import com.org.utilities.Helper;


public class UserDao {

	public void SaveUser(User user) {
		
		EntityManagerFactory emf =Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.merge(user);
		et.commit();
	}
	
	public User LoginUser(String email,String password) {
		EntityManagerFactory emf =Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Query query = em.createQuery("select u from User u where u.email=?1 and u.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<User> list = query.getResultList();
		
	
		if (!list.isEmpty()) {
			return list.get(0);
		}
		return null;
		
	}
	public void deleteUserByID(int id) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		User user = em.find(User.class, id);
		et.begin();;
		em.remove(user);
		et.commit();
	}
	public User fetchUserByID(int id) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		User user = em.find(User.class, id);
		return user;

	}
	public List<Notes> getNotesByUserId(int userId) {
	    EntityManagerFactory emf = Helper.getEMF();
	    EntityManager em = emf.createEntityManager();
	
	        Query query = em.createQuery("SELECT n FROM Notes n WHERE n.user.id = ?1");
	        query.setParameter(1, userId);
	        List<Notes> notesList = query.getResultList();
	    
	    return notesList;
	}
}
