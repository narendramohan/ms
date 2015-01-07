<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#indicator{
    width:20px;
    height:20px;
    display:block;
    border-radius:10px;
}
.green{
    background-color:green; 
    display:block;
}
.red{
    background-color:red;   
    display:block;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up - Multi Search</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/rstyle.css" />
<script type="text/javascript" src="resources/js/JFCore.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
		
		<!-- Set here the key for your domain in order to hide the watermark on the web server -->
		<script type="text/javascript">
			(function() {
				JC.init({
					domainKey: ''
				});
				})();
			
			$(document).ready(function(e) {  
			$(function() {
				$("#register").validate({
                    rules: {
                    	firstName: {
                            required: true
                        }
						, lastName: { required:true}
						, email: { required:true,email:true}
						, userName: { required:true}
						, password: { required:true}
						, confirm_password : { required:true,equalTo:'#passowrd'}
                    },
                    messages: {
                    	firstName: {
                            required: "* First Name required<br/>",
                            color:'red'
                        }
	                    ,
	                    lastName: "* Please enter your last name",
	                    password: {
	                        required: "* Please provide a password"
	                    },
	                    userName: "* Please enter your user name",
	                    email: "* Please enter a valid email address",
	                    confirm_password: "* Passwor and confirm password are different"
                    },	
                    submitHandler: function(form) {
                        form.submit();
                    }
                });
			});
				
				$('#confirm_password').keyup(function(){
				    var pass    =   $('#password').val();
				    var cpass   =   $('#confirm_password').val();
				    if(pass!=cpass){
				        $('#indicator').attr({class:'red'});
				        $('#regbtn').attr({disabled:true});
				    }
				    else{
				        $('#indicator').attr({class:'green'});
				        $('#regbtn').attr({disabled:false});
				    }
				});
			});
		</script>
</head>
<body>
<div class="wrap">
<!-- tab style-1 -->
<div class="row">
	<h2 class="active textbox">Sign up - Multi Search</h2>
	<div class="grid_12 columns">
		<div class="tab style-1">
    					<dl>
 			              <dd class="users"><a class="user active" href="#tab1" > </a></dd>
    						<!-- <dd class="messages"><a class="msg" href="#tab2"> </a></dd>
    						<dd class="settings"><a class="setting" href="#tab3"> </a></dd>
    						<dd class="likes"><a class="like" href="#tab4"> </a></dd> -->
    					</dl>
    					<ul>
    						<li class="active">
			    				<div class="form">
			    					<form:form action="register" id="register" method="POST" commandName="user">
			    						<label id="firstName-label" class="textbox" for="firstName">First Name</label>		
										<form:input path="firstName" id="firstName"  class="active textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
										<label id="lastName-label" class="textbox" for="firstName">Last Name</label>
										<form:input path="lastName" id="lastName"  class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
										<label id="email-label" class="textbox" for="firstName">Email Address</label>
										<form:input path="email" id="email"  class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
										<label id="userName-label" class="textbox" for="userName">User Name</label>
										<form:input path="userName" id="userName"  class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
										<label id="password-label" class="textbox" for="password">Password</label>
										<form:password path="password" id="password" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/>
										<label id="confirm_password_label" class="textbox" for="confirm_password">Confirm Password</label>
										<input type="password" id="confirm_password" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/><span id="indicator"></span>
										<input type="submit" id="regbtn" value="Register">
									</form:form>
							    </div>
							</li>
    						<li><div class="top-grids">
					      			<div class="top-grid1">
					      				<img src="resources/images/f1.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Saketh<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="resources/images/f2.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Amar<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="resources/images/f3.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Akil<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="resources/images/f4.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Naveen<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
      							</div>   		
								<div class="clear"> </div>
							</li>
    						<li>
    							<div class="settings">
	    							<h5><a href="#single.html"><img src="resources/images/arrow1.png" title="" alt="">Profile</a></h5>
	    							<h5><a href="#single.html"><img src="resources/images/arrow1.png" title="" alt="">Edit</a></h5>
	    							<h5><a href="#single.html"><img src="resources/images/arrow1.png" title="" alt="">Create Account</a></h5>
	    							<h5><a href="#single.html"><img src="resources/images/arrow1.png" title="" alt="">Login</a></h5>
	    							<h5><a href="#single.html"><img src="resources/images/arrow1.png" title="" alt="">Signup</a></h5>
    							</div>
    						</li>
    						<li>
					    		<div class="top-grids">
					      			<div class="top-grid1">
					      				<img src="resources/images/f1.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Saketh<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="resources/images/f2.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Amar<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="resources/images/f3.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Akil<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="resources/images/f4.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Naveen<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      		</div>    		
								<div class="clear"> </div>
    						</li>
    					</ul>
		</div>
</div>            
</div>			
</div>
<div class="wrap">
	<!--footer-->
<div class="footer">
	<p>You have already account <a href="login">Login here!</a></p>
</div>
<div class="clear"> </div>
</div>
<!---- copy-right ---->
<div class="copy-right">							
	<iframe src='http://www.flipkart.com/affiliate/displayWidget?affrid=WRID-140845209387668453' height=55 width=660 scrolling='no' frameborder=0></iframe>
</div>
<!---- copy-right ---->
</body>
</html>