package com.ms.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.spring.model.CipheredIndexKeyword;


public interface CipheredIndexKeywordRepository  extends JpaRepository<CipheredIndexKeyword, Integer> {

}
