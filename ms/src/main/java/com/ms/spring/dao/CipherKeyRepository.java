package com.ms.spring.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.spring.model.CipherKey;

public interface CipherKeyRepository extends JpaRepository<CipherKey, Integer>{
	
	/**
     * Find persons like first name.
     */
    public List<CipherKey> findByuserNameLike(String userName);

}
