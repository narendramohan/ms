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

import com.ms.util.lucene.LuceneSearch;
import com.ms.spring.model.Keyword;
import com.ms.spring.model.LoginForm;
import com.ms.spring.service.AdminService;
import com.ms.spring.vo.TreeView;

@Controller
public class BinaryVectorController {
	@Autowired
	AdminService adminService;


	@RequestMapping(value = "/bitvector", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String bitvector(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			populateJSONTreeListForTitle(session, tList, list);
		} catch (Exception e) {
			System.out.println("there was an error"+e.getMessage());
			e.printStackTrace();
			
			
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	private void populateJSONTreeListForTitle(HttpSession session,
			List<TreeView> tList, List<Keyword> list) {
		List<String> alt = new ArrayList<String>();
		List<String> ala = new ArrayList<String>();
		List<String> alp = new ArrayList<String>();
		List<String> aly = new ArrayList<String>();
		List<Keyword> blist = new ArrayList<Keyword>();
		Keyword k = null;
		for (Keyword key : list) {
			String str = key.getBookName();
			StringBuilder binary = getBinary(str);
			alt.add(binary.toString());
			populateBitTreeList(tList, str);
			//System.out.println(tList);
			//Author
			str = key.getAuthor();
			StringBuilder binary1 = getBinary(str);
			ala.add(binary1.toString());
			
			str = key.getPublisher();
			StringBuilder binary2 = getBinary(str);
			alp.add(binary2.toString());
			
			
			str = key.getYear();
			StringBuilder binaryy = getBinary(str);
			aly.add(binaryy.toString());
			k = new Keyword();
			k.setAuthor(binary1.toString());
			k.setBookName(binary.toString());
			k.setPublisher(binary2.toString());
			k.setYear(binaryy.toString());
			k.setSlno(key.getSlno());
			blist.add(k);
			
		}
		LuceneSearch.analyzeAndIndexJob(list);
		session.setAttribute("alt", alt);
		session.setAttribute("alp", alp);
		session.setAttribute("ala", ala);
		session.setAttribute("aly", aly);
		session.setAttribute("binlist", blist);
	}

	private void populateBitTreeList(List<TreeView> tList, String str) {
		TreeView tree;
		TreeView child;
		tree = new TreeView();
		child = new TreeView();
		child.setText(StringEscapeUtils.escapeJavaScript(str.getBytes().toString()));
		tree.setText(StringEscapeUtils.escapeJavaScript(str));
		if (tList.size() == 0) {
			tree.setClasses("important");
			tree.setExpanded(true);

		}
		List<TreeView> child1 = new ArrayList<TreeView>();
		child1.add(child);
		tree.setChildren(child1);
		tList.add(tree);
		
	}

	private StringBuilder getBinary(String str) {
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
		return binary;
	}

	@RequestMapping(value = "/binaryvector1", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String binaryvector(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		
		List<String> alt = (List<String>) session.getAttribute("alt");
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			
			for (Keyword key : list) {
				String str = key.getBookName();
				StringBuilder binary = getBinary(str);

				populateBinTreeList(tList, str, binary);
				//alt.add(binary.toString());				
				
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	private void populateBinTreeList(List<TreeView> tList, String str,
			StringBuilder binary) {
		TreeView tree;
		TreeView child;
		tree = new TreeView();
		child = new TreeView();
		child.setText(StringEscapeUtils.escapeJavaScript(new String(
				binary)));
		tree.setText(StringEscapeUtils.escapeJavaScript(str));
		if (tList.size() == 0) {
			tree.setClasses("important");
			tree.setExpanded(true);

		}
		List<TreeView> child1 = new ArrayList<TreeView>();
		child1.add(child);
		tree.setChildren(child1);
		tList.add(tree);
	}

	@RequestMapping(value = "/bitvector1", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String bitvector1(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			
			for (Keyword key : list) {
				String str = key.getAuthor();
				StringBuilder binary = getBinary(str);

				populateBitTreeList(tList, str);

				
				
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	@RequestMapping(value = "/binaryvector2", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String binaryvector1(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			List<String> ala = (List<String>) session.getAttribute("ala");
			if(ala==null || ala.size()==0) {
				populateJSONTreeListForTitle(session, tList, list );
			}
			tList = new ArrayList<>();
			for (Keyword key : list) {
				String str = key.getAuthor();
				StringBuilder binary = getBinary(str);

				populateBinTreeList(tList, str, binary);									
				
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	@RequestMapping(value = "/bitvectorp", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String bitvectorp(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			

			for (Keyword key : list) {
				String str = key.getPublisher();
				StringBuilder binary = getBinary(str);

				populateBitTreeList(tList, str);

				
				
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	@RequestMapping(value = "/binaryvectorp", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String binaryvectorp(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			List<String> alp = (List<String>) session.getAttribute("alp");
			if(alp==null || alp.size()==0) {
				populateJSONTreeListForTitle(session, tList, list );
			}
			tList = new ArrayList<>();

			for (Keyword key : list) {
				String str = key.getPublisher();
				StringBuilder binary = getBinary(str);

				populateBinTreeList(tList, str, binary);
				alp.add(binary.toString());
				
				
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	@RequestMapping(value = "/bitvectory", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String bitvectory(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			
			for (Keyword key : list) {
				String str = key.getYear();
				StringBuilder binary = getBinary(str);

				populateBitTreeList(tList, str);

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	@RequestMapping(value = "/binaryvectory", method = { RequestMethod.GET,
			RequestMethod.POST })
	public @ResponseBody String binaryvectory(HttpSession session,
			@ModelAttribute("loginForm") LoginForm loginForm) {
		List<TreeView> tList = new ArrayList<>();
		try {
			List<Keyword> list = adminService.loadKeywords();
			List<String> aly = (List<String>) session.getAttribute("aly");
			if(aly==null || aly.size()==0) {
				populateJSONTreeListForTitle(session, tList, list );
			}
			tList = new ArrayList<>();
			for (Keyword key : list) {
				String str = key.getYear();
				StringBuilder binary = getBinary(str);

				populateBinTreeList(tList, str, binary);
				aly.add(binary.toString());
				
				
			}

		} catch (Exception e) {
			System.out.println("there was some error"+e.getMessage());
			e.printStackTrace();
		}
		String json = tList.toString();
		System.out.println(json);
		//System.out.println(jsonstr);
		// return json;
		return json;
	}

	String jsonstr = "["
			+ "{"
			+ "\"text\": \" Pre Lunch (120 min)\","
			+ "\"expanded\": true,"
			+ "\"classes\": \"important\","
			+ "\"children\":"
			+ "["
			+ "	{"
			+ "		\"text\": \" The State of the Powerdome (30 min)\""
			+ "	},"
			+ "	{"
			+ "	\"text\": \" The Future of jQuery (30 min)\""
			+ "},"
			+ "{"
			+ "	\"text\": \" jQuery UI - A step to richnessy (60 min)\""
			+ "}"
			+ "]"
			+ "},"
			+ "{"
			+ "	\"text\": \"2. Lunch  (60 min)\""
			+ "},"
			+ "{"
			+ "	\"text\": \"3. After Lunch  (120+ min)\","
			+ "	\"children\":"
			+ "	["
			+ "		{"
			+ "			\"text\": \" jQuery Calendar Success Story (20 min)\""
			+ "		},"
			+ "	 	{"
			+ "			\"text\": \" jQuery and Ruby Web Frameworks (20 min)\""
			+ "		},"
			+ "	 	{"
			+ "			\"text\": \" Hey, I Can Do That! (20 min)\""
			+ "		},"
			+ "	 	{"
			+ "			\"text\": \" Taconite and Form (20 min)\""
			+ "		},"
			+ "	 	{"
			+ "			\"text\": \" Server-side JavaScript with jQuery and AOLserver (20 min)\""
			+ "		},"
			+ "	 	{"
			+ "			\"text\": \" The Onion: How to add features without adding features (20 min)\","
			+ "			\"id\": \"36\","
			+ "			\"hasChildren\": true"
			+ "		},"
			+ "	 	{"
			+ "			\"text\": \" Visualizations with JavaScript and Canvas (20 min)\""
			+ "		}," + "	 	{" + "			\"text\": \" ActiveDOM (20 min)\"" + "		},"
			+ "	 	{" + "			\"text\": \" Growing jQuery (20 min)\"" + "		}"
			+ "	]" + "}" + "]";
}
