package com.ms.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.FloatField;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

public class MSUtils {
	private String indexDir;
	private IndexWriter writer;
	private Object luceneUtil;
	private IndexSearcher indexSearcher;

	public void createIndex() throws Exception {

	    boolean create = true;
	    File indexDirFile = new File(this.indexDir);
	    if (indexDirFile.exists() && indexDirFile.isDirectory()) {
	       create = false;
	    }

	    Directory dir = FSDirectory.open(indexDirFile);
	    Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_43);
	    IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_43, analyzer);

	    if (create) {
	       // Create a new index in the directory, removing any
	       // previously indexed documents:
	       iwc.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
	    }

	    IndexWriter writer = new IndexWriter(dir, iwc);
	    writer.commit();
	    writer.close(true);
	 }
	public void createIndexWriter() throws Exception {

	     boolean create = true;
	     File indexDirFile = new File(this.indexDir);

	     Directory dir = FSDirectory.open(indexDirFile);
	     Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_43);
	     IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_43, analyzer);
	     iwc.setOpenMode(IndexWriterConfig.OpenMode.CREATE_OR_APPEND);
	     this.writer = new IndexWriter(dir, iwc);

	    }
	public void addBookToIndex(BookVO bookVO) throws Exception {
	     Document document = new Document();
	     document.add(new StringField("title", bookVO.getBook_name(), Field.Store.YES));
	     document.add(new StringField("author", bookVO.getBook_author(), Field.Store.YES));
	     document.add(new StringField("category", bookVO.getCategory(), Field.Store.YES));
	     document.add(new IntField("numpage", bookVO.getNumpages(), Field.Store.YES));
	     document.add(new FloatField("price", bookVO.getPrice(), Field.Store.YES));
	     IndexWriter writer =  getIndexWriter();
	     writer.addDocument(document);
	     writer.commit();
	 }
	private IndexWriter getIndexWriter() {
		// TODO Auto-generated method stub
		return null;
	}
	public void createIndexSearcher(){
	    IndexReader indexReader = null;
	    IndexSearcher indexSearcher = null;
	    try{
	         File indexDirFile = new File(this.indexDir);
	         Directory dir = FSDirectory.open(indexDirFile);
	         indexReader  = DirectoryReader.open(dir);
	         indexSearcher = new IndexSearcher(indexReader);
	    }catch(IOException ioe){
	        ioe.printStackTrace();
	    }

	    this.indexSearcher = indexSearcher;
	 }
	
	public List<BookVO> getBooksByField(String value, String field, IndexSearcher indexSearcher){
	     List<BookVO> bookList = new ArrayList<BookVO>();
	     Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_43);
	     QueryParser parser = new QueryParser(Version.LUCENE_43, field, analyzer);

	     try {
	         BooleanQuery query = new BooleanQuery();
	         query.add(new TermQuery(new Term(field, value)), BooleanClause.Occur.MUST);

	        //Query query = parser.Query(value);
	        int numResults = 100;
	        ScoreDoc[] hits =   indexSearcher.search(query,numResults).scoreDocs;
	        for (int i = 0; i < hits.length; i++) {
	             Document doc = indexSearcher.doc(hits[i].doc);
	             bookList.add(getBookVO(doc));
	        }

	     } catch (IOException e) {
	         e.printStackTrace(); 
	     }

	     return bookList;
	}
	private BookVO getBookVO(Document doc) {
		// TODO Auto-generated method stub
		return null;
	}
}
