<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<head>
<meta charset="UTF-8" >
<title>Login</title>
<link href="<c:url value="/assets/admin/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="<c:url value="/assets/admin/css/style.css"/>" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="<c:url value="/assets/admin/js/jquery-2.1.1.min.js"/>"></script> 
<script src="<c:url value="/assets/admin/js/dtsel.js"/>"></script> 
<link href="<c:url value="/assets/admin/css/dtsel.css"/>" rel="stylesheet" type="text/css"> 
<!--icons-css-->
<link href="<c:url value="/assets/admin/css/font-awesome.css"/>" rel="stylesheet"> 
<link rel="shortcut icon" href="<c:url value="/assets/user/ico/favicon.ico" />">
</head>
<body>
      <div class="login-page">
    <div class="login-main">  	
    	<div class="pro-head">
    	<br/><br/>
    	<h2 style="text-align:center">Admin Login</h2>
    	</div>
			<div class="login-block">
							<h5 style="color:red;">${statusLogin }</h5>
				<form:form action="/DocuJapan/admin/login" modelAttribute="user">
					<form:input type="text" name="email" placeholder="Email" required="" path="email"/>
					<form:input type="password" name="password" class="lock" placeholder="Password" path="password"/>
					<div class="forgot-top-grids">
						<div class="forgot-grid">
							<ul>
								<li>
									<input type="checkbox" id="brand1" value="">
									<label for="brand1"><span></span>Remember me</label>
								</li>
							</ul>
						</div>
						<div class="forgot">
							<a href="#">Forgot password?</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<input type="submit" name="Sign In" value="Login">	
					<h3>Guest?<a href="/DocuJapan/trang-chu"> Shopping now</a></h3>				
					
				</form:form>
			</div>
      </div>
</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
	 <p>© 2016 Shoppy. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
</div>	
    </body>