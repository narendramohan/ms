package com.ms.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.spring.dao.KeywordDao;
import com.ms.spring.model.CipheredKeyword;
import com.ms.spring.model.Keyword;
import com.ms.spring.service.AdminService;

@Service(value="adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	KeywordDao keywordDao;
	
	@Override
	public List<Keyword> loadKeywords() {
		return keywordDao.loadKeywords();
	}

	@Override
	public void uploadKeywords(List<Keyword> list) {
		keywordDao.uploadKeywords(list);
		
	}

	@Override
	public void uploadCipherKeywords(List<CipheredKeyword> list) {
		keywordDao.uploadCipherKeywords(list);
		
	}

	

}
