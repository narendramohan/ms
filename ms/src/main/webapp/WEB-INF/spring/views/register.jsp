<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up - Multi Search</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/rstyle.css" />
<script type="text/javascript" src="resources/js/JFCore.js"></script>
		
		<!-- Set here the key for your domain in order to hide the watermark on the web server -->
		<script type="text/javascript">
			(function() {
				JC.init({
					domainKey: ''
				});
				})();
		</script>
</head>
<body>
<div class="wrap">
<!-- tab style-1 -->
<div class="row">
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
			    					<form:form action="register" method="POST" commandName="user">		
										<form:input path="firstName"  class="active textbox" value="First Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'First Name';}"/>
										<form:input path="lastName"  class="textbox" value="Last Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Last Name';}"/>
										<form:input path="email"  class="textbox" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
										<form:input path="userName"  class="textbox" value="User Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
										<form:password path="password" class="textbox" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
										<input type="password" class="textbox" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
										<input type="submit" value="Register">
										</form:form>
							    </div>
							</li>
    						<li><div class="top-grids">
					      			<div class="top-grid1">
					      				<img src="images/f1.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Saketh<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f2.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Amar<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f3.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Akil<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f4.jpg" title="" alt="">
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
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Profile</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Edit</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Create Account</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Login</h5></a>
	    							<a href="#single.html"><h5><img src="images/arrow1.png" title="" alt="">Signup</h5></a>
    							</div>
    						</li>
    						<li>
					    		<div class="top-grids">
					      			<div class="top-grid1">
					      				<img src="images/f1.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Saketh<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f2.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Amar<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f3.jpg" title="" alt="">
					      			</div>
					      			<div class="top-grid2">
						      			<a href="#single.html"><h4>Akil<h4></h4></a>
						      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
					      			</div>
					      			 <div class="top-grid1">
					      				<img src="images/f4.jpg" title="" alt="">
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
</body>
</html>