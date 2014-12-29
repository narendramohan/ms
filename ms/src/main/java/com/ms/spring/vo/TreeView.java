package com.ms.spring.vo;

import java.util.List;

public class TreeView {
	String text;
	List<TreeView> children;
	boolean expanded;
	String classes;
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<TreeView> getChildren() {
		return children;
	}
	public void setChildren(List<TreeView> children) {
		this.children = children;
	}
	public boolean isExpanded() {
		return expanded;
	}
	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	@Override
	public String toString() {
		return "{\"text\":\"" + text+"\"" + (expanded==true?", \"expanded\":" + expanded:"") + (classes!=null?", \"classes\":\"" + classes+"\"":"")+ (children!=null?", \"children\":" + children:"") + "}";
	}	
	
}

/*
  
 [
	{
		\"text\": \"1. Pre Lunch (120 min)\",
		\"expanded\": true,
		\"classes\": \"important\",
		\"children\":
		[
			{
				\"text\": \"1.1 The State of the Powerdome (30 min)\"
			},
		 	{
				\"text\": \"1.2 The Future of jQuery (30 min)\"
			},
		 	{
				\"text\": \"1.2 jQuery UI - A step to richnessy (60 min)\"
			}
		]
	},
	{
		\"text\": \"2. Lunch  (60 min)\"
	},
	{
		\"text\": \"3. After Lunch  (120+ min)\",
		\"children\":
		[
			{
				\"text\": \"3.1 jQuery Calendar Success Story (20 min)\"
			},
		 	{
				\"text\": \"3.2 jQuery and Ruby Web Frameworks (20 min)\"
			},
		 	{
				\"text\": \"3.3 Hey, I Can Do That! (20 min)\"
			},
		 	{
				\"text\": \"3.4 Taconite and Form (20 min)\"
			},
		 	{
				\"text\": \"3.5 Server-side JavaScript with jQuery and AOLserver (20 min)\"
			},
		 	{
				\"text\": \"3.6 The Onion: How to add features without adding features (20 min)\",
				\"id\": \"36\",
				\"hasChildren\": true
			},
		 	{
				\"text\": \"3.7 Visualizations with JavaScript and Canvas (20 min)\"
			},
		 	{
				\"text\": \"3.8 ActiveDOM (20 min)\"
			},
		 	{
				\"text\": \"3.8 Growing jQuery (20 min)\"
			}
		]
	}
]
*/