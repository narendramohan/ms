package com.ms.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.spring.model.UserAccess;

public interface UserAccessRepository extends JpaRepository<UserAccess, Integer>{
	

}
