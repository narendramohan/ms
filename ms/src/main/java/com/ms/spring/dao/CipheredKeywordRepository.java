package com.ms.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.spring.model.CipheredKeyword;

public interface CipheredKeywordRepository  extends JpaRepository<CipheredKeyword, Integer> {

}
