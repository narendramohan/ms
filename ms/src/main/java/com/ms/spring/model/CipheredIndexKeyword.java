package com.ms.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="CipheredIndexKeyword")
public class CipheredIndexKeyword {
	@Id
	@Column(name="slno")
	String slno;

	@Column(name="bookname",length=1000)
	String bookName;
	
	@Column(name="author",length=1000)
	String author;
	
	@Column(name="publisher",length=1000)
	String publisher;
	
	@Column(name="year",length=1000)
	String year;

	public String getSlno() {
		return slno;
	}

	public void setSlno(String slno) {
		this.slno = slno;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	
}
