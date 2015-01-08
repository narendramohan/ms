package com.ms.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.spring.dao.SearchDao;
import com.ms.spring.service.SearchService;
@Service(value="searchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchDao searchDao;
	
	@Override
	public String searchBook(String searchOn, String searchText) {
		
		return searchDao.searchBook(searchOn, searchText);
	}

}
