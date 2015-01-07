package com.ms.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="CipherKey")
public class CipherKey {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@Column(name = "userName",length=100)
	private String userName;
	
	@Column(name="cipherKey",length=100)
	private String cipherKey;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCipherKey() {
		return cipherKey;
	}

	public void setCipherKey(String cipherKey) {
		this.cipherKey = cipherKey;
	}
	
	

}
