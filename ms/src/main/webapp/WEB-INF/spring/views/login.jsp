<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<link href="resources/css/loginstyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700|Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<!--//webfonts-->
<script>
	function myFunction()
		{
			alert("Thanks for login");
		}
</script>
<title>Login page - Multi Search</title>
</head>
<body>
<div class="main">
		<div class="user">
			<img src="resources/images/user.png" alt="">
		</div>
		<div class="login">
			<div class="inset">
				<!-----start-main---->
				<form:form action="authenticate" name="loginForm" commandName="loginForm" method="POST" >
			         <div>
						<span><label><spring:message code="label.userName" text="default text" /></label></span>
						<span><form:input path="userId" class="textbox" id="active"/></span>
					 </div>
					 <div>
						<span><label><spring:message code="label.passowrd" text="default text" /></label></span>
					    <span><form:password path="password" class="password"/></span>
					 </div>
					<div class="sign">
						<div class="submit">
						  <input type="submit" onclick="myFunction()" value="<spring:message code="label.button.login" text="LOGIN" />" >
						</div>
						<span class="forget-pass">
							<a href="#"><spring:message code="label.link.forgotpwd" text="Forgot pwd"/></a>
						</span>
							<div class="clear"> </div>
					</div>
					</form:form>
				</div>
			</div>
		<!-----//end-main---->
		</div>
		 <!-----start-copyright---->
   					<div class="copy-right">
						<p><spring:message code="label.donthave" text="default text" /> <a href="register"><spring:message code="label.account" text="default text" /></a></p> 
					</div>
				<!-----//end-copyright---->
</body>
</html>