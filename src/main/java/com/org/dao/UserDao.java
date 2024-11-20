package com.org.dao;

import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
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
	public void updatePasswordByEmail(String email, String newPassword) {
	    EntityManager em = Helper.getEMF().createEntityManager();
	    EntityTransaction et = em.getTransaction();
	    
	    try {
	        et.begin();
	        User user = em.createQuery("SELECT u FROM User u WHERE u.email = ?1", User.class)
	                      .setParameter(1, email)
	                      .getSingleResult();
	        user.setPassword(newPassword);
	        em.merge(user);
	        et.commit();
	    } finally {
	        em.close();
	    }
	}
	public boolean emailExists(String email) {
        EntityManager em = Helper.getEMF().createEntityManager();
        try {
            User user = em.createQuery("SELECT u FROM User u WHERE u.email = ?1", User.class)
                          .setParameter(1, email)
                          .getSingleResult();
            return user != null;
        } catch (NoResultException e) {
            return false;
        } finally {
            em.close();
        }
    }
	
	 public String generateVerificationCode(String email) {
	        String code = String.format("%06d", new Random().nextInt(999999));
	        EntityManager em = Helper.getEMF().createEntityManager();
	        em.getTransaction().begin();
	        em.createQuery("UPDATE User u SET u.verificationCode = ?1 WHERE u.email = ?2")
	          .setParameter(1, code)
	          .setParameter(2, email)
	          .executeUpdate();
	        em.getTransaction().commit();
	        em.close();
	        return code;
	    }
	 
	 public boolean verifyCode(String email, String code) {
	        EntityManager em = Helper.getEMF().createEntityManager();
	        try {
	            User user = em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.verificationCode = :code", User.class)
	                          .setParameter("email", email)
	                          .setParameter("code", code)
	                          .getSingleResult();
	            return user != null;
	        } catch (NoResultException e) {
	            return false;
	        } finally {
	            em.close();
	        }
	    }

	 
	 public void updatePassword(String email, String password) {
	        EntityManager em =Helper.getEMF().createEntityManager();
	        em.getTransaction().begin();
	        em.createQuery("UPDATE User u SET u.password = :password WHERE u.email = :email")
	          .setParameter("password", password)
	          .setParameter("email", email)
	          .executeUpdate();
	        em.getTransaction().commit();
	        em.close();
	    }
}
