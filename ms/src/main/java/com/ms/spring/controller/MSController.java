package com.ms.spring.controller;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




import org.springframework.web.bind.annotation.ResponseBody;



import com.ms.spring.dao.CipherKeyRepository;
import com.ms.spring.dao.CipheredIndexKeywordRepository;
import com.ms.spring.dao.CipheredKeywordRepository;
import com.ms.spring.dao.KeywordRepository;
import com.ms.spring.dao.UserAccessRepository;
import com.ms.spring.model.CipherKey;
import com.ms.spring.model.CipheredIndexKeyword;
import com.ms.spring.model.CipheredKeyword;
import com.ms.spring.model.Keyword;
import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;
import com.ms.spring.model.UserAccess;
import com.ms.spring.service.AdminService;
import com.ms.spring.service.UserService;
import com.ms.spring.vo.ViewPage;
import com.ms.util.AesEncryption;
import com.ms.util.EncryptionUtil;

@Controller
public class MSController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/nextbinaryvector", method={RequestMethod.GET, RequestMethod.POST})
	public String binaryvector(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1)  return "adminindex1";
		else return "redirect:home";
	}
	@RequestMapping(value="/next2binaryvector", method={RequestMethod.GET, RequestMethod.POST})
	public String binaryvectornext(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){  
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1)  return "adminindex2";
		else return "redirect:home";
	}	
	
	//nextcipher
	//nextindexing
	@RequestMapping(value="/nextcipher", method={RequestMethod.GET, RequestMethod.POST})
	public String nextcipher(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm, HttpServletRequest request){  
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1){
			String key = getKey(userName);
			request.setAttribute("key", key);
			return "datacip";
		} else return "redirect:home";
	}
	
	@Resource CipherKeyRepository cipherKeyRepository;
	@Transactional
	private String getKey(String userName) {
		List<CipherKey> list = cipherKeyRepository.findByuserNameLike(userName);
		String key = list!=null && list.size()>0? list.get(0).getCipherKey():"";
		return key;
	}
	@RequestMapping(value="/nextindexing", method={RequestMethod.GET, RequestMethod.POST})
	public String nextindexing(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm, HttpServletRequest request){  
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else if(user!=null && user.getType()==1){
			String key = getKey(userName);
			request.setAttribute("secretKey", key);
			return "indexcip";
		}
		else return "redirect:home";
	}
	
    public static ArrayList<String> cipdatabn=new ArrayList<>();
    public static ArrayList<String> cipdataan=new ArrayList<>();
    public static ArrayList<String> cipdatapn=new ArrayList<>();
    public static ArrayList<String> cipdatay=new ArrayList<>();
	@RequestMapping(value="/encryptdata")
	@Transactional
	public String encryptdata(HttpServletRequest request, HttpSession session){
		List<Keyword> list = adminService.loadKeywords();
		String datakey = request.getParameter("secretKey");
		String userName = (String) session.getAttribute("userName");
		CipherKey secretKey = new CipherKey();
		secretKey.setCipherKey(datakey);
		secretKey.setUserName(userName);
		cipherKeyRepository.saveAndFlush(secretKey);
		System.out.println(datakey);
		List<CipheredKeyword> cList = new ArrayList<CipheredKeyword>();
		BufferedWriter bw = null;
		CipheredKeyword cKey = new CipheredKeyword();
		ArrayList<String> cipdatabn=new ArrayList<>();
	    ArrayList<String> cipdataan=new ArrayList<>();
	    ArrayList<String> cipdatapn=new ArrayList<>();
	    ArrayList<String> cipdatay=new ArrayList<>();
		try {
			bw=new BufferedWriter(new FileWriter("./data.txt"));
			for (Keyword key: list){
				String s2 = key.getBookName();
                String s3 = key.getAuthor();
                String s4 = key.getPublisher();
                String s5 = key.getYear();
                String s1 = key.getSlno();
                String wordEnc1 = AesEncryption.encrypt(s2,datakey);
                String wordEnc2 = AesEncryption.encrypt(s3,datakey);
                String wordEnc3 = AesEncryption.encrypt(s4,datakey);
                String wordEnc4 = AesEncryption.encrypt(s5,datakey);
                cipdatabn.add(wordEnc1);
                cipdataan.add(wordEnc2);
                cipdatapn.add(wordEnc3);
                cipdatay.add(wordEnc4);
                bw.write(wordEnc1+"\n"+wordEnc2+"\n"+wordEnc3+"\n"+wordEnc4+"\n");
                bw.newLine();
                cKey= new CipheredKeyword();
                cKey.setSlno(s1);
                cKey.setBookName(wordEnc1);
                cKey.setAuthor(wordEnc2);
                cKey.setPublisher(wordEnc3);
                cKey.setYear(wordEnc4);
                
                cList.add(cKey);
                
			}
			adminService.uploadCipherKeywords(cList);
			session.setAttribute("cipdatabn", cipdatabn);
			session.setAttribute("cipdataan", cipdataan);
			session.setAttribute("cipdatapn", cipdatapn);
			session.setAttribute("cipdatay", cipdatay);
		} catch (IOException e) {			
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(bw!=null)
				try {
					bw.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return null;
		
	}
	
	@RequestMapping(value="/encryptindex")
	public String encryptindex(HttpServletRequest request, HttpSession session){
		//List<Keyword> list = adminService.loadKeywords();
		List<Keyword> list = (List<Keyword>) session.getAttribute("binlist");
		String datakey = request.getParameter("secretKey");
		System.out.println(datakey);
		List<CipheredIndexKeyword> cList = new ArrayList<CipheredIndexKeyword>();
		BufferedWriter bw = null;
		CipheredIndexKeyword cKey = new CipheredIndexKeyword();
		ArrayList<String> cipdatabn=new ArrayList<>();
	    ArrayList<String> cipdataan=new ArrayList<>();
	    ArrayList<String> cipdatapn=new ArrayList<>();
	    ArrayList<String> cipdatay=new ArrayList<>();
		try {
			bw=new BufferedWriter(new FileWriter("./index.txt"));
			for (Keyword key: list){
				String s2 = key.getBookName();
                String s3 = key.getAuthor();
                String s4 = key.getPublisher();
                String s5 = key.getYear();
                String s1 = key.getSlno();
                String wordEnc1 = AesEncryption.encrypt(s2,datakey);
                String wordEnc2 = AesEncryption.encrypt(s3,datakey);
                String wordEnc3 = AesEncryption.encrypt(s4,datakey);
                String wordEnc4 = AesEncryption.encrypt(s5,datakey);
                cipdatabn.add(wordEnc1);
                cipdataan.add(wordEnc2);
                cipdatapn.add(wordEnc3);
                cipdatay.add(wordEnc4);
                bw.write(wordEnc1+"\n"+wordEnc2+"\n"+wordEnc3+"\n"+wordEnc4+"\n");
                bw.newLine();
                cKey= new CipheredIndexKeyword();
                cKey.setSlno(s1);
                cKey.setBookName(wordEnc1);
                cKey.setAuthor(wordEnc2);
                cKey.setPublisher(wordEnc3);
                cKey.setYear(wordEnc4);
                
                cList.add(cKey);
                
			}
			adminService.uploadCipherindexKeywords(cList);
			session.setAttribute("cipinbn", cipdatabn);
			session.setAttribute("cipinan", cipdataan);
			session.setAttribute("cipinpn", cipdatapn);
			session.setAttribute("cipiny", cipdatay);
		} catch (IOException e) {			
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(bw!=null)
				try {
					bw.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return null;
		
	}
	@Resource 
	private KeywordRepository keywordRepository;
	
	@RequestMapping (value="listKeyowrds")
	public	@ResponseBody ViewPage<Keyword> listKeyowrds(Pageable page) {
			return new ViewPage<Keyword>(keywordRepository.findAll(page));
	}	
	
	@RequestMapping (value="listninkeyowrds")
	public	@ResponseBody ViewPage<Keyword> listninkeyowrds(Pageable page, HttpSession session) {
		
		ViewPage<Keyword> view = new ViewPage<Keyword>(keywordRepository.findAll(page));
		
		List<Keyword> alt = (List<Keyword>) session.getAttribute("binlist");
		view.setRows(alt);
		return view;
	}	
	@Resource 
	private CipheredKeywordRepository cipheredKeywordRepository;
	@RequestMapping(value="/listencdata")
	public @ResponseBody ViewPage<CipheredKeyword> listencdata(Pageable page){
		return new ViewPage<CipheredKeyword>(cipheredKeywordRepository.findAll(page));
	}
	
	@Resource 
	private CipheredIndexKeywordRepository cipheredIndexKeywordRepository;
	@RequestMapping(value="/listindexencdata")
	public @ResponseBody ViewPage<CipheredKeyword> listIndexencdata(Pageable page){
		return new ViewPage<CipheredKeyword>(cipheredKeywordRepository.findAll(page));
	}
	@Autowired
	UserService userService; 
	
	@RequestMapping (value="requestaccess")
	public String requestaccess(HttpSession session){
		String userName = (String) session.getAttribute("userName");
		
		
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "redirect:login";
		}
		else {
			boolean requested = userService.isAlreadyRequested(userName);
			if(!requested)
				userService.requstUserAccess(userName);
			return "requestAccess";
		}
		
	}
	
	
	@Resource 
	private UserAccessRepository userAccessRepository;
	
	@RequestMapping (value="listallrequest")
	public	@ResponseBody ViewPage<UserAccess> listAllrequest(Pageable page) {
			return new ViewPage<UserAccess>(userAccessRepository.findAll(page));
	}
}
