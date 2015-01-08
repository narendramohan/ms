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
								<h2>Demo PIE CHART</h2>
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
							<!---- PIE CHART ---->
						<div class="pie-chart">
							<div class="pie-chrt-head">
								<h2>Demo PIE CHART</h2>
							</div>
							<!----up-load-stats---->
						<div class="up-load-stats">
						<div class="chart">
							<!-----upload-js-files---->
								<script type="text/javascript" src="resources/js/Chart.js"></script>
							<!---//upload-js-files---->
					                <div class="diagram">
					                  <canvas id="canvas1" height="210" width="550"> </canvas>
					                 
					                 </div>
									
						           <script>
									
									var data = {
											labels: ["Overall Data", "Retrieved Data"],
											datasets: [
											{
											fillColor: "rgba(0,26,225,1)",
											data: [1000, 16]
											}/* ,
											{
											fillColor: "rgba(0,26,225,1)",
											data: [18, 16, 17, 17, 18, 16]
											},
											{
											fillColor: "rgba(24,31,28,0.5)",
											data: [11, 16, 9, 10, 17, 17]
											} */ ] }
									var options = /* { 
											scaleOverlay: true,
											scaleShowGridLines: true,
											scaleOverride: true,
											scaleSteps: 4,
											scaleStepWidth: 5,
											scaleStartValue: 0,
											scaleLineColor: "rgba(0,0,0,.1)",
											scaleLineWidth: 1,
											scaleShowLabels: true,
											scaleFontSize: 16,
											scaleFontColor: "#000",
											barDatasetSpacing: 2,
											barStrokeWidth: 2
										} */{
										    //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
										    scaleBeginAtZero : true,

										    //Boolean - Whether grid lines are shown across the chart
										    scaleShowGridLines : true,

										    //String - Colour of the grid lines
										    scaleGridLineColor : "rgba(0,0,0,.05)",

										    //Number - Width of the grid lines
										    scaleGridLineWidth : 1,

										    //Boolean - Whether to show horizontal lines (except X axis)
										    scaleShowHorizontalLines: true,

										    //Boolean - Whether to show vertical lines (except Y axis)
										    scaleShowVerticalLines: true,

										    //Boolean - If there is a stroke on each bar
										    barShowStroke : true,

										    //Number - Pixel width of the bar stroke
										    barStrokeWidth : 2,

										    //Number - Spacing between each of the X value sets
										    barValueSpacing : 5,

										    //Number - Spacing between data sets within X values
										    barDatasetSpacing : 1,

										    //String - A legend template
										    legendTemplate : "<ul class=\"test-legend\"></ul>"

										};
										var cht = document.getElementById('canvas1');
										var ctx = cht.getContext('2d');
										var myDoughnut = new Chart(ctx).Bar(data, options);
										//var myDoughnut = new Chart(document.getElementById("canvas").getContext("2d")).Doughnut(doughnutData);		
										// Get the context of the canvas element we want to select
										//var ctx = document.getElementById("canvas").getContext("2d");
										//var myBarChart = new Chart(ctx).Bar(data, barOptions);
								</script>
					          </div>
						</div>
						<!--//up-load-stats---->
						</div>
						<!---- PIE CHART ---->
							
							<!---//End-chart---->
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
							<!-- <input id="createUser" class="gl-btn" type="button" value="Create User" /> -->
							<input id="requestAccess" class="drib-btn" type="button" value="Request Access" />
							<input id="home" class="home-btn" type="button" value="Home" />
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
