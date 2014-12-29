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
		<!-- container -->
		<div class="container">
			<!-- content -->
			<div class="4-col-grids">
				<div class="col-md-3">
					<div class="1-col-grids">
						<!----profile---->
						<div class="profile text-center">
							<div class="profile-head1">
								<a href="#"><div> </div></a>
							</div>
							<div class="profile-info">
								<h2><a href="#">${fullName}</a></h2>
								<span>Data Owner | ${user.city} | ${user.country} </span>
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
						<div class="status-head text-left">
								<h3> Binary Data Vector	</h3>
							</div>
							<%-- <div class="status-head text-left">
								<h3> Upload data for books: <span class="btn btn-success fileinput-button">
								        <i class="glyphicon glyphicon-plus"></i>
								        <span>Select files...</span>
								        <!-- The file input field used as target for the file upload widget -->
								        <input id="files" type="file" name="files" multiple>
								    </span> <div id="progress" class="progress">
								        <div class="progress-bar progress-bar-success"></div>
								    </div>
									</h3>
							</div>--%>
							<!---start-chart---->
							<!--graph-->
							<link rel="stylesheet" href="resources/css/jquery-ui.min.css">
							<link rel="stylesheet" href="resources/css/ui.jqgrid.css">
							<link rel="stylesheet" href="resources/css/jquery.treeview.css">
							<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
							<script src="resources/js/jquery.ui.widget.js"></script>
							<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
							<script src="resources/js/jquery.iframe-transport.js"></script>
							<!-- The basic File Upload plugin -->
							<script src="resources/js/jquery.fileupload.js"></script>
							<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
							<script src="resources/js/bootstrap.min.js"></script>
							<script src="resources/js/grid.locale-en.js"></script>
							<script src="resources/js/jquery.jqGrid.min.js"></script>
							<script src="resources/js/jquery-ui.min.js"></script>
							<script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
							<script src="resources/js/jquery.treeview.js"></script>
							<script src="resources/js/jquery.treeview.async.js" type="text/javascript"></script>
							<link rel="stylesheet" href="resources/css/graph.css">
							<script src="resources/js/jquery.flot.min.js"></script>
							<!--//graph-->
									<script>
									$(document).ready(function () {
										$('#bitVector').click(function (){
											$("#tree1").treeview({
												url: "bitvector"
											})
										});
										$('#binVector').click(function (){
											$("#tree1").treeview({
												url: "binaryvector1"
											})
										});
										$('#bitVector1').click(function (){
											$("#tree2").treeview({
												url: "bitvector1"
											})
										});
										$('#binVector1').click(function (){
											$("#tree2").treeview({
												url: "binaryvector2"
											})
										});
									});
									</script>
							<!-- Graph HTML -->
							<div id="graph-wrapper">
								<!-- <div class="graph-container">
									<div id="graph-lines"> </div>
									<div id="graph-bars"> </div>
								</div> -->
								<table id="list" width="100%" class="flatTable">
								
									<tr align="center" class="headingTr">	
						                        <td width="50%">Book Title</td>
						                        <td width="50%">Author Name</td>						                     
						                </tr>
						        
						                <tr class="normalTr" height="300px">
						                        <td width="48%" height="300px" style="position:absolute; overflow:scroll;"><div id="tree1">&nbsp;</div></td>
						                        <td width="48%" height="300px" style="left:310px;position:absolute; overflow:scroll;"><div id="tree2">&nbsp;</div></td>						                     
						                </tr>
						        
						            	<tr align="center" class="headingTr">
						                        <td width="50%"><span id="bitVector" class="btn btn-success">Bit Vector</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="binVector" class="btn btn-success">Binary Vector</span></td>
						                        <td width="50%"><span id="bitVector1" class="btn btn-success">Bit Vector</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="binVector1" class="btn btn-success">Binary Vector</span></td>
						                </tr>
						        		<tr align="center" class="headingTr" valign="bottom">
						                        <td colspan="2" align="right" ><a href="next2binaryvector" class="button blue">Next</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						                </tr>
						        </table>
						        <!-- <div id="pager"><span id="bitVector" class="btn btn-success">Bit Vector</span> </div> -->
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
						<!---- status ---->
						<div class="status">
							<div class="status-head text-left">
								<h3> <div> Search on cloud:
								    <input type="text" name="search" id="search_box" class='searchtext'/>
								    <input type="submit" value="Search" class="styled-button-2" /></div>
									</h3>
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
									
										 $("#list1").jqGrid({
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
								                pager : '#pager1',
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
								        jQuery("#list1").jqGrid('navGrid', '#pager1', {
								                edit : true,
								                add : true,
								                del : true,
								                search : true
								        });
									
									});
									</script>
							<!-- Graph HTML -->
							<div id="graph-wrapper">
								<!-- <div class="graph-container">
									<div id="graph-lines"> </div>
									<div id="graph-bars"> </div>
								</div> -->
								<table id="list1">
						                <tr>
						                        <td />
						                </tr>
						        </table>
						        <div id="pager1"></div>
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
						<!--- socail-btn-col2 ---->
						<div class="socail-btn-col2">
							<ul>
								<li><input class="gl-btn" type="button" value="Facebook" /></li>
								<li><input class="drib-btn" type="button" value="Twitter" /></li>
								<div class="clearfix"> </div>
							</ul>
						</div>
						<!--- socail-btn-col2 ---->
						<!---- copy-right ---->
						<div class="copy-right">
							<p>Template by <a href="http://w3layouts.com/">W3layouts</a></p>
							<iframe src='http://www.flipkart.com/affiliate/displayWidget?affrid=WRID-140845209387668453' height=55 width=660 scrolling='no' frameborder=0></iframe>
						</div>
						<!---- copy-right ---->
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
