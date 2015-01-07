package com.ms.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "useraccess")
public class UserAccess implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1;

	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private long id;
	
	@Column(name = "userName",length=100)
	private String userName;
	
	@Column(name = "access",length=100)
	private String access;


	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	

}
