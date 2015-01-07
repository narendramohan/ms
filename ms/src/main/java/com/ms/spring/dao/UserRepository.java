package com.ms.spring.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.spring.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	/**
     * Find persons like first name.
     */
    public List<User> findByuserNameLike(String userName);

}
