$(document).ready(function () {
	//create user
	$('#createUser').click (function(){
		document.location.href='createuser';
	});
	
	
	//user access
	$('#userAccess').click (function(){
		document.location.href='useraccess';
	});	
	
	//request access "requestAccess"
	$('#requestAccess').click (function(){
		document.location.href='requestaccess';
	});	
	
	$('#dashbtn').click (function(){
		document.location.href='getcomarison';
	});	
	//request access "requestAccess"
	$('#homebtn').click (function(){
		document.location.href='home';
	});	
		
});	
