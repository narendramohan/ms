package com.ms.spring.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ms.spring.dao.KeywordDao;
import com.ms.spring.model.CipheredKeyword;
import com.ms.spring.model.Keyword;
import com.ms.spring.model.User;
@Repository(value="keywordDao")
@Transactional
public class KeywordDaoImpl implements KeywordDao {
	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public List<Keyword> loadKeywords() {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(Keyword.class);
		List<Keyword> list = (List<Keyword>) query.list();
		return list;
	}

	@Override
	public void uploadKeywords(List<Keyword> list) {
		for(Keyword keyword:list) {
			entityManager.merge(keyword);
		}

	}
	@Override
	public void uploadCipherKeywords(List<CipheredKeyword> list) {
		for(CipheredKeyword keyword:list) {
			entityManager.merge(keyword);
		}

	}
}
