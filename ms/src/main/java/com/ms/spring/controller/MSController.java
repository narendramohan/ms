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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




import org.springframework.web.bind.annotation.ResponseBody;

import com.ms.spring.dao.CipheredKeywordRepository;
import com.ms.spring.dao.KeywordRepository;
import com.ms.spring.model.CipheredKeyword;
import com.ms.spring.model.Keyword;
import com.ms.spring.model.LoginForm;
import com.ms.spring.model.User;
import com.ms.spring.service.AdminService;
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
			return "login";
		}
		else if(user!=null && user.getType()==1)  return "adminindex1";
		else return "home";
	}
	@RequestMapping(value="/next2binaryvector", method={RequestMethod.GET, RequestMethod.POST})
	public String binaryvectornext(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){  
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "login";
		}
		else if(user!=null && user.getType()==1)  return "adminindex2";
		else return "home";
	}	
	
	//nextcipher
	
	@RequestMapping(value="/nextcipher", method={RequestMethod.GET, RequestMethod.POST})
	public String nextcipher(HttpSession session, @ModelAttribute("loginForm") LoginForm loginForm){  
		String userName = (String) session.getAttribute("userName");
		User user = (User)session.getAttribute("user");
		//logger.debug("user type"+user.getType());
		if(userName==null || "".equals(userName)){
			return "login";
		}
		else if(user!=null && user.getType()==1)  return "datacip";
		else return "home";
	}	
    public static ArrayList<String> cipdatabn=new ArrayList<>();
    public static ArrayList<String> cipdataan=new ArrayList<>();
    public static ArrayList<String> cipdatapn=new ArrayList<>();
    public static ArrayList<String> cipdatay=new ArrayList<>();
	@RequestMapping(value="/encryptdata")
	public String encryptdata(HttpServletRequest request, HttpSession session){
		List<Keyword> list = adminService.loadKeywords();
		String datakey = request.getParameter("datakey");
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
                adminService.uploadCipherKeywords(cList);
			}
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
	@Resource 
	private KeywordRepository keywordRepository;
	
	@RequestMapping (value="listKeyowrds")
	public	@ResponseBody ViewPage<Keyword> listKeyowrds(Pageable page) {
		 /*List<Keyword> jqGridModels = adminService.loadKeywords();     

	        Gson gson = new GsonBuilder().setPrettyPrinting().create();
	        String jsonArray = gson.toJson(jqGridModels);
	        jsonArray = "{\"page\":1,\"total\":\"2\",\"records\":"
	                + jqGridModels.size() + ",\"rows\":" + jsonArray + "}";

	        System.out.println(jsonArray);
	        ViewPage<Keyword> view = new ViewPage<Keyword>();
	        view.setMax(jqGridModels.size());
	        view.setPage(page.getPageNumber());
	        view.setRows(jqGridModels);
	        view.setTotal(jqGridModels.size());
	        //response.getWriter().print(jsonArray);
*/			return new ViewPage<Keyword>(keywordRepository.findAll(page));
	}	
	
	@Resource 
	private CipheredKeywordRepository cipheredKeywordRepository;
	@RequestMapping(value="/listencdata")
	public @ResponseBody ViewPage<Keyword> listencdata(Pageable page){
		return new ViewPage<Keyword>(cipheredKeywordRepository.findAll(page));
	}
}
