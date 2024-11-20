package com.org.dto;

import java.util.List;

import javax.annotation.processing.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String name;
	
	@Column(nullable = false)
	private int age;
	
	@Column(unique=true,nullable = false)
	private long mobile;
	
	@Column(unique=true,nullable = false)
	private String email;
	private String password;
	
	  @Column(name = "verification_code") // Name this if the column name should be different in the database
	    private String verificationCode;
	
	@OneToMany(mappedBy="user",cascade = CascadeType.ALL)
	private List<Notes> notes;

	public User(String name, int age, long mobile, String email, String password) {
		super();
		this.name = name;
		this.age = age;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
	}

	public User() {
		super();
	}
	
	
	

}
