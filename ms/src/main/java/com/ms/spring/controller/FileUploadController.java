package com.ms.spring.controller;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.swing.table.DefaultTableModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ms.spring.model.File;
import com.ms.spring.model.Keyword;
import com.ms.spring.service.AdminService;
import com.ms.spring.validator.FileValidator;

@Controller
public class FileUploadController {
	
    
    public @ResponseBody String provideUploadInfo() {
        return "You can upload a file by posting to this same URL.";
    }

    
    public @ResponseBody String handleFileUpload(HttpServletRequest request){
        /*if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(name + "-uploaded")));
                stream.write(bytes);
                stream.close();
                return "You successfully uploaded " + name + " into " + name + "-uploaded !";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }*/
    	request.getParameter("name");
    	return "true";
    }
    @Autowired
	FileValidator validator;

    @Autowired
    AdminService adminService;
    
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String getForm(Model model) {
		File fileModel = new File();
		model.addAttribute("file", fileModel);
		return "file";
	}

	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public @ResponseBody String fileUploaded(Model model, File file,
			BindingResult result, HttpServletRequest request) {
		 String saveDirectory = "c:/temp/ms/";
		String returnVal = "successFile";
		 List<MultipartFile> crunchifyFiles = file.getFiles();
		 
	        List<String> fileNames = new ArrayList<String>();
	 
	        if (null != crunchifyFiles && crunchifyFiles.size() > 0) {
	            for (MultipartFile multipartFile : crunchifyFiles) {
	 
	                String fileName = multipartFile.getOriginalFilename();
	                
	                String contentType = multipartFile.getContentType();
	                if (!"".equalsIgnoreCase(fileName) && "text/plain".equalsIgnoreCase(contentType)) {
	                    // Handle file content - multipartFile.getInputStream()
	                    try {
							multipartFile.transferTo(new java.io.File(saveDirectory + fileName));
							FileInputStream fstream = new FileInputStream(new java.io.File(saveDirectory + fileName));
				            DataInputStream in = new DataInputStream(fstream);
				            BufferedReader br = new BufferedReader(new InputStreamReader(in));
				            String strLine = "";
				            int j = 1;
				            Keyword keyword = null;
				            List<Keyword> list = new ArrayList<>();
				            while ((strLine = br.readLine()) != null) {
				                StringTokenizer st = new StringTokenizer(strLine, ";");
				                while (st.hasMoreTokens()) {
				                	
				                    String slno = st.nextToken();
				                    String bookName = st.nextToken();
				                    String author = st.nextToken();
				                    String year = st.nextToken();
				                    String publisher = st.nextToken();
				                    slno = slno.substring(1, slno.length() - 1);
				                    bookName = bookName.substring(1, bookName.length() - 1);
				                    author = author.substring(1, author.length() - 1);
				                    publisher = publisher.substring(1, publisher.length() - 1);
				                    keyword = new Keyword();
				                	keyword.setAuthor(author);
				                	keyword.setBookName(bookName);
				                	keyword.setPublisher(publisher);
				                	keyword.setSlno(slno);
				                	keyword.setYear(year);
				                	list.add(keyword);
				                   // String se = j + "," + s2 + "," + s3 + "," + s5 + "," + s4;
				                    //st1.executeUpdate("INSERT INTO keyword VALUES('" + j + "','" + s2 + "','" + s3 + "','" + s5 + "','" + s4 + "')");
				                    break;
				                }
				                j++;
				            }
				            adminService.uploadKeywords(list);
				            
				            
				            
				            //DefaultTableModel model1 = new DefaultTableModel();
				           // model1.addColumn("Id");
				           // model1.addColumn("Title");
				           // model1.addColumn("Author");
				          //  model1.addColumn("Publisher");
				          //  model1.addColumn("Year");
				           // jTable1.setModel(model1);
				            //Class.forName(driver);
				            //con = DriverManager.getConnection(url + db, user, pass);
				           // con.setAutoCommit(false);
				           // st2 = con.createStatement();
				           // rs = st2.executeQuery("SELECT * FROM keyword");
				           /* int i = 0;
				            while (rs.next()) {
				                model1.insertRow(i, new Object[]{"", ""});
				                String s1 = rs.getString(1);
				                model1.setValueAt(s1, i, 0);
				                String s2 = rs.getString(2);
				                model1.setValueAt(s2, i, 1);
				                String s3 = rs.getString(3);
				                model1.setValueAt(s3, i, 2);
				                String s4 = rs.getString(4);
				                model1.setValueAt(s4, i, 3);
				                String s5 = rs.getString(5);
				                model1.setValueAt(s5, i++, 4);
				                System.out.println(s5.getBytes());
				            }*/
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
	                    fileNames.add(fileName);
	                }
	            }
	        }
	 
	        model.addAttribute("files", fileNames);
		/*if (result.hasErrors()) {
			returnVal = "file";
		} else {			
			MultipartFile multipartFile = file[0].getFile();
		}*/
		return returnVal;
	}
}