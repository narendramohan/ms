<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Create User :: Multi Search</title>
		<link href="resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="resources/js/jquery-1.11.2.js"></script>
		<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
		<script src="resources/js/common.js"></script>
		 <!-- Custom Theme files -->
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<style type="text/css">
			.flatTable{  
			  width:100%;
			  min-width:500px;
			  border-collapse:collapse; 
			  font-size:5; 
			  font-weight:normal;
			  color:#6b6b6b;		
  			}
			.flatTable  tr{
			    height:50px;
			    background:#f6f3f7;
			    border-bottom:rgba(0,0,0,.05) 1px solid;
			  }
			  
			.flatTable  td{    
			    box-sizing:border-box;
			    padding-left:30px;
			 	border-left: 1px solid #ccc;
			    border-top: 1px solid #ccc;   
			    font-size:8pt;
			    font-weight: normal; 
			  }
			
			.flatTable .titleTr{
			  height:70px;  
			  color:#f6f3f7; 
			  background:#418a95;  
			  border:0px solid;
			}
			
			.flatTable .plusTd{
			    background:url(http://i.imgur.com/3hSkhay.png) center center no-repeat, rgba(0,0,0,.1);
			}
			
			.flatTable .controlTd{  
			  position:relative;
			  width:80px;
			  background:url(http://i.imgur.com/9Q5f6cv.png) center center no-repeat;
			  cursor:pointer;
			}
			
			.flatTable .headingTr{
			    height:30px;
			    background:#418a95;
			    color:#f6f3f7; 
			    font-size:8pt;
			    border:0px solid;
			 
			} 
			.flatTable .normalTr{
			    height:30px;
			    background:#418a95;
			    color:#f6f3f7; 
			    font-size:8pt;
			    border:0px solid;
				font-weight: normal; 
			} 
		</style>
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
								<h3> Create User </h3>
							</div>
							<!---start-chart---->
							
									<script>
									$(document).ready(function () {
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
							                    	var serializedData = $("#register").serialize();

							                    	$.ajax({
														url:"saveuser",
														 type: "POST",
													     data: serializedData,
														success:function(result){
															alert(result);
													  }});
							                    }
							                });
										});
										
									});
									</script>
							<!-- Graph HTML -->
							<div id="graph-wrapper">
								<!-- <div class="graph-container">
									<div id="graph-lines"> </div>
									<div id="graph-bars"> </div>
								</div> -->
									<form:form action="" id="register" method="POST" commandName="user">
									<table class="flatTable" style="background-color: buttonface; width: 100%	">
			    						<tr><td><label id="firstName-label" class="textbox" for="firstName">First Name</label></td>		
										<td><form:input path="firstName" id="firstName"  class="active textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/></td></tr>
										<tr><td><label id="lastName-label" class="textbox" for="firstName">Last Name</label></td>
										<td><form:input path="lastName" id="lastName"  class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/></td></tr>
										<tr><td><label id="email-label" class="textbox" for="firstName">Email Address</label></td>
										<td><form:input path="email" id="email"  class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/></td></tr>
										<tr><td><label id="userName-label" class="textbox" for="userName">User Name</label></td>
										<td><form:input path="userName" id="userName"  class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/></td></tr>
										<tr><td><label id="password-label" class="textbox" for="password">Password</label></td>
										<td><form:password path="password" id="password" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/></td></tr>
										<tr><td><label id="confirm_password_label" class="textbox" for="confirm_password">Confirm Password</label></td>
										<td><input type="password" id="confirm_password" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"/><span id="indicator"></span></td></tr>
										<tr><td><label id="confirm_password_label" class="textbox" for="confirm_password">Confirm Password</label></td>
										<td><form:select path="type"><form:option value="0" >User</form:option><form:option value="1" >Admin</form:option></form:select></tr>
										<tr class="flatTable normalTr"><td colspan="2" align="center"><input type="submit" id="submitbtn" class="btn btn-success" value="Create User"></td></tr>
									</table>
									</form:form>
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
							<!-- <div class="status-head text-left">
								<h3> <div> Search on cloud:
								    <input type="text" name="search" id="search_box" class='searchtext'/>
								    <input type="submit" value="Search" class="styled-button-2" /></div>
									</h3>
							</div> -->
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
							            var typerenderer = function (value) {
							                if (value == 1) {
							                    return 'Admin User';
							                }
							                else {
							                    return 'User';
							                }
							            }
										 $("#list1").jqGrid({
								                url : "listuser",
								                datatype : "json",
								                mtype : 'POST',
								                colNames : [ 'User Name', 'First Name', 'Last Name', 'City', 'State', 'Type' ],
								                colModel : [ {
								                        name : 'userName',
								                        index : 'userName',
								                        width : 100
								                }, {
								                        name : 'firstName',
								                        index : 'firstName',
								                        width : 150,
								                        editable : false
								                }, {
								                        name : 'lastName',
								                        index : 'lastName',
								                        width : 150,
								                        editable : false
								                }, {
								                        name : 'city',
								                        index : 'city',
								                        width : 100,
								                        editable : false
								                }, {
								                        name : 'state',
								                        index : 'state',
								                        width : 100,
								                        editable : false
								                }, {
							                        name : 'type',
							                        index : 'type',
							                        width : 100,
							                        editable : false
							                        , formatter: typerenderer
							                } ],
								                pager : '#pager1',
								                rowNum : 10,
								                rowList : [ 10, 20, 30 ],
								                sortname : 'invid',
								                sortorder : 'desc',
								                viewrecords : true,
								                gridview : true,
								                caption : 'Users',
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
							
								<table id="list1">
						                <tr>
						                        <td />
						                </tr>
						        </table>
						        <div id="pager1"></div>
							
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
						</div><br/>
						<!--- subscribe --->
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
