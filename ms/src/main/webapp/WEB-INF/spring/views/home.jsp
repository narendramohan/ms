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
		 <!-- Custom Theme files -->
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		
	</head>
	<body>
		<div class="main">
		<!----container---->
		<div class="container">
			<!----- content ----->
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
								<span>${user.city} | ${user.country} </span>
							</div>
						</div>
						<!----profile---->
						<!---- to-day --->
						<div class="to-day text-center">
							<h3>TODAY</h3>
							<h1>3</h1>
							<span>of July 2014</span>
						</div>
						<!---- to-day --->
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
				<div class="col-md-3">
					<div class="2-col-grids">
						<%-- <!---- status ---->
						<div class="status">
							<div class="status-head text-center">
								<h3>JULY STATS</h3>
							</div>
							<!---start-chart---->
							<!--graph-->
							<link rel="stylesheet" href="resources/css/graph.css">
							<script src="resources/js/jquery.flot.min.js"></script>
							<!--//graph-->
									<script>
									$(document).ready(function () {
									
										// Graph Data ##############################################
										var graphData = [{
												// Returning Visits
												data: [ [6, 4500], [7,3500], [8, 6550], [9, 7600], ],
												color: '#59676B',
												points: { radius: 4, fillColor: '#59676B' }
											}
										];
									
										// Lines Graph #############################################
										$.plot($('#graph-lines'), graphData, {
											series: {
												points: {
													show: true,
													radius: 1
												},
												lines: {
													show: true
												},
												shadowSize: 0
											},
											grid: {
												color: '#59676B',
												borderColor: 'transparent',
												borderWidth: 10,
												hoverable: true
											},
											xaxis: {
												tickColor: 'transparent',
												tickDecimals: false
											},
											yaxis: {
												tickSize: 1200
											}
										});
									
										// Bars Graph ##############################################
										$.plot($('#graph-bars'), graphData, {
											series: {
												bars: {
													show: true,
													barWidth: .9,
													align: 'center'
												},
												shadowSize: 0
											},
											grid: {
												color: '#fff',
												borderColor: 'transparent',
												borderWidth: 20,
												hoverable: true
											},
											xaxis: {
												tickColor: 'transparent',
												tickDecimals: 2
											},
											yaxis: {
												tickSize: 1000
											}
										});
									
										// Graph Toggle ############################################
										$('#graph-bars').hide();
									
										$('#lines').on('click', function (e) {
											$('#bars').removeClass('active');
											$('#graph-bars').fadeOut();
											$(this).addClass('active');
											$('#graph-lines').fadeIn();
											e.preventDefault();
										});
									
										$('#bars').on('click', function (e) {
											$('#lines').removeClass('active');
											$('#graph-lines').fadeOut();
											$(this).addClass('active');
											$('#graph-bars').fadeIn().removeClass('hidden');
											e.preventDefault();
										});
									
										// Tooltip #################################################
										function showTooltip(x, y, contents) {
											$('<div id="tooltip">' + contents + '</div>').css({
												top: y - 16,
												left: x + 20
											}).appendTo('body').fadeIn();
										}
									
										var previousPoint = null;
									
										$('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
											if (item) {
												if (previousPoint != item.dataIndex) {
													previousPoint = item.dataIndex;
													$('#tooltip').remove();
													var x = item.datapoint[0],
														y = item.datapoint[1];
														showTooltip(item.pageX, item.pageY, y+ x );
												}
											} else {
												$('#tooltip').remove();
												previousPoint = null;
											}
										});
									
									});
									</script>
							<!-- Graph HTML -->
							<div id="graph-wrapper">
								<div class="graph-container">
									<div id="graph-lines"> </div>
									<div id="graph-bars"> </div>
								</div>
							</div>
							<!-- end Graph HTML -->
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
					</div> --%>
				</div>
				<!---//col-2---->
				<!--- col-3 ---->
				<div class="col-md-3">
					<div class="col-3">
						<!---- to-day --->
						<!-- <div class="to-day text-center">
							<h3>TODAY</h3>
							<h1>3</h1>
							<span>of July 2014</span>
						</div>
						-- to-day -
						-- calender --
						<div class="calender">
							<div class="example1" style="margin:0 auto"> </div>
							<script src="resources/js/jquery.supercal.js"></script> 
							<script>
										$('.example1').supercal({
											transition: 'carousel-vertical'
										});
							</script>

						</div>
						-- calender --
						<div class="clearfix"> </div>
						- socail-btn-col1 --
						<div class="socail-btn-col1">
							<ul>
								<li><input class="face-btn" type="button" value="Facebook" /></li>
								<li><input class="twi-btn" type="button" value="Twitter" /></li>
								<div class="clearfix"> </div>
							</ul>
						</div> -->
						<!--- socail-btn-col1 ---->
					</div>
				<!--- //col-3 ---->
				</div>
				<!--- col-4 ---->
				<div class="col-4">
					<div class="col-md-3">
						<!--- subscribe --->
						<%-- <div class="subscribe-form">
							<h4>SUBSCRIBE</h4>
							<form>
								<input type="text" placeholder="Enter your email" required/>
								<input type="password" placeholder="Enter your password" required/>
								<input type="submit" value="SIGN UP" />
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
						<!--- socail-btn-col2 ---->
						<div class="socail-btn-col2">
							<ul>
								<li><input class="gl-btn" type="button" value="Facebook" /></li>
								<li><input class="drib-btn" type="button" value="Twitter" /></li>
								<div class="clearfix"> </div>
							</ul>
						</div> --%>
						<!--- socail-btn-col2 ---->
						<!---- copy-right ---->
						<!-- <div class="copy-right">
							<p>Multi-search <a href="home">Home</a></p>
						</div> -->
						<!---- copy-right ---->
					</div>
				</div>
				<!--- //col-4 ---->
				<div class="clearfix"> </div>
			</div>
			</div>
			<!----- content ----->
		</div>
		<!----container---->
		</div>
	</body>
</html>
