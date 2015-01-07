package com.ms.spring.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class File { 
		  
		MultipartFile file;
		
		public MultipartFile getFile() {
			return file;
		}

		public void setFile(MultipartFile file) {
			this.file = file;
		}	
		
		private List<MultipartFile> files;
		 
	    public List<MultipartFile> getFiles() {
	        return files;
	    }
	 
	    public void setFiles(List<MultipartFile> files) {
	        this.files = files;
	    }
}