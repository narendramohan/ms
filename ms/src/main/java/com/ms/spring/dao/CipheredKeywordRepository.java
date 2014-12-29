package com.ms.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.spring.model.Keyword;

public interface CipheredKeywordRepository  extends JpaRepository<Keyword, Integer> {

}
