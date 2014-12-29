package com.ms.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ms.spring.model.Keyword;
import com.ms.spring.model.LoginForm;
import com.ms.spring.service.AdminService;
import com.ms.spring.vo.TreeView;

@Controller
public class BinaryVectorController {
	@Autowired
	AdminService adminService;
    public static ArrayList<String> alt = new ArrayList<String>();
    public static ArrayList<String> ala = new ArrayList<String>();
    public static ArrayList<String> alp = new ArrayList<String>();
    public static ArrayList<String> aly = new ArrayList<String>();   
    
	@RequestMapping(value="/bitvector", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String bitvector(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getBookName();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
		                for (byte b : bytes) {
		                    int val = b;
		                    for (int i = 0; i < 8; i++) {
		                        binary.append((val & 128) == 0 ? 0 : 1);
		                        val <<= 1;
		                    }
		                    binary.append(' ');
		                }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}
	@RequestMapping(value="/binaryvector1", method={RequestMethod.GET, RequestMethod.POST})
	public  @ResponseBody String binaryvector(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getBookName();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
	                    for (byte b : bytes) {
	                        int val = b;
	                        for (int i = 0; i < 8; i++) {
	                            binary.append((val & 128) == 0 ? 0 : 1);
	                            val <<= 1;
	                        }
	                        binary.append(' ');
	                    }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                alt.add(binary.toString());
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}
	@RequestMapping(value="/bitvector1", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String bitvector1(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getAuthor();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
		                for (byte b : bytes) {
		                    int val = b;
		                    for (int i = 0; i < 8; i++) {
		                        binary.append((val & 128) == 0 ? 0 : 1);
		                        val <<= 1;
		                    }
		                    binary.append(' ');
		                }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}
	@RequestMapping(value="/binaryvector2", method={RequestMethod.GET, RequestMethod.POST})
	public  @ResponseBody String binaryvector1(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getAuthor();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
	                    for (byte b : bytes) {
	                        int val = b;
	                        for (int i = 0; i < 8; i++) {
	                            binary.append((val & 128) == 0 ? 0 : 1);
	                            val <<= 1;
	                        }
	                        binary.append(' ');
	                    }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                ala.add(binary.toString());
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}
	
	@RequestMapping(value="/bitvectorp", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String bitvectorp(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getPublisher();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
		                for (byte b : bytes) {
		                    int val = b;
		                    for (int i = 0; i < 8; i++) {
		                        binary.append((val & 128) == 0 ? 0 : 1);
		                        val <<= 1;
		                    }
		                    binary.append(' ');
		                }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}
	@RequestMapping(value="/binaryvectorp", method={RequestMethod.GET, RequestMethod.POST})
	public  @ResponseBody String binaryvectorp(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getPublisher();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
	                    for (byte b : bytes) {
	                        int val = b;
	                        for (int i = 0; i < 8; i++) {
	                            binary.append((val & 128) == 0 ? 0 : 1);
	                            val <<= 1;
	                        }
	                        binary.append(' ');
	                    }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                alp.add(binary.toString());
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}
	@RequestMapping(value="/bitvectory", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody String bitvectory(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getYear();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
		                for (byte b : bytes) {
		                    int val = b;
		                    for (int i = 0; i < 8; i++) {
		                        binary.append((val & 128) == 0 ? 0 : 1);
		                        val <<= 1;
		                    }
		                    binary.append(' ');
		                }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}
	@RequestMapping(value="/binaryvectory", method={RequestMethod.GET, RequestMethod.POST})
	public  @ResponseBody String binaryvectory(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		List<TreeView> tList = new ArrayList<>();
		 try {
			 	List<Keyword> list = adminService.loadKeywords();
			 	int ith=0;
			 	TreeView tree;
			 	TreeView child;
			 	for(Keyword key:list){
			 		 String str = key.getYear();
		                byte[] bytes = str.getBytes();
		                StringBuilder binary = new StringBuilder();
	                    for (byte b : bytes) {
	                        int val = b;
	                        for (int i = 0; i < 8; i++) {
	                            binary.append((val & 128) == 0 ? 0 : 1);
	                            val <<= 1;
	                        }
	                        binary.append(' ');
	                    }
		                
		                tree = new TreeView();
		                child = new TreeView();
		                child.setText(StringEscapeUtils.escapeJavaScript(new String(binary)));
		                tree.setText(StringEscapeUtils.escapeJavaScript(str));
		                if(tList.size()==0){
		                	tree.setClasses("important");
		                	tree.setExpanded(true);
		                	
		                }
		                List<TreeView> child1 = new ArrayList<TreeView>(); child1.add(child);
		                tree.setChildren(child1);
		                tList.add(tree);
		                aly.add(binary.toString());
		                //if(ith==100)break;
		                ith++;
			 	}
	           
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	        }
		 String json = tList.toString();
		 System.out.println(json); 
		 System.out.println(jsonstr); 
		//return json;
		return json;
	}	
	String jsonstr = "["+
			"{"+
			"\"text\": \" Pre Lunch (120 min)\","+
			"\"expanded\": true,"+
			"\"classes\": \"important\","+
			"\"children\":"+
			"["+
			"	{"+
			"		\"text\": \" The State of the Powerdome (30 min)\""+
			"	},"+
			 "	{"+
				"	\"text\": \" The Future of jQuery (30 min)\""+
				"},"+
			 	"{"+
				"	\"text\": \" jQuery UI - A step to richnessy (60 min)\""+
				"}"+
			"]"+
		"},"+
		"{"+
		"	\"text\": \"2. Lunch  (60 min)\""+
		"},"+
		"{"+
		"	\"text\": \"3. After Lunch  (120+ min)\","+
		"	\"children\":"+
		"	["+
		"		{"+
		"			\"text\": \" jQuery Calendar Success Story (20 min)\""+
		"		},"+
		"	 	{"+
		"			\"text\": \" jQuery and Ruby Web Frameworks (20 min)\""+
		"		},"+
		"	 	{"+
		"			\"text\": \" Hey, I Can Do That! (20 min)\""+
		"		},"+
		"	 	{"+
		"			\"text\": \" Taconite and Form (20 min)\""+
		"		},"+
		"	 	{"+
		"			\"text\": \" Server-side JavaScript with jQuery and AOLserver (20 min)\""+
		"		},"+
		"	 	{"+
		"			\"text\": \" The Onion: How to add features without adding features (20 min)\","+
		"			\"id\": \"36\","+
		"			\"hasChildren\": true"+
		"		},"+
		"	 	{"+
		"			\"text\": \" Visualizations with JavaScript and Canvas (20 min)\""+
		"		},"+
		"	 	{"+
		"			\"text\": \" ActiveDOM (20 min)\""+
		"		},"+
		"	 	{"+
		"			\"text\": \" Growing jQuery (20 min)\""+
		"		}"+
		"	]"+
		"}"+
	"]";
}
