package com.ms.spring.repository;

import java.util.Collection;

import org.springframework.stereotype.Repository;

import com.ms.spring.model.Person;
@Repository(value="personRepository")
public class PersonRepository {

	public Person findOne(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Person saveAndFlush(Person person) {
		// TODO Auto-generated method stub
		return null;
	}

	public void delete(Person person) {
		// TODO Auto-generated method stub
		
	}

	public Collection<Person> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
