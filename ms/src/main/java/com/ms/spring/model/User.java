package com.ms.spring.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User implements Serializable {

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 3675562287472175131L;

	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@Column(name = "userName",length=100)
	private String userName;
	
	@Column(name = "password",length=100)
	private String password;
	
	@Column(name = "salt",length=1000)
	private String salt;

	@Column(name = "email",length=1000)
	private String email;

	@Column(name = "mobile",length=100)
	private String mobile;

	@Column(name = "firstName",length=1000)
	private String firstName;

	@Column(name = "lastName",length=1000)
	private String lastName;

	@Column(name = "address",length=1000)
	private String address;
	
	@Column(name = "city",length=1000)
	private String city;

	@Column(name = "state",length=1000)
	private String state;

	@Column(name = "country",length=1000)
	private String country;

	@Column(name = "pin",length=100)
	private String pin;
	
	@Column(name = "type",length=10)
	private int type;
	
	@Column(name = "status",length=10)
	private int status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
