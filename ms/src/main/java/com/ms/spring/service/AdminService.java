package com.ms.spring.service;

import java.util.List;

import com.ms.spring.model.CipheredIndexKeyword;
import com.ms.spring.model.CipheredKeyword;
import com.ms.spring.model.Keyword;

public interface AdminService {
	
	List<Keyword> loadKeywords();
	void uploadKeywords(List<Keyword> list);
	void uploadCipherKeywords(List<CipheredKeyword> list);
	void uploadCipherindexKeywords(List<CipheredIndexKeyword> cList);
}
