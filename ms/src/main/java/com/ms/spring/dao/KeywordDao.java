package com.ms.spring.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.spring.model.CipheredKeyword;
import com.ms.spring.model.Keyword;

public interface KeywordDao{
	List<Keyword> loadKeywords();
	void uploadKeywords(List<Keyword> list);
	void uploadCipherKeywords(List<CipheredKeyword> list);
}
