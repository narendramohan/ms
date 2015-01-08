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
		<script>
			var value=1000;
		</script>
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
								<h2>Overall v/s Retrieved</h2>
							</div>
							<!----up-load-stats---->
						<div class="up-load-stats">
						<div class="chart">
							<!-----upload-js-files---->
								<script type="text/javascript" src="resources/js/Chart.js"></script>
							<!---//upload-js-files---->
					                <div class="diagram">
					                  <canvas id="canvas" height="210" width="210"> </canvas>
					                  <!-- <h4>40<span>percent</span></h4>   --> 
					                 </div>
									<!-- <div class="chart_list text-left">
						           	  <ul class="list-unstyled text-left">
						           	  	<li><span class="color1"> </span>Pizza<label>40%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color2"> </span>Hamburgers<label>8%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color3"> </span>Bacon<label>15%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color4"> </span>Apple Pie<label>25%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color5"> </span>Small children<label>12%</label><div class="clearfix"> </div></li>
						           	  	<div class="clearfix"> </div>	
						           	  </ul>
						           </div> -->
						           <script>
									/* var doughnutData = [
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
										var myDoughnut = new Chart(document.getElementById("canvas").getContext("2d")).Doughnut(doughnutData);			 */
										var data = {
												labels: ["Overall Data", "Retrieved Data"],
												datasets: [
												{
												fillColor: "rgba(0,26,225,1)",
												data: [1000, value]
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
											var cht = document.getElementById('canvas');
											var ctx = cht.getContext('2d');
											var myDoughnut = new Chart(ctx).Bar(data, options);
								</script>
					          </div>
						</div>
						<!--//up-load-stats---->
						</div>
						<!---- PIE CHART ---->
						<br/>
						<!---- PIE CHART ---->
						<div class="pie-chart">
							<div class="pie-chrt-head">
								<h2>Data Accuracy</h2>
							</div>
							<!----up-load-stats---->
						<div class="up-load-stats">
						<div class="chart">
							<!-----upload-js-files---->
								<script type="text/javascript" src="resources/js/Chart.js"></script>
							<!---//upload-js-files---->
					                <div class="diagram">
					                  <canvas id="canvas1" height="210" width="210"> </canvas>
					                  <!-- <h4>40<span>percent</span></h4>   --> 
					                 </div>
									<!-- <div class="chart_list text-left">
						           	  <ul class="list-unstyled text-left">
						           	  	<li><span class="color1"> </span>Pizza<label>40%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color2"> </span>Hamburgers<label>8%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color3"> </span>Bacon<label>15%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color4"> </span>Apple Pie<label>25%</label><div class="clearfix"> </div></li>
						           	  	<li><span class="color5"> </span>Small children<label>12%</label><div class="clearfix"> </div></li>
						           	  	<div class="clearfix"> </div>	
						           	  </ul>
						           </div> -->
						           <script>
									/* var doughnutData = [
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
										var myDoughnut = new Chart(document.getElementById("canvas").getContext("2d")).Doughnut(doughnutData);			 */
										var data1 = {
												labels: ["Existing", "Proposed"],
												datasets: [
												{
												fillColor: "rgba(0,26,225,1)",
												data: [100, 100]
												}/* ,
												{
												fillColor: "rgba(0,26,225,1)",
												data: [18, 16, 17, 17, 18, 16]
												},
												{
												fillColor: "rgba(24,31,28,0.5)",
												data: [11, 16, 9, 10, 17, 17]
												} */ ] }
										var options1 = /* { 
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
											var cht1 = document.getElementById('canvas1');
											var ctx1 = cht1.getContext('2d');
											var myDoughnut1 = new Chart(ctx1).Bar(data1, options1);
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
							<div class="status-head text-left">
								<script type="text/javascript">
								$(document).ready(function () {
									//create user
									$('#searchbtn').click (function(){
										//document.location.href='createuser';
										var searchon =$("input[id=searchon]:checked").val();
										var searchText = $("input[id=search_box]").val();
										if(!searchText || searchText=='') {
											alert('Please enter some search Text');
										} else {
											var URL = $("#searchForm").attr('action');
											var formData = $("#searchForm").serializeArray();
											$.post(URL,
												formData,
												function(data, textStatus, jqXHR)
												{
													var tmp = eval(data);
													value =tmp.length;
													var data = {
															labels: ["Overall Data", "Retrieved Data"],
															datasets: [
															{
															fillColor: "rgba(0,26,225,1)",
															data: [1000, value]
															}] }
													myDoughnut = new Chart(ctx).Bar(data, options);
													
													var data1 = {
															labels: ["Existing", "Proposed"],
															datasets: [
															{
															fillColor: "rgba(0,26,225,1)",
															data: [70, 80]
															}/* ,
															{
															fillColor: "rgba(0,26,225,1)",
															data: [18, 16, 17, 17, 18, 16]
															},
															{
															fillColor: "rgba(24,31,28,0.5)",
															data: [11, 16, 9, 10, 17, 17]
															} */ ] }
													myDoughnut1 = new Chart(ctx1).Bar(data1, options1);
													var htmlText = '';
													for (i = 0; i < value; i++) {
														htmlText += '<pre><code class="prettyprint">'+tmp[i]+'</code></pre>';
													}
													$("#ajax-form-msg1").html(htmlText);
												}).fail(function(jqXHR, textStatus, errorThrown) 
												{
														$("#ajax-form-msg1").html('<pre><code class="prettyprint">AJAX Request Failed<br/> textStatus='+textStatus+', errorThrown='+errorThrown+'</code></pre>');
												});
										}
											
									});
																								
										
								});	
								
								</script>
								<h3> Search on cloud for books:</h3>
									<div style="background-color: #418a95">
									<form id="searchForm" action="searchbook">
									<p>&nbsp;Select on which you want to search:</p>
									<p>&nbsp;Author Name: <input type="radio" id="searchon" name="searchon" value="author" checked="checked">&nbsp;
									&nbsp;Book Name: <input type="radio" id="searchon" name="searchon" value="title">
									&nbsp;Publisher: <input type="radio" id="searchon" name="searchon" value="publisher">
									&nbsp;Published Year: <input type="radio" id="searchon" name="searchon" value="year"></p>
								    <p>Search text: &nbsp;<input type="text" name="search" id="search_box" class='searchtext'/>&nbsp; <input type="button" id="searchbtn" value="Search" class="styled-button-2" /></p>
								    <p><input type="hidden" ></p>
								    </form>
								    </div>
							</div>
							<!---start-chart---->
							<!--graph-->
							<link rel="stylesheet" href="resources/css/jquery-ui.min.css">
							<link rel="stylesheet" href="resources/css/ui.jqgrid.css">
							
							<script src="resources/js/grid.locale-en.js"></script>
							<script src="resources/js/jquery.jqGrid.min.js"></script>
							<script src="resources/js/jquery-ui.min.js"></script>
							<link rel="stylesheet" href="resources/css/graph.css">
							<script src="resources/js/jquery.flot.min.js"></script>
							<!--//graph-->
									<script>
									$(document).ready(function () {
									
										 /* $("#list").jqGrid({
								                url : "search",
								                datatype : "json",
								                mtype : 'POST',
								                colNames : [ 'Id', 'FirstName', 'LastName', 'City', 'State' ],
								                colModel : [ {
								                        name : 'id',
								                        index : 'id',
								                        width : 100
								                }, {
								                        name : 'firstName',
								                        index : 'firstName',
								                        width : 150,
								                        editable : true
								                }, {
								                        name : 'lastName',
								                        index : 'lastName',
								                        width : 150,
								                        editable : true
								                }, {
								                        name : 'city',
								                        index : 'city',
								                        width : 100,
								                        editable : true
								                }, {
								                        name : 'state',
								                        index : 'state',
								                        width : 100,
								                        editable : true
								                } ],
								                pager : '#pager',
								                rowNum : 10,
								                rowList : [ 10, 20, 30 ],
								                sortname : 'invid',
								                sortorder : 'desc',
								                viewrecords : true,
								                gridview : true,
								                caption : 'Data Report',
								                jsonReader : {
								                        repeatitems : false,
								                },
								                editurl : "search"
								        });
								        jQuery("#list").jqGrid('navGrid', '#pager', {
								                edit : false,
								                add : false,
								                del : false,
								                search : true
								        }); */
									
									});
									</script>
							<!-- Graph HTML -->
							<div id="graph-wrapper" style="background-color:#418a95	">
								<!-- <div class="graph-container">
									<div id="graph-lines"> </div>
									<div id="graph-bars"> </div>
								</div> -->
								<!-- <table id="list">
						                <tr>
						                        <td />
						                </tr>
						        </table> -->
						        Search Results:
						        <div id="ajax-form-msg1"><pre><code class="prettyprint">Nothing to display</code></pre></div>
						        <br/>
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
							<input id="dashbtn" class="dash-btn" type="button" value="Comparison" />
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
