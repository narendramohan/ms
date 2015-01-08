package com.ms.spring.dao.impl;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.lang.StringEscapeUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ms.spring.dao.SearchDao;
import com.ms.spring.model.Keyword;
import com.ms.spring.model.User;
import com.ms.util.lucene.LuceneSearch;
@Repository(value="searchDao")
@Transactional
public class SearchDaoImpl implements SearchDao{
	@PersistenceContext
	private EntityManager entityManager;
	String queryStr = "Select c from CipheredKeyword c";
	//String qOnBookName = "c.bookName "
	@Override
	public String searchBook(String searchOn, String searchText) {
		List<String> list = new ArrayList<String>();
		Session session = entityManager.unwrap(Session.class);
		String result = LuceneSearch.doSearch(searchOn, searchText);
		searchText = searchText.toLowerCase();
		Criteria query = session.createCriteria(Keyword.class);
		if(LuceneSearch.AUTHOR.equalsIgnoreCase(searchOn)){
			query.add(Restrictions.ilike("author", searchText, MatchMode.ANYWHERE));
			for(Keyword key : (List<Keyword>)query.list()){
				list.add("'"+StringEscapeUtils.escapeJavaScript(key.getAuthor())+"'");
			}
		} else if(LuceneSearch.PUBLISHER.equalsIgnoreCase(searchOn)){
			query.add(Restrictions.ilike("publisher", searchText, MatchMode.ANYWHERE));
			for(Keyword key : (List<Keyword>)query.list()){
				list.add("'"+StringEscapeUtils.escapeJavaScript(key.getPublisher())+"'");
			}
		} else if(LuceneSearch.TITLE.equalsIgnoreCase(searchOn)){
			query.add(Restrictions.ilike("bookname", searchText, MatchMode.ANYWHERE));
			for(Keyword key : (List<Keyword>)query.list()){
				list.add("'"+StringEscapeUtils.escapeJavaScript(key.getBookName())+"'");
			}
		} else if(LuceneSearch.YEAR.equalsIgnoreCase(searchOn)){
			query.add(Restrictions.ilike("year", searchText, MatchMode.ANYWHERE));
			for(Keyword key : (List<Keyword>)query.list()){
				list.add("'"+StringEscapeUtils.escapeJavaScript(key.getYear())+"'");
			}
		}
		
		System.out.println(list);
		System.out.println(result);
		return result.equals("[]")?list.toString():result;
	}

}
