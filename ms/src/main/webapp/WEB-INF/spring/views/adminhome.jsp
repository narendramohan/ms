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
								<h3> Upload data for books: <span class="btn btn-success fileinput-button">
								        <i class="glyphicon glyphicon-plus"></i>
								        <span>Select files...</span>
								        <!-- The file input field used as target for the file upload widget -->
								        <input id="files" type="file" name="files" multiple>
								    </span>&nbsp<span id="nestspan" class="btn btn-success">Next >></span> <div id="progress" class="progress">
								        <div class="progress-bar progress-bar-success"></div>
								    </div>
									</h3>
							</div>
							<!---start-chart---->
							<!--graph-->
							<link rel="stylesheet" href="resources/css/jquery-ui.min.css">
							<link rel="stylesheet" href="resources/css/ui.jqgrid.css">
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
							<link rel="stylesheet" href="resources/css/graph.css">
							<script src="resources/js/jquery.flot.min.js"></script>
							<!--//graph-->
									<script>
									$(document).ready(function () {
										$('#nestspan').click (function(){
											document.location.href='nextbinaryvector'
										});
										$(function () {
										    'use strict';
										    // Change this to the location of your server-side upload handler:
										    var url = 'upload';
										    $('#files').fileupload({
										        url: url,
										        dataType: 'json',
										        done: function (e, data) {
										            $.each(data.result.files, function (index, file) {
										                $('<p/>').text(file.name).appendTo('#files');
										            });
										            keywordgrid.trigger('reloadGrid');
										        },
										        progressall: function (e, data) {
										            var progress = parseInt(data.loaded / data.total * 100, 10);
										            $('#progress .progress-bar').css(
										                'width',
										                progress + '%'
										            );
										        },
										        fail: function (e, data) {}
										    }).prop('disabled', !$.support.fileInput)
										        .parent().addClass($.support.fileInput ? undefined : 'disabled');
										});

										 /* $("#list").jqGrid({
								                url : "listKeyowrds",
								                datatype : "json",
								                mtype : 'POST',
								                colNames : [ 'Sl No', 'Book Name', 'Author', 'Publisher', 'Year' ],
								                colModel : [ {
								                        name : 'slno',
								                        index : 'slno',
								                        width : 100
								                }, {
								                        name : 'bookName',
								                        index : 'bookName',
								                        width : 150,
								                        editable : true
								                }, {
								                        name : 'author',
								                        index : 'author',
								                        width : 150,
								                        editable : true
								                }, {
								                        name : 'publisher',
								                        index : 'publisher',
								                        width : 100,
								                        editable : true
								                }, {
								                        name : 'year',
								                        index : 'year',
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
								                editurl : "listKeyowrds"
								        });
								        jQuery("#list").jqGrid('navGrid', '#pager', {
								                edit : true,
								                add : true,
								                del : true,
								                search : true
								        });  */
										$(function() {

											$.extend($.jgrid.defaults, {
														datatype: 'json',
														jsonReader : {
															repeatitems:false,
															total: function(result) {
																//Total number of pages
																return Math.ceil(result.total / result.max);
															},
															records: function(result) {
																//Total number of records
																return result.total;
															}
														},
														prmNames: {
															page: "page.page",
															rows: "page.size",
															sort: "page.sort",
															order: "page.sort.dir"
														},
														sortname: 'slno',
														sortorder: 'asc',
														height: 'auto',
														viewrecords: true,
														rowList: [10, 20, 50, 100],
														altRows: true,
														loadError: function(xhr, status, error) {
															alert(error);
														}
													});

											$.extend($.jgrid.edit, {
														closeAfterEdit: true,
														closeAfterAdd: true,
														ajaxEditOptions: { contentType: "application/json" },
														mtype: 'PUT',
														serializeEditData: function(data) {
															delete data.oper;
															return JSON.stringify(data);
														}
													});
											$.extend($.jgrid.del, {
														mtype: 'DELETE',
														serializeDelData: function() {
															return "";
														}
													});

											var editOptions = {
												onclickSubmit: function(params, postdata) {
													params.url = URL + '/' + postdata.id;
												}
											};
											var addOptions = {mtype: "POST"};
											var delOptions = {
												onclickSubmit: function(params, postdata) {
													params.url = URL + '/' + postdata;
												}
											};

											var URL = 'listKeyowrds';
											var options = {
												url: URL,
												editurl: URL,
												colNames : [ 'Sl No', 'Book Name', 'Author', 'Publisher', 'Year' ],
								                colModel : [ {
								                        name : 'slno',
								                        index : 'slno',
								                        width : 100
								                }, {
								                        name : 'bookName',
								                        index : 'bookName',
								                        width : 150,
								                        editable : false
								                }, {
								                        name : 'author',
								                        index : 'author',
								                        width : 150,
								                        editable : false
								                }, {
								                        name : 'publisher',
								                        index : 'publisher',
								                        width : 100,
								                        editable : false
								                }, {
								                        name : 'year',
								                        index : 'year',
								                        width : 100,
								                        editable : false
								                } ],
												caption: "Books",
												pager : '#pager',
												height: 'auto',
												ondblClickRow: function(id) {
													jQuery(this).jqGrid('editGridRow', id, editOptions);
												}
											};

										var keyworgrid = 	$("#list").jqGrid(options)
													.navGrid('#pager',
													{}, //options
													editOptions,
													addOptions,
													delOptions,
													{} // search options
											);

										});
									});
									</script>
							<!-- Graph HTML -->
							<div id="graph-wrapper">
								<!-- <div class="graph-container">
									<div id="graph-lines"> </div>
									<div id="graph-bars"> </div>
								</div> -->
								<table id="list">
						                <tr>
						                        <td />
						                </tr>
						        </table>
						        <div id="pager"></div>
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
								                edit : false,
								                add : false,
								                del : false,
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
							<input id="createUser" class="gl-btn" type="button" value="Create User" />
							<input id="userAccess" class="drib-btn" type="button" value="User Access" />
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
