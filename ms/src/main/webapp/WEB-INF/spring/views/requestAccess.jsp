<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Home :: Multi Search</title>
		<link href="resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="resources/js/jquery-1.11.2.js"></script>
		<script src="resources/js/common.js"></script>
		 <!-- Custom Theme files -->
		 <link rel="stylesheet" href="resources/css/rstyle.css" />
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
		
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		
	</head>
<body>
		<div class="main">
		<!-- container -->
		<div class="container">
			<!-- content -->
			<div class="4-col-grids">
				<div class="col-md-3">
					<div class="1-col-grids">
						<!----profile---->
						<div class="profile text-center">
							<div class="profile-head">
								<a href="#"><span> </span></a>
							</div>
							<div class="profile-info">
								<h2><a href="#">${fullName}</a></h2>
								<span>Data User |${user.city} | ${user.country} </span>
							</div>
						</div>
						
						<!----profile---->
						<!---- PIE CHART ---->
						<div class="pie-chart">
							<div class="pie-chrt-head">
								<h2>PIE CHART</h2>
							</div>
							<!----up-load-stats---->
						<div class="up-load-stats">
						<div class="chart">
							<!-----upload-js-files---->
								<script type="text/javascript" src="resources/js/Chart.js"></script>
							<!---//upload-js-files---->
					                <div class="diagram">
					                  <canvas id="canvas" height="210" width="210"> </canvas>
					                  <h4>40<span>percent</span></h4>   
					                 </div>
									<div class="chart_list text-left">
						           	  <ul class="list-unstyled text-left">
						           	  	<li><span class="color1"> </span>Pizza<label>40%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color2"> </span>Hamburgers<label>8%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color3"> </span>Bacon<label>15%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color4"> </span>Apple Pie<label>25%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color5"> </span>Small children<label>12%</label><div class="clearfix"> </div></li>
						           	  	<div class="clearfix"> </div>	
						           	  </ul>
						           </div>
						           <script>
									var doughnutData = [
											{
												value: 20,
												color:"#7C94BE"
											},
											{
												value : 40,
												color : "#78C8E6"
											},							
											{
												value : 10,
												color : "#00CC0A"
											},	
											{
												value : 30,
												color : "#FF895B"
											},							
										
										];				
										var myDoughnut = new Chart(document.getElementById("canvas").getContext("2d")).Doughnut(doughnutData);					
								</script>
					          </div>
						</div>
						<!--//up-load-stats---->
						</div>
						<!---- PIE CHART ---->
					</div>
				</div>
				<!----col-2---->
				<div class="col-md-6">
					<div class="2-col-grids">
						<!---- status ---->
						<div class="status">
							<div class="tab style-1">
		    					<dl>
		 			              <dd class="messages"><a class="user active" href="#tab1" > </a></dd>
		    						<!--  <dd class="messages"><a class="msg" href="#tab2"> </a></dd>
		    						<dd class="settings"><a class="setting" href="#tab3"> </a></dd>
		    						<dd class="likes"><a class="like" href="#tab4"> </a></dd>  -->
		    					</dl>
		    					<ul>
		    						<li class="active">
					    				<div class="top-grids">
							      			<div class="top-grid1">
							      				<img src="resources/images/like1.png" title="" alt="">
							      			</div>
							      			<div class="top-grid2">
								      			<!-- <a href="#single.html"><h4>Saketh<h4></h4></a> -->
								      			<p><h5>Your access request successfully sent. </h5></p>
							      			</div>
							      			
		      							</div>   		
										<div class="clear"> </div>
									</li>
		    						<li><div class="form">
					    					<%-- <form:form action="register" method="POST" commandName="user">		
												<form:input path="firstName"  class="active textbox" value="First Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'First Name';}"/>
												<form:input path="lastName"  class="textbox" value="Last Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Last Name';}"/>
												<form:input path="email"  class="textbox" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
												<form:input path="userName"  class="textbox" value="User Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
												<form:password path="password" class="textbox" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
												<input type="password" class="textbox" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}"/>
												<input type="submit" value="Register">
												</form:form> --%>
									    </div>
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
						<!---- status ---->
						<!---- option-menu ---->
						<script type='text/javascript' src="resources/js/select.js"></script>
						<div class="option-menu">
							<form action="#">
								<p>
									<select class="turnintodropdown">
										<option>This is an option</option>
											<option>This is another option</option>
							  				<option>And another</option>
							  				<option>And a third one</option>
							  				<option>Wales</option>
							  				<option class="active">We have a lot of options</option>
							  				<option>Don't we, Bruce?</option>
									</select>
								</p>
							</form>
						</div>
						<!----//option-menu ---->

						<!---- copy-right ---->
						<div class="copy-right">							
							<iframe src='http://www.flipkart.com/affiliate/displayWidget?affrid=WRID-140845209387668453' height=55 width=660 scrolling='no' frameborder=0></iframe>
						</div>
						<!---- copy-right ---->
					</div>
				</div>
				<!---//col-2---->
				
				</div>
				<!--- col-4 ---->
				<div class="col-4">
					<div class="col-md-3">
						<!--- subscribe --->
						<div class="subscribe-form">
							<!-- <h4>SUBSCRIBE</h4> -->
							<form action="logout">
								<!-- <input type="text" placeholder="Enter your email" required/>
								<input type="password" placeholder="Enter your password" required/>
								<input type="submit" value="SIGN UP" /> -->
								<button type="submit" class="exit-btn exit-btn-3">Log Out</button>
							</form>
						</div>
						<!--- subscribe --->
						<!--- subscribe --->
						<div class="login-form">
							<h4>LOG IN</h4>
							<form>
								<input type="text" placeholder="Enter your email" required/>
								<input type="password" placeholder="Enter your password" required/>
								<input type="submit" value="SIGN UP" />
							</form>
						</div>
						<!--- subscribe --->
						<br/>	
						<!--- socail-btn-col2 ---->
						<div class="socail-btn-col2">
							<!-- <input id="createUser" class="gl-btn" type="button" value="Create User" home-icon.gif/> -->
							<input id="homebtn" class="home-btn" type="button" value="home" />
								<div class="clearfix"> </div>
							
						</div>
						<!--- socail-btn-col2 ---->
						<!----- social-icons ---->
						<div class="social-icons">
							<ul>
								<li><a class="fa" href="#"><span> </span></a></li>
								<li><a class="gp" href="#"><span> </span></a></li>
								<li><a class="tw" href="#"><span> </span></a></li>
								<li><a class="db" href="#"><span> </span></a></li>
								<div class="clearfix"> </div>
							</ul>
						</div>
						<!----- social-icons ---->
					</div>
				</div>
				<!--- //col-4 ---->
				<div class="clearfix"> </div>
			</div>
			</div>
			<!-- content -->
		</div>
		<!-- container -->
		</div>
	</body>
</html>
