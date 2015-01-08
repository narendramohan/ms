package com.ms.util.lucene;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.FilterDirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.google.gson.Gson;
import com.ms.spring.model.Keyword;


public class LuceneSearch {
	public static final String YEAR = "year";
	public static final String PUBLISHER = "publisher";
	public static final String AUTHOR = "author";
	public static final String TITLE = "title";

	public void initializeDirectory() {
		if(indexDir==null){
			Properties prop = getConfigProperties(getClass()
					.getClassLoader().getResource("/").getPath());
			String path = prop.getProperty("indexpath");
			String noofthread = prop.getProperty("noofthread");
			
			logger.debug(path + " "+noofthread);
			
			// System.out.println(Util.getConfigProperties(getClass().getClassLoader().getResource("/").getPath()));
			try {
				indexDir = FSDirectory.open(new File(path));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private static final Logger logger = LoggerFactory
			.getLogger(LuceneSearch.class);
	static IndexWriter iwriter = null;
	static List<Keyword> list = null;

	public static void analyzeAndIndexJob(List<Keyword> search) {
		logger.debug("Indexing started");
		try {
			
			//if(iwriter==null)
			
			addDocument(search);
			

		} catch (CorruptIndexException e1) {
			logger.error("Exception: Corrupted Index",e1);
		} catch (IOException e) {
			logger.error("Exception: Io ",e);
		}
	}

	/**
	 * Create Index using the job search
	 * @param search
	 * @throws IOException
	 */
	private static void addDocument(List<Keyword> search) throws IOException {
		/*
		 <p>&nbsp;Author Name: <input type="radio" id="searchon" name="searchon" value="author" checked="checked">&nbsp;
									&nbsp;Book Name: <input type="radio" id="searchon" name="searchon" value="title">
									&nbsp;Publisher: <input type="radio" id="searchon" name="searchon" value="publisher">
									&nbsp;Published Year: <input type="radio" id="searchon" name="searchon" value="year"></p>
		 */
		System.out.println("adding indexes");
		IndexWriter iwriter = getIndexWriter();
		for (Keyword srch : search) {
			
			Document doc = new Document();
			Field pathField = new StringField(TITLE, srch.getBookName()==null?"":srch.getBookName(), Field.Store.YES);
			doc.add(pathField);
			pathField = new StringField(AUTHOR, srch.getAuthor()==null?"":srch.getAuthor(), Field.Store.YES);
			doc.add(pathField);
			pathField = new StringField(PUBLISHER, srch.getPublisher()==null?"":srch.getPublisher(), Field.Store.YES);
			doc.add(pathField);
			pathField = new StringField(YEAR, srch.getYear()==null?"":srch.getYear(), Field.Store.YES);
			doc.add(pathField);

			iwriter.addDocument(doc);
		}
		iwriter.close();
	}



	public static IndexWriter getIndexWriter() throws IOException {
		if(indexDir==null)
			new LuceneSearch().initializeDirectory();
		IndexWriterConfig luceneConfig = new IndexWriterConfig(
				Version.LATEST, new StandardAnalyzer());

		return (new IndexWriter(indexDir, luceneConfig));
	}

	public static String doSearch(Keyword search) {
		List<Keyword> jobList = new ArrayList<Keyword>();
		IndexSearcher isearcher = null;
			// System.out.println(userName);
			try {
				// Now search the index:
				isearcher = getIndexSearcher();
				SimpleAnalyzer sa = new SimpleAnalyzer();
				String field ="keyword";
				QueryParser parser = new QueryParser(field, sa);
				Query query = parser.parse(search.getBookName());
				ScoreDoc[] hits = isearcher.search(query, isearcher.getIndexReader().maxDoc()).scoreDocs;
				Keyword job=null;
				for (int i = 0; i < hits.length; i++) {
					Document hitDoc = isearcher.doc(hits[i].doc); // getting actual document
					job=new Keyword();
					//job.setKeyword(hitDoc.get("keyword"));
					boolean bjT=!StringUtils.isEmpty(search.getPublisher());
					boolean bjtt=!StringUtils.isEmpty(search.getAuthor());
					boolean bexp=!StringUtils.isEmpty(search.getYear());
					boolean bmsal=!StringUtils.isEmpty(search.getBookName());
					String exp = search.getYear();
					//if(StringUtil)
					
					System.out.println(hitDoc.get("keyword"));
					if(bjT && !search.getPublisher().equalsIgnoreCase(hitDoc.get("jobType"))){
						continue;
					}
					if(bjtt && !search.getAuthor().equalsIgnoreCase(hitDoc.get("jobTitle"))){
						continue;
					}
					
					if(bexp && ! (Integer.parseInt(search.getYear()) <= Integer.parseInt(hitDoc.get("exp")))){
						continue;
					}
					
					
					int jobType = Integer.parseInt(hitDoc.get("jobType"));
					int jobTitle = Integer.parseInt(hitDoc.get("jobTitle"));
					
					/*job.setExp(hitDoc.get("exp"));
					job.setExpectedSal(hitDoc.get("MinSal")+ " to "+hitDoc.get("MaxSal")+ " in lacs");
					job.setJobTitle(JobTitle.get(jobTitle).title());
					job.setJobType(JobType.get(jobType).type());
					job.setLocation(hitDoc.get("location"));
					jobList.add(job);*/
				}
				
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			} finally {

				if (isearcher != null)
					try {
						isearcher.getIndexReader().close();
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
			String jsonString="";
			if(jobList.size()>0)
				jsonString = new Gson().toJson(jobList);
			else
				jsonString = "[{\"keyword\":\""+search.getBookName()+"\",\"jobTitle\":\" \",\"jobType\":\" \",\"location\":\" \",\"expectedSal\":\" \"}]";
		logger.debug(jsonString);
		return jsonString;
	}

	static IndexSearcher getIndexSearcher() throws IOException {
		if(indexDir==null)
		new LuceneSearch().initializeDirectory();
		return new IndexSearcher(
				FilterDirectoryReader.open(indexDir));
	}

	public static Directory indexDir;
	/**
	 * Load the config.property
	 * @param args
	 * @return
	 */
	public static Properties getConfigProperties(String path) {

		Properties prop = new Properties();
		InputStream input = null;

		try {
			input = new FileInputStream(path+"\\config.properties");

			// load a properties file
			prop.load(input);
		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return prop;
	}
	static IndexSearcher isearcher = null;
	public static String doSearch(String searchOn, String searchText) {
		List<String> jobList = new ArrayList<String>();
		
			try {
				// Now search the index:
				isearcher = getIndexSearcher();
				System.out.println(searchOn+" V "+searchText);
				SortField sortField = new SortField(searchOn,SortField.Type.STRING, true);	
				Sort sortBySender = new Sort(sortField);
				WildcardQuery query = new WildcardQuery(new Term(searchOn,searchText+"*"));
				
				try {
					System.out.println("Sorting results: Search mails having the word 'job' in subject");
					System.out.println("--- Showing results sorted by relevance");
					TopDocs topDocs = isearcher.search(query,20);
					printResults(searchOn,topDocs);
					//Pass the sort criteria to search
					System.out.println("--- Sorting by sender names in descending order");
					topDocs = isearcher.search(query,null,20,sortBySender);
					printResults(searchOn,topDocs);
					System.out.println("--- Sorting by the document index order");
					topDocs = isearcher.search(query,null,20,Sort.INDEXORDER);
					jobList = printResults(searchOn,topDocs);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				SimpleAnalyzer sa = new SimpleAnalyzer();
				QueryParser parser = new QueryParser(searchOn, sa);
				Query query1 = parser.parse(searchText);
				ScoreDoc[] hits = isearcher.search(query1, isearcher.getIndexReader().maxDoc()).scoreDocs;
				Keyword job=null;
				for (int i = 0; i < hits.length; i++) {
					Document hitDoc = isearcher.doc(hits[i].doc); // getting actual document
					System.out.println(hitDoc.get(searchOn));
					
					/*job.setExp(hitDoc.get("exp"));
					job.setExpectedSal(hitDoc.get("MinSal")+ " to "+hitDoc.get("MaxSal")+ " in lacs");
					job.setJobTitle(JobTitle.get(jobTitle).title());
					job.setJobType(JobType.get(jobType).type());
					job.setLocation(hitDoc.get("location"));
					jobList.add(job);*/
				}
					/*job.setExp(hitDoc.get("exp"));
					job.setExpectedSal(hitDoc.get("MinSal")+ " to "+hitDoc.get("MaxSal")+ " in lacs");
					job.setJobTitle(JobTitle.get(jobTitle).title());
					job.setJobType(JobType.get(jobType).type());
					job.setLocation(hitDoc.get("location"));
					jobList.add(job);*/
				
				
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {

				if (isearcher != null)
					try {
						isearcher.getIndexReader().close();
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
		return jobList.toString();
	}
	private static List<String> printResults(String searchOn, TopDocs topDocs)
			throws CorruptIndexException, IOException {
		List<String> list = new ArrayList<String>();
		for(ScoreDoc scoredoc: topDocs.scoreDocs){
			//Retrieve the matched document and show relevant details
			Document doc = isearcher.doc(scoredoc.doc);
			String str = doc.getField(searchOn).stringValue();
			System.out.println("Sender: "+doc.getField(searchOn).stringValue());
			list.add("'"+StringEscapeUtils.escapeJavaScript(str)+"'");
		}
		return list;
	}
}

enum JobTitle {
	   SE(0){

		@Override
		public String title() {
			return "Software Engineer";
		}
		   
	   },HE(1) {
		@Override
		public String title() {
			return "Hardware Engineer";
		}
	};
	   private int value;
	   public abstract String title();
	   JobTitle(int p) {
		   value = p;
	   }
	   int getValue() {
	      return value;
	   } 
	// Lookup table
		private static final Map<Integer, JobTitle> lookup = new HashMap<Integer, JobTitle>();

		// Populate the lookup table on loading time
		static {
			for (JobTitle s : EnumSet.allOf(JobTitle.class))
				lookup.put(s.getValue(), s);
		}

		// This method can be used for reverse lookup purpose
		public static JobTitle get(int angle) {
			return lookup.get(angle);
		}
	}
enum JobType {
	   FT(0){

		@Override
		public String type() {
			return "Full Time";
		}
		   
	   },PT(1) {
		@Override
		public String type() {
			return "Part Time";
		}
	},Contract(2){

		@Override
		public String type() {
			return "Contract";
		}
		   
	   },intern(3) {
		@Override
		public String type() {
			return "Intern Ship";
		}
	};
	   private int value;
	   public abstract String type();
	   JobType(int p) {
		   value = p;
	   }
	   int getValue() {
	      return value;
	   } 
		// Lookup table
		private static final Map<Integer, JobType> lookup = new HashMap<Integer, JobType>();

		// Populate the lookup table on loading time
		static {
			for (JobType s : EnumSet.allOf(JobType.class))
				lookup.put(s.getValue(), s);
		}

		// This method can be used for reverse lookup purpose
		public static JobType get(int angle) {
			return lookup.get(angle);
		}
	}